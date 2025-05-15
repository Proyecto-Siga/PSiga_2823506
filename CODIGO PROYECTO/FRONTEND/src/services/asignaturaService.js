import axios from "axios";

const API_URL = "http://localhost:8000/api/asignaturas";

const obtenerAsignaturas = () => {
  return axios.get(API_URL);
};

const registrarAsignatura = (asignatura) => {
  return axios.post(API_URL, asignatura);
};

const actualizarAsignatura = (id, asignatura) => {
  return axios.put(`${API_URL}/${id}`, asignatura);
};

const eliminarAsignatura = (id) => {
  return axios.delete(`${API_URL}/${id}`);
};

export {
  obtenerAsignaturas,
  registrarAsignatura,
  actualizarAsignatura,
  eliminarAsignatura,
};
