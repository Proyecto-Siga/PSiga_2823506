import api from "../api.js"; 


export const obtenerCursos = () => api.get(`/obtener-cursos`);
