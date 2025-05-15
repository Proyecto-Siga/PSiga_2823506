import axios from 'axios';

const API_URL = 'http://localhost:8000/api/clases';

export const getClases = () => axios.get(API_URL);
export const createClase = (data) => axios.post(`${API_URL}/registrar`, data);
export const updateClase = (id, data) => axios.put(`${API_URL}/${id}`, data);
export const deleteClase = (id) => axios.delete(`${API_URL}/${id}`);
