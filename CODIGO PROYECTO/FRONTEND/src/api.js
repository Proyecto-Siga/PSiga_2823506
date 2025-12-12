import axios from "axios";

const api = axios.create({
  baseURL: "http://127.0.0.1:8000/api",
});

// Interceptor que se ejecuta antes de cada request
api.interceptors.request.use(
  (config) => {
    const token = localStorage.getItem("token"); // Siempre actualizado
    if (token) {
      config.headers.Authorization = `Bearer ${token}`;
    }
    return config;
  },
  (error) => Promise.reject(error)
);

export default api;
