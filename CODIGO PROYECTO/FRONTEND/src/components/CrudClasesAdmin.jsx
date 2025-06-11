import React, { useEffect, useState } from "react";
import {
  getClases,
  createClase,
  deleteClase,
  updateClase,
} from "../services/claseService";
import axios from "axios";
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
    fecha_inicio: "",
    fecha_fin: "",
    dias: [],
    id: null,
  });
  const [asignaturas, setAsignaturas] = useState([]);
  const [docentes, setDocentes] = useState([]);
  const [aulas, setAulas] = useState([]);
  const [cursos, setCursos] = useState([]);

  useEffect(() => {
    fetchData();
    fetchDropdownData();
  }, []);

  const fetchData = async () => {
    try {
      const res = await getClases();
      console.log("📦 Clases recibidas:", res.data.clases);
      setClases(res.data.clases);
    } catch (error) {
      console.error("Error al obtener clases", error);
      alert("Error al obtener las clases");
    }
  };

  const fetchDropdownData = async () => {
    try {
      const [asigRes, docRes, aulaRes, cursoRes] = await Promise.all([
        axios.get("http://localhost:8000/api/obtener-asignaturas"),
        axios.get("http://localhost:8000/api/docentes"),
        axios.get("http://localhost:8000/api/obtener-aulas"),
        axios.get("http://localhost:8000/api/obtener-cursos"),
      ]);

      setAsignaturas(asigRes.data.asignaturas);
      setDocentes(docRes.data);
      setAulas(aulaRes.data.aulas);
      setCursos(cursoRes.data.cursos);
    } catch (err) {
      console.error("Error cargando datos de select", err);
      alert("Error al cargar datos de selección");
    }
  };

  const handleChange = (e) => {
    const { name, value, type: inputType, checked } = e.target;

    if (name === "dias" && inputType === "checkbox") {
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
    console.log("Formulario enviado:", form);
    try {
      if (form.id) {
        await updateClase(form.id, form);
        alert("Clase actualizada correctamente");
      } else {
        await createClase(form.dias);
        alert("Clase registrada exitosamente");
      }
      fetchData();
      setForm({
        asignatura_id: "",
        docente_id: "",
        aula_id: "",
        curso_id: "",
        hora_inicio: "",
        hora_fin: "",
        fecha_inicio: "",
        fecha_fin: "",
        dias: [],
        id: null,
      });
    } catch (error) {
      console.error("Error al guardar clase", error);
      alert("Error al guardar la clase");
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
      fecha_inicio: clase.fecha_inicio,
      fecha_fin: clase.fecha_fin,
      dias: clase.dias || [],
      id: clase.id,
    });
  };

  const handleDelete = async (id) => {
    try {
      await deleteClase(id);
      fetchData();
      alert("Clase eliminada exitosamente");
    } catch (error) {
      console.error("Error al eliminar clase", error);
      alert("Error al eliminar la clase");
    }
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

  console.log("Asignaturas en el render:", asignaturas);
  console.log("Aulas en el render:", aulas);

  return (
    <div>
      <h2>{form.id ? "Editar Clase" : "Gestión de clases"}</h2>
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

        <div>
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
        </div>

        <button type="submit">
          {form.id ? "Actualizar Clase" : "Registrar Clase"}
        </button>
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
              <td>{clase.fecha_inicio}</td>
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
