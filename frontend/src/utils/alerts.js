import Swal from "sweetalert2";

const iconConfig = {
  warning: {
    icon: `<svg xmlns="http://www.w3.org/2000/svg" width="28" height="28" fill="currentColor" class="bi bi-exclamation-triangle-fill" viewBox="0 0 16 16">
      <path d="M8.982 1.566a1.13 1.13 0 0 0-1.96 0L.165 13.233c-.457.778.091 1.767.98 1.767h13.713c.889 0 1.438-.99.98-1.767L8.982 1.566zM8 5c.535 0 .954.462.9.995l-.35 3.507a.552.552 0 0 1-1.1 0L7.1 5.995A.905.905 0 0 1 8 5zm.002 6a1 1 0 1 1 0 2 1 1 0 0 1 0-2z"/>
    </svg>`,
    label: "Advertencia",
    color: "#f59e0b",
    bg: "#fffbeb",
    border: "#fde68a",
  },
  error: {
    icon: `<svg xmlns="http://www.w3.org/2000/svg" width="28" height="28" fill="currentColor" class="bi bi-x-circle-fill" viewBox="0 0 16 16">
      <path d="M16 8A8 8 0 1 1 0 8a8 8 0 0 1 16 0zM5.354 4.646a.5.5 0 1 0-.708.708L7.293 8l-2.647 2.646a.5.5 0 0 0 .708.708L8 8.707l2.646 2.647a.5.5 0 0 0 .708-.708L8.707 8l2.647-2.646a.5.5 0 0 0-.708-.708L8 7.293z"/>
    </svg>`,
    label: "Error",
    color: "#dc2626",
    bg: "#fef2f2",
    border: "#fecaca",
  },
  success: {
    icon: `<svg xmlns="http://www.w3.org/2000/svg" width="28" height="28" fill="currentColor" class="bi bi-check-circle-fill" viewBox="0 0 16 16">
      <path d="M16 8A8 8 0 1 1 0 8a8 8 0 0 1 16 0zm-3.97-3.03a.75.75 0 0 0-1.08.022L7.477 9.417 5.384 7.323a.75.75 0 0 0-1.06 1.06L6.97 11.03a.75.75 0 0 0 1.079-.02l3.992-4.99a.75.75 0 0 0-.01-1.05z"/>
    </svg>`,
    label: "Correcto",
    color: "#16a34a",
    bg: "#f0fdf4",
    border: "#bbf7d0",
  },
  info: {
    icon: `<svg xmlns="http://www.w3.org/2000/svg" width="28" height="28" fill="currentColor" class="bi bi-info-circle-fill" viewBox="0 0 16 16">
      <path d="M8 16A8 8 0 1 0 8 0a8 8 0 0 0 0 16zm.93-9.412-1 4.705c-.07.34.029.533.304.533.194 0 .487-.07.686-.246l-.088.416c-.287.346-.92.598-1.465.598-.703 0-1.002-.422-.808-1.319l.738-3.468c.064-.293.006-.399-.287-.47l-.451-.081.082-.381 2.29-.287zM8 5.5a1 1 0 1 1 0-2 1 1 0 0 1 0 2z"/>
    </svg>`,
    label: "Información",
    color: "#2563eb",
    bg: "#eff6ff",
    border: "#bfdbfe",
  },
};

const escapeHtml = (value = "") =>
  String(value)
    .replaceAll("&", "&amp;")
    .replaceAll("<", "&lt;")
    .replaceAll(">", "&gt;")
    .replaceAll('"', "&quot;")
    .replaceAll("'", "&#039;");

const buildAlertHtml = (titulo, texto, icono = "warning") => {
  const config = iconConfig[icono] || iconConfig.info;
  return `
        <div class="swal-pro-content">
            <div class="swal-pro-icon" style="background:${config.bg};border-color:${config.border};color:${config.color}">
                ${config.icon}
            </div>
            <div class="swal-pro-kicker" style="color:${config.color}">${config.label}</div>
            <h2 class="swal-pro-title">${escapeHtml(titulo)}</h2>
            <p class="swal-pro-text">${escapeHtml(texto)}</p>
        </div>
    `;
};

export const Toast = Swal.mixin({
  toast: true,
  position: "top-end",
  showConfirmButton: false,
  timer: 3000,
  timerProgressBar: true,
  didOpen: (toast) => {
    toast.addEventListener("mouseenter", Swal.stopTimer);
    toast.addEventListener("mouseleave", Swal.resumeTimer);
  },
});

export const confirmarAccion = async (
  titulo,
  texto,
  txtConfirmar = "Sí, continuar",
  icon = "warning",
) => {
  return await Swal.fire({
    html: buildAlertHtml(titulo, texto, icon),
    icon: undefined,
    showCancelButton: true,
    buttonsStyling: false,
    customClass: {
      popup: "swal-pro-card",
      actions: "swal-pro-actions",
      confirmButton:
        icon === "error" || icon === "warning"
          ? "swal-pro-confirm swal-pro-confirm--danger"
          : "swal-pro-confirm",
      cancelButton: "swal-pro-cancel",
    },
    confirmButtonText: txtConfirmar,
    cancelButtonText: "Cancelar",
    reverseButtons: true,
    focusCancel: icon === "warning" || icon === "error",
  });
};

export const mostrarAlerta = (titulo, texto, icono = "success") => {
  Swal.fire({
    html: buildAlertHtml(titulo, texto, icono),
    icon: undefined,
    buttonsStyling: false,
    customClass: {
      popup: "swal-pro-card",
      actions: "swal-pro-actions",
      confirmButton: "swal-pro-confirm",
    },
    confirmButtonText: "Entendido",
  });
};
