import axios from "axios";

const API_URL = "http://localhost:8000/api"; // Asegúrate que esta sea tu URL correcta

export const getAsignatura = () => {
  return axios.get(`${API_URL}/obtener-asignaturas`);
};

export const createAsignatura = (asignatura) => {
  return axios.post(`${API_URL}/registrar-asignaturas`, asignatura);
};

export const updateAsignatura = (id, asignatura) => {
  return axios.put(`${API_URL}/actualizar-asignaturas/${id}`, asignatura);
};

export const deleteAsignatura = (id) => {
  return axios.delete(`${API_URL}/eliminar-asignaturas/${id}`);
};
