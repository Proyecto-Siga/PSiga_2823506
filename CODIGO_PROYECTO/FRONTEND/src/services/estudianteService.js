import api from "../api.js"; 

export const getEstudiantesPorCurso = (curso_id) => {
  return api.get(`/estudiantes-curso/${curso_id}`);
};
