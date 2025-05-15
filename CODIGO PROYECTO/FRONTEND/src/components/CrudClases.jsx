import React, { useEffect, useState } from 'react';
import {
  getClases,
  createClase,
  updateClase,
  deleteClase
} from '../services/claseService';
import './CrudClases.css';

const ClaseCrud = () => {
  const [clases, setClases] = useState([]);
  const [formData, setFormData] = useState({
    asignatura_id: '',
    docente_id: '',
    aula_id: '',
    curso_id: '',
    fecha: '',
    hora_inicio: '',
    hora_fin: '',
  });
  const [editId, setEditId] = useState(null);

  const fetchClases = async () => {
    try {
      const res = await getClases();
      setClases(res.data.clases);
    } catch (error) {
      console.error('Error al obtener clases:', error);
    }
  };

  useEffect(() => {
    fetchClases();
  }, []);

  const handleChange = (e) =>
    setFormData({ ...formData, [e.target.name]: e.target.value });

  const handleSubmit = async (e) => {
    e.preventDefault();
    try {
      if (editId) {
        await updateClase(editId, formData);
      } else {
        await createClase({ ...formData, dias: ['lunes'], fecha_inicio: formData.fecha, fecha_fin: formData.fecha });
      }
      setFormData({
        asignatura_id: '',
        docente_id: '',
        aula_id: '',
        curso_id: '',
        fecha: '',
        hora_inicio: '',
        hora_fin: '',
      });
      setEditId(null);
      fetchClases();
    } catch (error) {
      console.error('Error al guardar clase:', error);
    }
  };

  const handleEdit = (clase) => {
    setFormData(clase);
    setEditId(clase.id);
  };

  const handleDelete = async (id) => {
    try {
      await deleteClase(id);
      fetchClases();
    } catch (error) {
      console.error('Error al eliminar clase:', error);
    }
  };

  return (
    <div>
      <h2>Gestión de clases</h2>
      <form onSubmit={handleSubmit}>
        <input name="asignatura_id" value={formData.asignatura_id} onChange={handleChange} placeholder="Asignatura ID" />
        <input name="docente_id" value={formData.docente_id} onChange={handleChange} placeholder="Docente ID" />
        <input name="aula_id" value={formData.aula_id} onChange={handleChange} placeholder="Aula ID" />
        <input name="curso_id" value={formData.curso_id} onChange={handleChange} placeholder="Curso ID" />
        <input name="fecha" type="date" value={formData.fecha} onChange={handleChange} />
        <input name="hora_inicio" value={formData.hora_inicio} onChange={handleChange} placeholder="Hora inicio" />
        <input name="hora_fin" value={formData.hora_fin} onChange={handleChange} placeholder="Hora fin" />
        <button type="submit">{editId ? 'Actualizar' : 'Crear'}</button>
      </form>

      <table>
        <thead>
          <tr>
            <th>ID</th>
            <th>Curso</th>
            <th>Fecha</th>
            <th>Hora</th>
            <th>Acciones</th>
          </tr>
        </thead>
        <tbody>
          {clases.map((clase) => (
            <tr key={clase.id}>
              <td>{clase.id}</td>
              <td>{clase.curso_id}</td>
              <td>{clase.fecha}</td>
              <td>{clase.hora_inicio} - {clase.hora_fin}</td>
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

export default ClaseCrud;
