import React, { useState, useEffect } from "react";
import { getClasesDelDia } from "../services/claseService";
import { getAsistenciasPorClase } from "../services/asistenciaService";
import { getEstudiantesPorCurso } from "../services/estudianteService";
import "./Asistencia.css";
import { marcarAsistencia } from "../services/asistenciaService";


function Asistencia() {
  const [fecha, setFecha] = useState("");
  const [clasesDelDia, setClasesDelDia] = useState([]);
  const [claseSeleccionada, setClaseSeleccionada] = useState("");
  const [modo, setModo] = useState(""); // "consulta" o "registro"
  const [resultado, setResultado] = useState(null);
  const [estudiantesParaAsistencia, setEstudiantesParaAsistencia] = useState([]);
  const [asistenciasFormulario, setAsistenciasFormulario] = useState({});

  useEffect(() => {
    if (!fecha) {
      setClasesDelDia([]);
      setClaseSeleccionada("");
      setModo("");
      setResultado(null);
      return;
    }

    const cargarClasesDelDia = async () => {
      try {
        
        const res = await getClasesDelDia(fecha);
        setClasesDelDia(res.data.clases);
      } catch (error) {
        console.error("Error al obtener clases:", error);
      }
    };

    cargarClasesDelDia();
  }, [fecha]);

  const handleSeleccionClase = async (claseId) => {
    setClaseSeleccionada(claseId);
    setResultado("cargando");

    try {
      

      const asistenciasRes = await getAsistenciasPorClase(claseId);
      const asistencias = asistenciasRes.data.asistencias;

      if (asistencias.length > 0) {
        setModo("consulta");
        setResultado(asistencias);
      } else {
        const claseInfo = clasesDelDia.find((c) => c.id === parseInt(claseId));
        setModo("registro");

        const estudiantesRes = await getEstudiantesPorCurso(claseInfo.curso_id);
        setEstudiantesParaAsistencia(estudiantesRes.data.estudiantes);

        const estados = {};
        estudiantesRes.data.estudiantes.forEach((est) => {
          estados[est.id] = 1; // Por defecto todos presentes
        });
        setAsistenciasFormulario(estados);

        setResultado(claseInfo);
      }
    } catch (error) {
      console.error("Error al seleccionar clase:", error);
      alert("Error al cargar datos de la clase.");
      setResultado(null);
    }
  };

  return (
    <div className="asistencia-container">
      <h2>Gestión de Asistencia</h2>

      <div className="filtros-asistencia">
        <input
          type="date"
          value={fecha}
          onChange={(e) => setFecha(e.target.value)}
        />

        {}
        <select
          value={claseSeleccionada}
          onChange={(e) => handleSeleccionClase(e.target.value)}
          disabled={clasesDelDia.length === 0}
        >
          <option value="">Seleccione clase</option>
          {clasesDelDia.map((cl) => (
            <option key={cl.id} value={cl.id}>
              {cl.curso?.nombre} - {cl.asignatura?.nombre_asignatura}
            </option>
          ))}
        </select>
      </div>

      <div className="resultados-asistencia">
        {resultado === "cargando" && <p>Cargando datos...</p>}

        {modo === "consulta" && Array.isArray(resultado) && (
          <div>
            <h3>Asistencias registradas:</h3>
            <table>
              <thead>
                <tr>
                  <th>Estudiante</th>
                  <th>Estado</th>
                </tr>
              </thead>
              <tbody>
                {resultado.map((a) => (
                  <tr key={a.id}>
                    <td>
                      {a.estudiante?.nombre} {a.estudiante?.apellido}
                    </td>
                    <td>{a.estado === 1 ? "Presente" : "Ausente"}</td>
                  </tr>
                ))}
              </tbody>
            </table>
          </div>
        )}

        {modo === "registro" &&
          resultado !== null &&
          resultado !== "cargando" && (
            <div>
              <h3>Registrar asistencia:</h3>
              <form
                onSubmit={async (e) => {
                  e.preventDefault();
                  

                  try {
                    for (const estudiante_id of Object.keys(
                      asistenciasFormulario
                    )) {
                      const estado = asistenciasFormulario[estudiante_id];

                      await marcarAsistencia({
                      clase_id: resultado.id,
                      estudiante_id,
                      estado,
                      });
                    }

                    alert("✅ Asistencia registrada correctamente");
                    setResultado(null);
                    setModo("");
                    setClaseSeleccionada("");
                  } catch (error) {
                    console.error("Error al guardar asistencia:", error);
                    alert("Ocurrió un error al registrar la asistencia.");
                  }
                }}
              >
                <table>
                  <thead>
                    <tr>
                      <th>Estudiante</th>
                      <th>Estado</th>
                    </tr>
                  </thead>
                  <tbody>
                    {estudiantesParaAsistencia.map((est) => (
                      <tr key={est.id}>
                        <td>
                          {est.nombre} {est.apellido}
                        </td>
                        <td>
                          <select
                            value={asistenciasFormulario[est.id]}
                            onChange={(e) =>
                              setAsistenciasFormulario((prev) => ({
                                ...prev,
                                [est.id]: parseInt(e.target.value),
                              }))
                            }
                          >
                            <option value={1}>Presente</option>
                            <option value={0}>Ausente</option>
                          </select>
                        </td>
                      </tr>
                    ))}
                  </tbody>
                </table>
                <button type="submit">Guardar asistencia</button>
              </form>
            </div>
          )}
      </div>
    </div>
  );
}

export default Asistencia;
