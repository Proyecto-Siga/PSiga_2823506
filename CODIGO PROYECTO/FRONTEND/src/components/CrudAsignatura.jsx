import React, { useEffect, useState } from "react";
import {
  getAsignatura,
  createAsignatura,
  updateAsignatura,
  deleteAsignatura,
} from "../services/asignaturaService";
import "./CrudAsignatura.css";

const CrudAsignatura = () => {
  const [asignaturas, setAsignaturas] = useState([]);
  const [nuevoNombre, setNuevoNombre] = useState("");
  const [editandoId, setEditandoId] = useState(null);
  const [mensaje, setMensaje] = useState("");

  useEffect(() => {
    cargarAsignaturas();
  }, []);

  const cargarAsignaturas = () => {
    getAsignatura()
      .then((res) => {
        setAsignaturas(res.data.asignaturas || res.data); 
      })
      .catch((err) => console.error("Error al cargar asignaturas:", err));
  };

  const mostrarMensaje = (texto) => {
    setMensaje(texto);
    setTimeout(() => setMensaje(""), 3000);
  };

  const handleRegistrar = () => {
    if (!nuevoNombre.trim()) return;
    createAsignatura({ nombre_asignatura: nuevoNombre })
      .then(() => {
        mostrarMensaje("✅ Asignatura registrada con éxito");
        setNuevoNombre("");
        cargarAsignaturas();
      })
      .catch(() => mostrarMensaje("❌ Error al registrar asignatura"));
  };

  const handleActualizar = () => {
    if (!nuevoNombre.trim() || !editandoId) return;
    updateAsignatura(editandoId, { nombre_asignatura: nuevoNombre })
      .then(() => {
        mostrarMensaje("✏️ Asignatura actualizada con éxito");
        setNuevoNombre("");
        setEditandoId(null);
        cargarAsignaturas();
      })
      .catch(() => mostrarMensaje("❌ Error al actualizar asignatura"));
  };

  const iniciarEdicion = (asignatura) => {
    setNuevoNombre(asignatura.nombre_asignatura);
    setEditandoId(asignatura.id);
  };

  const handleEliminar = (id) => {
    deleteAsignatura(id)
      .then(() => {
        mostrarMensaje("🗑️ Asignatura eliminada");
        cargarAsignaturas();
      })
      .catch(() => mostrarMensaje("❌ Error al eliminar asignatura"));
  };

  return (
    <div className="crud-asignatura-container">
      {mensaje && <div className="mensaje-exito">{mensaje}</div>}
      <h2>Gestión de Asignaturas</h2>

      <div className="formulario">
        <input
          type="text"
          placeholder="Nombre asignatura"
          value={nuevoNombre}
          onChange={(e) => setNuevoNombre(e.target.value)}
        />
        {editandoId ? (
          <button onClick={handleActualizar}>Actualizar</button>
        ) : (
          <button onClick={handleRegistrar}>Registrar</button>
        )}
        {editandoId && (
          <button onClick={() => {
            setEditandoId(null);
            setNuevoNombre("");
          }}>Cancelar</button>
        )}
      </div>

      <table>
        <thead>
          <tr>
            <th>ID</th>
            <th>Nombre Asignatura</th>
            <th>Acciones</th>
          </tr>
        </thead>
        <tbody>
          {asignaturas.map((a) => (
            <tr key={a.id}>
              <td>{a.id}</td>
              <td>{a.nombre_asignatura}</td>
              <td>
                <button onClick={() => iniciarEdicion(a)}>Editar</button>
                <button onClick={() => handleEliminar(a.id)}>Eliminar</button>
              </td>
            </tr>
          ))}
        </tbody>
      </table>
    </div>
  );
};

export default CrudAsignatura;
