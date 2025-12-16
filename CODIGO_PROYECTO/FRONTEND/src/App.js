import { BrowserRouter, Routes, Route } from "react-router-dom";
import Login from "./components/Login";
import Docente from "./components/Docente";
import Administrativo from "./components/Administrativo";
import ProtectedRoute from "./components/ProtectedRoute";
import CrudClases from "./components/CrudClases";

function App() {
  return (
    <BrowserRouter>
      <Routes>
        <Route path="/" element={<Login />} />
        <Route path="/Docente" element={<ProtectedRoute allowedRoles={["2"]}> <Docente /></ProtectedRoute>} />
        <Route path="/Administrativo" element={<ProtectedRoute allowedRoles={["1"]}> <Administrativo /></ProtectedRoute>} />
        <Route path="/Docente/Clases" element={<ProtectedRoute allowedRoles={["2"]}><CrudClases /></ProtectedRoute>}/>
      </Routes>
    </BrowserRouter>
  );
}

export default App;
