import React, { useEffect, useState } from 'react';
import { getAulas, createAula, updateAula, deleteAula } from '../services/aulaService';

const AulaCrud = () => {
  const [aulas, setAulas] = useState([]);
  const [formData, setFormData] = useState({ nombre_aula: '' });
  const [editId, setEditId] = useState(null);
  const [mensaje, setMensaje] = useState('');

  const mostrarMensaje = (texto) => {
    setMensaje(texto);
    setTimeout(() => {
      const mensajeDiv = document.querySelector('.mensaje-exito');
      if (mensajeDiv) {
        mensajeDiv.classList.add('oculto');
      }
    }, 2500);

    setTimeout(() => {
      setMensaje('');
    }, 3000);
  };

  const fetchAulas = async () => {
    try {
      const res = await getAulas();
      setAulas(res.data.aulas);
    } catch (error) {
      console.error('Error al obtener aulas:', error);
    }
  };

  useEffect(() => {
    fetchAulas();
  }, []);

  const handleChange = (e) => setFormData({ nombre_aula: e.target.value });

  const handleSubmit = async (e) => {
    e.preventDefault();
    try {
      if (editId) {
        await updateAula(editId, formData);
        mostrarMensaje('✏️ Aula actualizada correctamente');
      } else {
        await createAula(formData);
        mostrarMensaje('✅ Aula registrada con éxito');
      }
      setFormData({ nombre_aula: '' });
      setEditId(null);
      fetchAulas();
    } catch (error) {
      console.error('Error al guardar aula:', error);
    }
  };

  const handleEdit = (aula) => {
    setFormData({ nombre_aula: aula.nombre_aula });
    setEditId(aula.id);
  };

  const handleDelete = async (id) => {
    try {
      await deleteAula(id);
      fetchAulas();
      mostrarMensaje('🗑️ Aula eliminada');
    } catch (error) {
      console.error('Error al eliminar aula:', error);
    }
  };

  return (
    <div>
      {mensaje && <div className="mensaje-exito">{mensaje}</div>}
      <h2>{editId ? 'Editar Aula' : 'Registrar Aula'}</h2>
      <form onSubmit={handleSubmit}>
        <input
          type="text"
          name="nombre_aula"
          value={formData.nombre_aula}
          onChange={handleChange}
          placeholder="Nombre del aula"
          required
        />
        <button type="submit">{editId ? 'Actualizar' : 'Registrar'}</button>
        {editId && (
          <button
            type="button"
            onClick={() => {
              setFormData({ nombre_aula: '' });
              setEditId(null);
            }}
          >
            Cancelar
          </button>
        )}
      </form>

      <table>
        <thead>
          <tr>
            <th>ID</th>
            <th>Nombre Aula</th>
            <th>Acciones</th>
          </tr>
        </thead>
        <tbody>
          {aulas.map((aula) => (
            <tr key={aula.id}>
              <td>{aula.id}</td>
              <td>{aula.nombre_aula}</td>
              <td>
                <button onClick={() => handleEdit(aula)}>Editar</button>
                <button onClick={() => handleDelete(aula.id)}>Eliminar</button>
              </td>
            </tr>
          ))}
        </tbody>
      </table>
    </div>
  );
};

export default AulaCrud;
