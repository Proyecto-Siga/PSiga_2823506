import React, { useEffect, useState } from "react";
import {
  getClases,
  createClase,
  deleteClase,
  updateClase,
} from "../services/claseService";
import api from "../api";
import "./CrudClasesAdmin.css";

const CrudClasesAdmin = () => {
  const [clases, setClases] = useState([]);
  const [form, setForm] = useState({
    asignatura_id: "",
    docente_id: "",
    aula_id: "",
    curso_id: "",
    hora_inicio: "",
    hora_fin: "",
    fecha: "",
    fecha_inicio: "",
    fecha_fin: "",
    dias: [],
    id: null,
  });

  const [asignaturas, setAsignaturas] = useState([]);
  const [docentes, setDocentes] = useState([]);
  const [aulas, setAulas] = useState([]);
  const [cursos, setCursos] = useState([]);

  const [mensaje, setMensaje] = useState("");

  const mostrarMensaje = (texto) => {
    setMensaje(texto);
    setTimeout(() => {
      const mensajeDiv = document.querySelector(".mensaje-exito");
      if (mensajeDiv) {
        mensajeDiv.classList.add("oculto");
      }
    }, 2500);
    setTimeout(() => {
      setMensaje("");
    }, 3000);
  };

  useEffect(() => {
    fetchData();
    fetchDropdownData();
  },);

  const fetchData = async () => {
    try {
      const res = await getClases();
      setClases(res.data.clases);
    } catch (error) {
      console.error("Error al obtener clases", error);
      mostrarMensaje("❌ Error al obtener las clases");
    }
  };

  const fetchDropdownData = async () => {
    try {
      const [asigRes, docRes, aulaRes, cursoRes] = await Promise.all([
        api.get("/obtener-asignaturas"),
        api.get("/docentes"),
        api.get("/obtener-aulas"),
        api.get("/obtener-cursos"),
      ]);

      setAsignaturas(asigRes.data.asignaturas);
      setDocentes(docRes.data);
      setAulas(aulaRes.data.aulas);
      setCursos(cursoRes.data.cursos);
    } catch (err) {
      console.error("Error cargando datos de select", err);
      mostrarMensaje("❌ Error al cargar datos de selección");
    }
  };

  const handleChange = (e) => {
    const { name, value, type, checked } = e.target;

    if (name === "dias" && type === "checkbox") {
      setForm((prev) => ({
        ...prev,
        dias: checked
          ? [...prev.dias, value]
          : prev.dias.filter((dia) => dia !== value),
      }));
    } else {
      setForm((prev) => ({ ...prev, [name]: value }));
    }
  };

  const handleSubmit = async (e) => {
    e.preventDefault();
    try {
      if (form.id) {
        const dataToUpdate = {
          asignatura_id: form.asignatura_id,
          docente_id: form.docente_id,
          aula_id: form.aula_id,
          curso_id: form.curso_id,
          hora_inicio: form.hora_inicio,
          hora_fin: form.hora_fin,
          fecha: form.fecha,
        };
        await updateClase(form.id, dataToUpdate);
        mostrarMensaje("✏️ Clase actualizada correctamente");
      } else {
        if (!form.dias.length) {
          mostrarMensaje("⚠️ Debes seleccionar al menos un día.");
          return;
        }
        await createClase(form);
        mostrarMensaje("✅ Clase registrada exitosamente");
      }
      fetchData();
      resetForm();
    } catch (error) {
      console.error("Error al guardar clase", error.response?.data || error.message);
      mostrarMensaje("❌ Error al guardar la clase");
    }
  };

  const handleEdit = (clase) => {
    setForm({
      asignatura_id: clase.asignatura_id,
      docente_id: clase.docente_id,
      aula_id: clase.aula_id,
      curso_id: clase.curso_id,
      hora_inicio: clase.hora_inicio,
      hora_fin: clase.hora_fin,
      fecha: clase.fecha,
      fecha_inicio: "",
      fecha_fin: "",
      dias: [],
      id: clase.id,
    });
  };

  const handleDelete = async (id) => {
    try {
      await deleteClase(id);
      fetchData();
      mostrarMensaje("🗑️ Clase eliminada exitosamente");
    } catch (error) {
      console.error("Error al eliminar clase", error);
      mostrarMensaje("❌ Error al eliminar la clase");
    }
  };

  const resetForm = () => {
    setForm({
      asignatura_id: "",
      docente_id: "",
      aula_id: "",
      curso_id: "",
      hora_inicio: "",
      hora_fin: "",
      fecha: "",
      fecha_inicio: "",
      fecha_fin: "",
      dias: [],
      id: null,
    });
  };

  const diasSemana = [
    "lunes",
    "martes",
    "miércoles",
    "jueves",
    "viernes",
    "sábado",
    "domingo",
  ];

  return (
    <div>
      {mensaje && <div className="mensaje-exito">{mensaje}</div>}

      <h2>{form.id ? "Editar Clase" : "Registrar Nueva Clase"}</h2>

      <form onSubmit={handleSubmit}>
        <select
          name="asignatura_id"
          value={form.asignatura_id}
          onChange={handleChange}
          required
        >
          <option value="">Seleccionar asignatura</option>
          {asignaturas.map((a) => (
            <option key={a.id} value={a.id}>
              {a.nombre_asignatura}
            </option>
          ))}
        </select>

        <select
          name="docente_id"
          value={form.docente_id}
          onChange={handleChange}
          required
        >
          <option value="">Seleccionar docente</option>
          {docentes.map((d) => (
            <option key={d.id} value={d.id}>
              {d.nombre}
            </option>
          ))}
        </select>

        <select
          name="aula_id"
          value={form.aula_id}
          onChange={handleChange}
          required
        >
          <option value="">Seleccionar aula</option>
          {aulas.map((a) => (
            <option key={a.id} value={a.id}>
              {a.nombre_aula}
            </option>
          ))}
        </select>

        <select
          name="curso_id"
          value={form.curso_id}
          onChange={handleChange}
          required
        >
          <option value="">Seleccionar curso</option>
          {cursos.map((c) => (
            <option key={c.id} value={c.id}>
              {c.nombre}
            </option>
          ))}
        </select>

        <input
          type="time"
          name="hora_inicio"
          value={form.hora_inicio}
          onChange={handleChange}
          required
        />
        <input
          type="time"
          name="hora_fin"
          value={form.hora_fin}
          onChange={handleChange}
          required
        />

        {form.id ? (
          <input
            type="date"
            name="fecha"
            value={form.fecha}
            onChange={handleChange}
            required
          />
        ) : (
          <>
            <input
              type="date"
              name="fecha_inicio"
              value={form.fecha_inicio}
              onChange={handleChange}
              required
            />
            <input
              type="date"
              name="fecha_fin"
              value={form.fecha_fin}
              onChange={handleChange}
              required
            />
            <select
              name="dia"
              value={form.dias[0] || ""}
              onChange={(e) =>
                setForm((prev) => ({
                  ...prev,
                  dias: [e.target.value],
                }))
              }
            >
              <option value="">Seleccionar día</option>
              {diasSemana.map((dia) => (
                <option key={dia} value={dia}>
                  {dia}
                </option>
              ))}
            </select>
          </>
        )}

        <div>
          <button type="submit" style={{ marginRight: "10px" }}>
            {form.id ? "Actualizar Clase" : "Registrar Clase"}
          </button>

          {form.id && (
            <button
              type="button"
              onClick={resetForm}
            >
              Cancelar edición
            </button>
          )}
        </div>
      </form>

      <table>
        <thead>
          <tr>
            <th>ID</th>
            <th>Docente</th>
            <th>Curso</th>
            <th>Asignatura</th>
            <th>Fecha</th>
            <th>Hora</th>
            <th>Acciones</th>
          </tr>
        </thead>
        <tbody>
          {clases.map((clase) => (
            <tr key={clase.id}>
              <td>{clase.id}</td>
              <td>{clase.docente?.nombre || "N/A"}</td>
              <td>{clase.curso?.nombre || "N/A"}</td>
              <td>{clase.asignatura?.nombre_asignatura || "N/A"}</td>
              <td>{clase.fecha}</td>
              <td>
                {clase.hora_inicio} - {clase.hora_fin}
              </td>
              <td>
                <button onClick={() => handleEdit(clase)}>Editar</button>
                <button onClick={() => handleDelete(clase.id)}>Eliminar</button>
              </td>
            </tr>
          ))}
        </tbody>
      </table>
    </div>
  );
};

export default CrudClasesAdmin;
