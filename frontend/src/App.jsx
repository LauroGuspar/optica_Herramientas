import { useState, useEffect } from 'react';
import { BrowserRouter, Routes, Route, Navigate } from 'react-router-dom';
import Login from './pages/Login';
import MainLayout from './layouts/MainLayout';
import ProtectedRoute from './components/ProtectedRoute';
import HomeDashboard from './pages/HomeDashboard';
import Empleados from './pages/Empleados';
import Perfiles from './pages/Perfiles';
import Clientes from './pages/Clientes';
import { getMisOpciones } from './api/authService';

function App() {
  const [opciones, setOpciones] = useState([]);
  const token = localStorage.getItem('token');

  useEffect(() => {
    if (token) {
      cargarOpciones();
    }
  }, [token]);

  const cargarOpciones = async () => {
    try {
      const data = await getMisOpciones();
      setOpciones(data);
    } catch (error) {
      console.error("Error al cargar opciones:", error);
    }
  };

  return (
    <BrowserRouter>
      <Routes>
        <Route path="/login" element={<Login />} />

        <Route
          path="/"
          element={
            <ProtectedRoute>
              <MainLayout opciones={opciones} />
            </ProtectedRoute>
          }
        >
          <Route index element={<HomeDashboard />} />
          <Route path="clientes" element={<Clientes />} />
          <Route path="empleados" element={<Empleados />} />
          <Route path="perfiles" element={<Perfiles />} />
        </Route>

        <Route path="*" element={<Navigate to="/login" />} />
      </Routes>
    </BrowserRouter>
  );
}

export default App;