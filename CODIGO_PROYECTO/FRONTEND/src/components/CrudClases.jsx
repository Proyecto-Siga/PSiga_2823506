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

  const formatFechaConDia = (fechaStr) => {
    const [anio, mes, dia] = fechaStr.split('-');
    const fecha = new Date(anio, mes - 1, dia);
    const dias = ['Domingo', 'Lunes', 'Martes', 'Miércoles', 'Jueves', 'Viernes', 'Sábado'];
    const diaNombre = dias[fecha.getDay()];
    return `${diaNombre}, ${dia.padStart(2, '0')}/${mes.padStart(2, '0')}/${anio}`;
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
