import React, { useState } from "react";
import {
  FaShieldAlt,
  FaUser,
  FaChalkboardTeacher,
  FaUsers,
  FaSchool,
  FaUserGraduate,
  FaFolderOpen,
  FaSignOutAlt,
  FaDoorOpen,
  FaBook,
} from "react-icons/fa";
import "./Administrativo.css";
import CrudRol from "./CrudRol";
import CrudAcudiente from "./CrudAcudiente";
import CrudEstudiante from "./CrudEstudiante";
import CrudCurso from "./CrudCurso";
import CrudClases from "./CrudClases";
import CrudUsuario from "./CrudUsuario";
import CrudDocente from "./CrudDocente";
import CrudAula from "./CrudAula";
import CrudAsignatura from "./CrudAsignatura";
import CrudAdministrativo from "./CrudAdministrativo";
import logo from "../assets/siga-logo.png";

function Administrativo() {
  const [seccionActiva, setSeccionActiva] = useState("usuario");

  const handleLogout = () => {
    localStorage.removeItem("token");
    window.location.href = "/";
  };

  const renderSeccion = () => {
    switch (seccionActiva) {
      case "rol":
        return <CrudRol />;
      case "usuario":
        return <CrudUsuario />;
      case "docente":
        return <CrudDocente />;
      case "aula":
        return <CrudAula />;
      case "asignatura":
        return <CrudAsignatura />;
      case "clases":
        return <CrudClases />;
      case "acudiente":
        return <CrudAcudiente />;
      case "curso":
        return <CrudCurso />;
      case "estudiante":
        return <CrudEstudiante />;
      case "administrativo":
        return <CrudAdministrativo />;
      default:
        return <h2>Seleccione una sección</h2>;
    }
  };

  return (
    <div className="admin-container">
      <div className="sidebar">
        <div className="sidebar-header">
          <img src={logo} alt="Logo SIGA" />
          <h3>Admin Panel</h3>
        </div>

        <button
          onClick={() => setSeccionActiva("rol")}
          className={seccionActiva === "rol" ? "active" : ""}
        >
          <FaShieldAlt /> Rol
        </button>

        <button
          onClick={() => setSeccionActiva("usuario")}
          className={seccionActiva === "usuario" ? "active" : ""}
        >
          <FaUser /> Usuario
        </button>

        <button
          onClick={() => setSeccionActiva("docente")}
          className={seccionActiva === "docente" ? "active" : ""}
        >
          <FaChalkboardTeacher /> Docente
        </button>

        <button
          onClick={() => setSeccionActiva("aula")}
          className={seccionActiva === "aula" ? "active" : ""}
        >
          <FaDoorOpen /> Aula
        </button>

        <button
          onClick={() => setSeccionActiva("asignatura")}
          className={seccionActiva === "asignatura" ? "active" : ""}
        >
          <FaBook /> Asignatura
        </button>

        <button
          onClick={() => setSeccionActiva("clases")}
          className={seccionActiva === "clases" ? "active" : ""}
        >
          <FaChalkboardTeacher /> Clases
        </button>

        <button
          onClick={() => setSeccionActiva("acudiente")}
          className={seccionActiva === "acudiente" ? "active" : ""}
        >
          <FaUsers /> Acudiente
        </button>

        <button
          onClick={() => setSeccionActiva("curso")}
          className={seccionActiva === "curso" ? "active" : ""}
        >
          <FaSchool /> Curso
        </button>

        <button
          onClick={() => setSeccionActiva("estudiante")}
          className={seccionActiva === "estudiante" ? "active" : ""}
        >
          <FaUserGraduate /> Estudiante
        </button>

        <button
          onClick={() => setSeccionActiva("administrativo")}
          className={seccionActiva === "administrativo" ? "active" : ""}
        >
          <FaFolderOpen /> Administrativo
        </button>

        <button onClick={handleLogout} className="logout-button">
          <FaSignOutAlt /> Cerrar sesión
        </button>
      </div>

      <div className="main-content">{renderSeccion()}</div>
    </div>
  );
}

export default Administrativo;
