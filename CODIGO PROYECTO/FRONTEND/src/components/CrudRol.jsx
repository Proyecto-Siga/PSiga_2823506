import React, { useState, useEffect } from "react";
import api from "../api";
import "./CrudRol.css";

function CrudRol() {
  const [nombre, setNombre] = useState("");
  const [roles, setRoles] = useState([]);
  const [editandoRol, setEditandoRol] = useState(null);
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
    obtenerRoles();
  }, []);

  const obtenerRoles = async () => {
    try {
      const response = await api.get("/obtener-roles");
      setRoles(response.data.roles);
    } catch (error) {
      console.error("Error al obtener roles:", error);
    }
  };

  const crearRol = async () => {
    try {
      await api.post("/registrar-rol", {
        nombre,
        permisos: [],
      });
      setNombre("");
      obtenerRoles();
      mostrarMensaje("✅ Rol registrado con éxito");
    } catch (error) {
      console.error("Error al crear rol:", error);
    }
  };

  const actualizarRol = async () => {
    try {
      await api.put(`/actualizar-rol/${editandoRol.id}`, {
        nombre: editandoRol.nombre,
        permisos: editandoRol.permisos || [],
      });
      setEditandoRol(null);
      obtenerRoles();
      mostrarMensaje("✏️ Rol actualizado correctamente");
    } catch (error) {
      console.error("Error al actualizar rol:", error);
    }
  };

  const eliminarRol = async (id) => {
    try {
      await api.delete(`/eliminar-rol/${id}`);
      obtenerRoles();
      mostrarMensaje("🗑️ Rol eliminado");
    } catch (error) {
      console.error("Error al eliminar rol:", error);
    }
  };

  const handleInputChange = (e) => {
    const value = e.target.value;
    editandoRol
      ? setEditandoRol({ ...editandoRol, nombre: value })
      : setNombre(value);
  };

  return (
    <>
      {mensaje && <div className="mensaje-exito">{mensaje}</div>}

    

    <div className="rol-container">
      <h2>{editandoRol ? "Editar Rol" : "Registrar Rol"}</h2>

      <div className="rol-form">
        <input
          type="text"
          placeholder="Nombre del rol"
          value={editandoRol ? editandoRol.nombre : nombre}
          onChange={handleInputChange}
        />
        <button onClick={editandoRol ? actualizarRol : crearRol}>
          {editandoRol ? "Actualizar" : "Registrar"}
        </button>
      </div>

      <div className="rol-table-container">
        <table className="rol-table">
          <thead>
            <tr>
              <th>ID</th>
              <th>Nombre</th>
              <th>Acciones</th>
            </tr>
          </thead>
          <tbody>
            {roles.map((rol) => (
              <tr key={rol.id}>
                <td>{rol.id}</td>
                <td>{rol.nombre}</td>
                <td>
                  <button className="edit-btn" onClick={() => setEditandoRol(rol)}>
                    Editar
                  </button>
                  <button className="delete-btn" onClick={() => eliminarRol(rol.id)}>
                    Eliminar
                  </button>
                </td>
              </tr>
            ))}
            {roles.length === 0 && (
              <tr>
                <td colSpan="3">No hay roles registrados.</td>
              </tr>
            )}
          </tbody>
        </table>
      </div>
    </div>
    </>
  );
}

export default CrudRol;
