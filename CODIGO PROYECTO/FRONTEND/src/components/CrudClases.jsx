import React, { useEffect, useState } from 'react';
import { getClases } from '../services/claseService';
import './CrudClases.css';

const ClaseCrud = () => {
  const [clases, setClases] = useState([]);

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

  // Función para formatear la fecha con el día de la semana en español
  const formatFechaConDia = (fechaStr) => {
    const fecha = new Date(fechaStr);
    const dias = ['Domingo', 'Lunes', 'Martes', 'Miércoles', 'Jueves', 'Viernes', 'Sábado'];
    const diaNombre = dias[fecha.getDay()];
    const dia = String(fecha.getDate()).padStart(2, '0');
    const mes = String(fecha.getMonth() + 1).padStart(2, '0');
    const anio = fecha.getFullYear();
    return `${diaNombre}, ${dia}/${mes}/${anio}`;
  };

  return (
    <div>
      <h2>Clases Programadas</h2>
      <table>
        <thead>
          <tr>
            <th>ID</th>
            <th>Curso</th>
            <th>Fecha</th>
            <th>Hora</th>
          </tr>
        </thead>
        <tbody>
          {clases.map((clase) => (
            <tr key={clase.id}>
              <td>{clase.id}</td>
              <td>{clase.curso?.nombre}</td>
              <td>{formatFechaConDia(clase.fecha)}</td>
              <td>{clase.hora_inicio} - {clase.hora_fin}</td>
            </tr>
          ))}
        </tbody>
      </table>
    </div>
  );
};

export default ClaseCrud;
