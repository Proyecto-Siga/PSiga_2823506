import axios from 'axios';

const API= 'http://localhost:8000/api';

export const getClases = () => axios.get(API);
export const createClase = (data) => axios.post(`${API}/registrar`, data);
export const updateClase = (id, data) => axios.put(`${API}/${id}`, data);
export const deleteClase = (id) => axios.delete(`${API}/${id}`);

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