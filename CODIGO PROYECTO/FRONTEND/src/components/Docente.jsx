import React, { useState } from "react";
import {
  FaChalkboardTeacher,
  FaClipboardList,
  FaChartBar,
  FaSignOutAlt,
} from "react-icons/fa";
import "./Docente.css";
// import Clases from "./Clases";
// import Asistencia from "./Asistencia";
// import Reporte from "./Reporte";
import logo from '../assets/siga-logo.png';

function Docente() {
  const [seccionActiva, setSeccionActiva] = useState("clases");

  const handleLogout = () => {
    localStorage.removeItem("token");
    window.location.href = "/";
  };

//   const renderSeccion = () => {
//     switch (seccionActiva) {
//       case "clases":
//         return <Clases />;
//       case "asistencia":
//         return <Asistencia />;
//       case "reporte":
//         return <Reporte />;
//       default:
//         return <h2>Seleccione una sección</h2>;
//     }
//   };

  return (
    <div className="docente-container">
      <div className="sidebar">
        <div className="sidebar-header">
          <img
            src={logo}
            alt="Logo SIGA"
            className="logo-docente"
          />
          <h3>Panel Docente</h3>
        </div>

        <button 
          onClick={() => setSeccionActiva("clases")}
          className={seccionActiva === "clases" ? "active" : ""}
        >
          <FaChalkboardTeacher /> Clases
        </button>
        
        <button 
          onClick={() => setSeccionActiva("asistencia")}
          className={seccionActiva === "asistencia" ? "active" : ""}
        >
          <FaClipboardList /> Asistencia
        </button>
        
        <button 
          onClick={() => setSeccionActiva("reporte")}
          className={seccionActiva === "reporte" ? "active" : ""}
        >
          <FaChartBar /> Reporte
        </button>
        
        <button 
          onClick={handleLogout} 
          className="logout-button"
        >
          <FaSignOutAlt /> Cerrar sesión
        </button>
      </div>

      {/* <div className="main-content">
        {renderSeccion()}
      </div> */}
    </div>
  );
}

export default Docente;