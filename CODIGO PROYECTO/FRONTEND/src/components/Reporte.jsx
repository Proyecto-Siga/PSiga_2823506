import React, { useEffect, useState } from 'react';
import axios from 'axios';
import Swal from 'sweetalert2';
import withReactContent from 'sweetalert2-react-content';

const CrudReportes = () => {
  const [reportes, setReportes] = useState([]);
  const [loading, setLoading] = useState(true);
  const [mensaje, setMensaje] = useState(null);

  const MySwal = withReactContent(Swal);

  useEffect(() => {
    obtenerReportes();
  }, []);

  const obtenerReportes = async () => {
    try {
      const res = await axios.get('http://127.0.0.1:8000/api/obtener-reportes');
      setReportes(res.data);
    } catch (error) {
      console.error('Error al obtener reportes', error);
      setMensaje('Error al obtener reportes');
    } finally {
      setLoading(false);
    }
  };

  const eliminarReporte = async (id) => {
    try {
      await axios.delete(`http://127.0.0.1:8000/api/eliminar-reportes/${id}`);
      setMensaje('✅ Reporte eliminado correctamente');
      obtenerReportes();
    } catch (error) {
      console.error('Error al eliminar reporte', error);
      setMensaje('❌ Error al eliminar el reporte');
    }
  };

  const confirmarEliminacion = (id) => {
    MySwal.fire({
      title: '¿Estás seguro?',
      text: '¡No podrás revertir esta acción!',
      icon: 'warning',
      showCancelButton: true,
      confirmButtonColor: '#d33',
      cancelButtonColor: '#3085d6',
      confirmButtonText: 'Sí, eliminar',
      cancelButtonText: 'Cancelar',
    }).then((result) => {
      if (result.isConfirmed) {
        eliminarReporte(id);
      }
    });
  };

  return (
    <div className="p-4">
      <h2 className="text-2xl font-bold mb-4">Lista de Reportes</h2>

      {mensaje && (
        <div className="mb-4 p-2 bg-blue-100 border border-blue-300 rounded text-blue-800">
          {mensaje}
        </div>
      )}

      {loading ? (
        <p>Cargando reportes...</p>
      ) : (
        <table className="w-full border border-gray-300">
          <thead className="bg-gray-200">
            <tr>
              <th className="p-2 border">ID</th>
              <th className="p-2 border">Estudiante</th>
              <th className="p-2 border">Correo acudiente</th>
              <th className="p-2 border">Fallas</th>
              <th className="p-2 border">Fecha</th>
              <th className="p-2 border">Acciones</th>
            </tr>
          </thead>
          <tbody>
            {reportes.map((reporte) => (
              <tr key={reporte.id} className="text-center">
                <td className="border p-1">{reporte.id}</td>
                <td className="border p-1">{reporte.estudiante?.nombre || 'Sin nombre'}</td>
                <td className="border p-1">{reporte.correo}</td>
                <td className="border p-1">{reporte.fallas_acumuladas}</td>
                <td className="border p-1">{reporte.fecha_reporte}</td>
                <td className="border p-1">
                  <button
                    onClick={() => confirmarEliminacion(reporte.id)}
                    className="bg-red-500 text-white px-2 py-1 rounded hover:bg-red-600"
                  >
                    Eliminar
                  </button>
                </td>
              </tr>
            ))}
            {reportes.length === 0 && (
              <tr>
                <td colSpan="6" className="p-4 text-center">No hay reportes disponibles.</td>
              </tr>
            )}
          </tbody>
        </table>
      )}
    </div>
  );
};

export default CrudReportes;
