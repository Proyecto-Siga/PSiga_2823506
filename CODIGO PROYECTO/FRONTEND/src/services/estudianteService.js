import axios from "axios";
const API = "http://localhost:8000/api";

export const getEstudiantesPorCurso = (curso_id) => {
  return axios.get(`${API}/estudiantes-curso/${curso_id}`);
};
