import axios from 'axios';


const API = 'http://localhost:8000/api';

export const getClases = () => axios.get(`${API}/obtener-clases`);

export const createClase = (data) => axios.post(`${API}/registrar-clases`, data);

export const updateClase = (id, data) => axios.put(`${API}/actualizar-clases/${id}`, data);

export const deleteClase = (id) => axios.delete(`${API}/eliminar-clases/${id}`);

export const buscarClaseDocente = (fecha, curso_id, asignatura_id, token) => {
  return axios.get(`${API}/clases-docente`, {
    headers: {
      Authorization: `Bearer ${token}`,
    },
    params: {
      fecha,
      curso_id,
      asignatura_id,
    },
  });
};

// Nueva función para obtener clases del día para el docente logueado
export const getClasesDelDia = (fecha, token) => {
  return axios.get(`${API}/clases-del-dia`, {
    headers: {
      Authorization: `Bearer ${token}`,
    },
    params: { fecha },
  });
};
