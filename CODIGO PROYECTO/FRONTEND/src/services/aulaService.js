import axios from 'axios';

const API_BASE_URL = 'http://localhost:8000/api';

export const getAulas = () => axios.get(`${API_BASE_URL}/obtener-aulas`);

export const createAula = (data) => axios.post(`${API_BASE_URL}/registrar-aulas`, data);

export const updateAula = (id, data) => axios.put(`${API_BASE_URL}/actualizar-aulas/${id}`, data);

export const updatePartialAula = (id, data) => axios.patch(`${API_BASE_URL}/actualizar-parcial-aulas/${id}`, data);

export const deleteAula = (id) => axios.delete(`${API_BASE_URL}/eliminar-aulas/${id}`);
