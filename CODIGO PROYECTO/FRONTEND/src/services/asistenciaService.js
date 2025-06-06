import axios from "axios";
const API = "http://localhost:8000/api";

export const getAsistenciasPorClase = (clase_id) => {
  return axios.get(`${API}/asistencias/${clase_id}`);
};