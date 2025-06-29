import api from "../api.js"; 
export const getAsignatura = () => {
  return api.get(`/obtener-asignaturas`);
};

export const createAsignatura = (asignatura) => {
  return api.post(`/registrar-asignaturas`, asignatura);
};

export const updateAsignatura = (id, asignatura) => {
  return api.put(`/actualizar-asignaturas/${id}`, asignatura);
};

export const deleteAsignatura = (id) => {
  return api.delete(`/eliminar-asignaturas/${id}`);
};
