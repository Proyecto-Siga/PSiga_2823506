import api from "../api.js"; 

export const getAsistenciasPorClase = (clase_id) => {
  return api.get(`/asistencias/${clase_id}`);
};

export const marcarAsistencia = (asistencia) => {
  return api.post("/marcar-asistencia", asistencia);
};