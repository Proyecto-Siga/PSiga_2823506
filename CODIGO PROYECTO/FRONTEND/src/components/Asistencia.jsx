import React, { useState, useEffect } from "react";
import { obtenerCursos } from "../services/cursoService";
import { getAsignatura } from "../services/asignaturaService";
import { buscarClaseDocente } from "../services/claseService";
import { getAsistenciasPorClase } from "../services/asistenciaService";
import { getEstudiantesPorCurso } from "../services/estudianteService";
import "./Asistencia.css";

function Asistencia() {
  const [fecha, setFecha] = useState("");
  const [curso, setCurso] = useState("");
  const [asignatura, setAsignatura] = useState("");
  const [modo, setModo] = useState(""); // "consulta" o "registro"
  const [resultado, setResultado] = useState(null);
  const [estudiantesParaAsistencia, setEstudiantesParaAsistencia] = useState([]);
const [asistenciasFormulario, setAsistenciasFormulario] = useState({});

  const [cursosDisponibles, setCursosDisponibles] = useState([]);
  const [asignaturasDisponibles, setAsignaturasDisponibles] = useState([]);

  useEffect(() => {
    const cargarDatos = async () => {
      try {
        const cursosRes = await obtenerCursos();
        const asignaturasRes = await getAsignatura();
        setCursosDisponibles(cursosRes.data.cursos);
        setAsignaturasDisponibles(asignaturasRes.data.asignaturas);
      } catch (error) {
        console.error("Error al cargar cursos o asignaturas", error);
      }
    };

    cargarDatos();
  }, []);

const handleBuscar = async () => {
  if (!fecha || !curso || !asignatura) {
    alert("Selecciona todos los campos.");
    return;
  }

  setModo("consulta");
  setResultado("cargando");

  try {
    const token = localStorage.getItem("token");
    const res = await buscarClaseDocente(fecha, curso, asignatura, token);
    const clase = res.data.clase;

    const asistenciasRes = await getAsistenciasPorClase(clase.id);
    const asistencias = asistenciasRes.data.asistencias;

    setResultado(asistencias); // aquí guardamos directamente la lista de asistencias
  } catch (error) {
    console.error("Error al buscar clase o asistencias:", error);
    alert("No se encontró ninguna clase o asistencia para los datos seleccionados.");
    setResultado(null);
  }
};


const handleRegistrar = async () => {
  if (!fecha || !curso || !asignatura) {
    alert("Selecciona todos los campos.");
    return;
  }

  setModo("registro");
  setResultado("cargando");

  try {
    const token = localStorage.getItem("token");
    const res = await buscarClaseDocente(fecha, curso, asignatura, token);
    const clase = res.data.clase;

    // Obtener estudiantes del curso
    const estudiantesRes = await getEstudiantesPorCurso(clase.curso_id);
    setEstudiantesParaAsistencia(estudiantesRes.data.estudiantes);

    // Inicializar estados (por defecto: presente)
    const estados = {};
    estudiantesRes.data.estudiantes.forEach(est => {
      estados[est.id] = 1;
    });
    setAsistenciasFormulario(estados);

    // Guardamos la clase
    setResultado(clase);
  } catch (error) {
    console.error("Error al registrar asistencia:", error);
    alert("No se encontró ninguna clase o estudiantes.");
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

        <select value={curso} onChange={(e) => setCurso(e.target.value)}>
          <option value="">Seleccione curso</option>
          {cursosDisponibles.map((c) => (
            <option key={c.id} value={c.id}>
              {c.nombre}
            </option>
          ))}
        </select>

        <select
          value={asignatura}
          onChange={(e) => setAsignatura(e.target.value)}
        >
          <option value="">Seleccione asignatura</option>
          {asignaturasDisponibles.map((a) => (
            <option key={a.id} value={a.id}>
              {a.nombre_asignatura}
            </option>
          ))}
        </select>

        <button onClick={handleBuscar}>Buscar</button>
        <button onClick={handleRegistrar}>Registrar asistencia</button>
      </div>

      <div className="resultados-asistencia">
        {resultado === "cargando" && <p>Cargando datos...</p>}

{modo === "consulta" && Array.isArray(resultado) && (
  <div>
    <h3>Asistencias encontradas:</h3>
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
            <td>{a.estudiante?.nombre} {a.estudiante?.apellido}</td>
            <td>{a.estado === 1 ? "Presente" : "Ausente"}</td>
          </tr>
        ))}
      </tbody>
    </table>
  </div>
)}

        {modo === "registro" && resultado !== null && resultado !== "cargando" && (
  <div>
    <h3>Registrar asistencia:</h3>
    <form
      onSubmit={async (e) => {
        e.preventDefault();
        const token = localStorage.getItem("token");

        try {
          for (const estudiante_id of Object.keys(asistenciasFormulario)) {
            const estado = asistenciasFormulario[estudiante_id];

            await fetch("http://localhost:8000/api/marcar-asistencia", {
              method: "POST",
              headers: {
                "Content-Type": "application/json",
                Authorization: `Bearer ${token}`,
              },
              body: JSON.stringify({
                clase_id: resultado.id,
                estudiante_id,
                estado,
              }),
            });
          }

          alert("✅ Asistencia registrada correctamente");
          setResultado(null);
          setModo("");
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
              <td>{est.nombre} {est.apellido}</td>
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
