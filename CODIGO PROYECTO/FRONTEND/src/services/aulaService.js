import api from "../api.js"; 


export const getAulas = () => api.get(`/obtener-aulas`);

export const createAula = (data) => api.post(`/registrar-aulas`, data);

export const updateAula = (id, data) => api.put(`/actualizar-aulas/${id}`, data);

export const updatePartialAula = (id, data) => api.patch(`/actualizar-parcial-aulas/${id}`, data);

export const deleteAula = (id) => api.delete(`/eliminar-aulas/${id}`);
