import api from "../api.js"; 

export const getClases = () => api.get(`/obtener-clases`);

export const createClase = (data) => api.post(`/registrar-clases`, data);

export const updateClase = (id, data) => api.put(`/actualizar-clases/${id}`, data);

export const deleteClase = (id) => api.delete(`/eliminar-clases/${id}`);

export const buscarClaseDocente = (fecha, curso_id, asignatura_id, token) => {
  return api.get(`/clases-docente`, {
    headers: {
      Authorization: `Bearer ${token}`,
    },
    params: {
      fecha,
      curso_id,
      asignatura_id,
    },
  });
};

// Nueva función para obtener clases del día para el docente logueado
export const getClasesDelDia = (fecha, token) => {
  return api.get(`/clases-del-dia`, {
    headers: {
      Authorization: `Bearer ${token}`,
    },
    params: { fecha },
  });
};
