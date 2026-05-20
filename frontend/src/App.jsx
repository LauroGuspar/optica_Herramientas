import { BrowserRouter, Routes, Route, Navigate } from 'react-router-dom';
import Login from './pages/Login';
import MainLayout from './layouts/MainLayout';
import ProtectedRoute from './components/ProtectedRoute';
import HomeDashboard from './pages/HomeDashboard';
import Empleados from './pages/Empleados';
import Perfiles from './pages/Perfiles';
import Clientes from './pages/Clientes';
import Marcas from './pages/Marcas';
import Categorias from './pages/Categorias';
import Unidades from './pages/Unidades';


function App() {
  return (
    <BrowserRouter>
      <Routes>
        <Route path="/login" element={<Login />} />

        <Route
          path="/dashboard"
          element={
            <ProtectedRoute>
              <MainLayout />
            </ProtectedRoute>
          }
        >
          <Route index element={<HomeDashboard />} />
          <Route path="clientes" element={<Clientes />} />

          <Route path="empleados" element={<Empleados />} />
          <Route path="perfiles" element={<Perfiles />} />
          <Route path="marcas" element={<Marcas />} />
          <Route path="categorias" element={<Categorias />} />
          <Route path="unidades" element={<Unidades />} />
        </Route>

        <Route path="*" element={<Navigate to="/login" />} />
      </Routes>
    </BrowserRouter>
  );
}

export default App;