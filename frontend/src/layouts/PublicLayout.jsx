import React, { useState, useEffect } from "react";
import { Outlet } from "react-router-dom";
import axios from "axios";
import { 
  Globe, 
  Telephone, 
  Envelope, 
  GeoAlt, 
  Clock, 
  Facebook, 
  Instagram, 
  Tiktok 
} from "react-bootstrap-icons";

const PublicLayout = () => {
  const [config, setConfig] = useState(null);

  useEffect(() => {
    const fetchConfig = async () => {
      try {
        const res = await axios.get("/api/v1/public/web-config");
        setConfig(res.data);
      } catch (error) {
        console.error("No se pudo cargar la configuración de cabecera:", error);
      }
    };
    fetchConfig();
  }, []);

  const styles = {
    layout: { display: "flex", flexDirection: "column", minHeight: "100vh", fontFamily: "'Segoe UI', Roboto, sans-serif", backgroundColor: "#f8fafc" },
    topbar: { backgroundColor: "#0f172a", color: "#e2e8f0", fontSize: "12px", padding: "6px 24px", display: "flex", justifyContent: "space-between", flexWrap: "wrap", gap: "10px" },
    topbarItem: { display: "flex", alignItems: "center", gap: "6px" },
    navbar: { backgroundColor: "#ffffff", borderBottom: "1px solid #e2e8f0", padding: "14px 24px", display: "flex", justifyContent: "space-between", alignItems: "center", position: "sticky", top: 0, zIndex: 100, boxShadow: "0 2px 4px rgba(0,0,0,0.02)" },
    logoContainer: { display: "flex", alignItems: "center", gap: "10px", textDecoration: "none" },
    logoImg: { height: "40px", width: "auto", objectFit: "contain" },
    logoText: { fontSize: "20px", fontWeight: "700", color: "#0f172a", margin: 0 },
    socials: { display: "flex", gap: "12px", alignItems: "center" },
    socialLink: { color: "#475569", transition: "color 150ms", display: "flex", alignItems: "center" },
    main: { flex: 1, display: "flex", flexDirection: "column" },
    footer: { backgroundColor: "#0f172a", color: "#94a3b8", padding: "40px 24px 20px", marginTop: "auto", borderTop: "1px solid #1e293b", fontSize: "14px" },
    footerGrid: { maxWidth: "1200px", margin: "0 auto", display: "grid", gridTemplateColumns: "repeat(auto-fit, minmax(250px, 1fr))", gap: "30px", marginBottom: "30px" },
    footerTitle: { color: "#ffffff", fontSize: "16px", fontWeight: "600", marginBottom: "16px" },
    footerText: { lineHeight: "1.6", margin: "0 0 10px 0" },
    copyright: { textAlign: "center", borderTop: "1px solid #1e293b", paddingTop: "20px", fontSize: "12px" }
  };

  return (
    <div style={styles.layout}>
      {/* Topbar Informativa */}
      <div style={styles.topbar}>
        <div style={{ display: "flex", gap: "20px", flexWrap: "wrap" }}>
          {config?.horarioAtencion && (
            <div style={styles.topbarItem}>
              <Clock size={13} /> {config.horarioAtencion}
            </div>
          )}
          {config?.direccion && (
            <div style={styles.topbarItem}>
              <GeoAlt size={13} /> {config.direccion}
            </div>
          )}
        </div>
        <div style={{ display: "flex", gap: "20px" }}>
          {config?.telefonoContacto && (
            <div style={styles.topbarItem}>
              <Telephone size={13} /> {config.telefonoContacto}
            </div>
          )}
        </div>
      </div>

      {/* Navbar Principal */}
      <header style={styles.navbar}>
        <a href="/catalogo" style={styles.logoContainer}>
          {config?.logoUrl ? (
            <img src={config.logoUrl} alt="Logo" style={styles.logoImg} />
          ) : (
            <Globe size={28} style={{ color: "#2563eb" }} />
          )}
          <span style={styles.logoText}>Nuestra Óptica</span>
        </a>

        {/* Enlaces de Redes Sociales */}
        <div style={styles.socials}>
          {config?.enlaceFacebook && (
            <a href={config.enlaceFacebook} target="_blank" rel="noopener noreferrer" style={styles.socialLink} title="Facebook">
              <Facebook size={20} />
            </a>
          )}
          {config?.enlaceInstagram && (
            <a href={config.enlaceInstagram} target="_blank" rel="noopener noreferrer" style={styles.socialLink} title="Instagram">
              <Instagram size={20} />
            </a>
          )}
          {config?.enlaceTiktok && (
            <a href={config.enlaceTiktok} target="_blank" rel="noopener noreferrer" style={styles.socialLink} title="Tiktok">
              <Tiktok size={20} />
            </a>
          )}
        </div>
      </header>

      {/* Contenido de la Página */}
      <main style={styles.main}>
        <Outlet />
      </main>

      {/* Footer */}
      <footer style={styles.footer}>
        <div style={styles.footerGrid}>
          <div>
            <h4 style={styles.footerTitle}>Sobre Nosotros</h4>
            <p style={styles.footerText}>
              Cuidamos tu salud visual con los mejores profesionales, monturas de calidad y la última tecnología en cristales ópticos.
            </p>
          </div>
          <div>
            <h4 style={styles.footerTitle}>Contacto</h4>
            {config?.telefonoContacto && (
              <p style={styles.topbarItem}><Telephone size={14} /> {config.telefonoContacto}</p>
            )}
            {config?.correoContacto && (
              <p style={styles.topbarItem}><Envelope size={14} /> {config.correoContacto}</p>
            )}
            {config?.direccion && (
              <p style={styles.topbarItem}><GeoAlt size={14} /> {config.direccion}</p>
            )}
          </div>
          <div>
            <h4 style={styles.footerTitle}>Horario Comercial</h4>
            {config?.horarioAtencion ? (
              <p style={styles.topbarItem}><Clock size={14} /> {config.horarioAtencion}</p>
            ) : (
              <p style={styles.footerText}>Lunes a Sábado: 9:00 AM - 8:00 PM</p>
            )}
          </div>
        </div>
        <div style={styles.copyright}>
          &copy; {new Date().getFullYear()} Nuestra Óptica. Todos los derechos reservados.
        </div>
      </footer>
    </div>
  );
};

export default PublicLayout;
