package com.herramientas.optica.modules.caja.service;

import static org.assertj.core.api.Assertions.assertThat;
import static org.assertj.core.api.Assertions.assertThatThrownBy;

import java.math.BigDecimal;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.ActiveProfiles;
import org.springframework.transaction.annotation.Transactional;

import com.herramientas.optica.modules.caja.dto.AperturaCajaRequestDTO;
import com.herramientas.optica.modules.caja.dto.CajaResponseDTO;
import com.herramientas.optica.modules.caja.dto.CierreCajaRequestDTO;
import com.herramientas.optica.modules.caja.dto.GastoRequestDTO;
import com.herramientas.optica.modules.caja.dto.GastoResponseDTO;
import com.herramientas.optica.modules.caja.dto.MovimientoCajaRequestDTO;
import com.herramientas.optica.modules.caja.dto.MovimientoCajaResponseDTO;
import com.herramientas.optica.modules.caja.model.EstadoCaja;
import com.herramientas.optica.modules.caja.model.EstadoGasto;
import com.herramientas.optica.modules.caja.model.MetodoPagoCaja;
import com.herramientas.optica.modules.caja.model.OrigenMovimientoCaja;
import com.herramientas.optica.modules.caja.model.TipoMovimientoCaja;
import com.herramientas.optica.modules.caja.repository.MovimientoCajaRepository;
import com.herramientas.optica.modules.empleados.model.Empleado;
import com.herramientas.optica.modules.empleados.model.Perfil;
import com.herramientas.optica.modules.empleados.repository.EmpleadoRepository;
import com.herramientas.optica.modules.empleados.repository.PerfilRepository;

@SpringBootTest
@ActiveProfiles("test")
@Transactional
class CajaServiceTest {

    @Autowired
    private CajaService cajaService;

    @Autowired
    private MovimientoCajaRepository movimientoCajaRepository;

    @Autowired
    private EmpleadoRepository empleadoRepository;

    @Autowired
    private PerfilRepository perfilRepository;

    @Test
    void abrirCajaCreaCajaAbiertaConMontoInicial() {
        Empleado empleado = crearEmpleado("cajero_apertura");

        CajaResponseDTO caja = cajaService.abrirCaja(aperturaRequest(empleado.getId(), "150.00"));

        assertThat(caja.getId()).isNotNull();
        assertThat(caja.getEstado()).isEqualTo(EstadoCaja.ABIERTA);
        assertThat(caja.getEmpleadoId()).isEqualTo(empleado.getId());
        assertThat(caja.getMontoInicial()).isEqualByComparingTo("150.00");
        assertThat(caja.getMontoEsperado()).isEqualByComparingTo("150.00");
    }

    @Test
    void abrirSegundaCajaParaMismoEmpleadoFalla() {
        Empleado empleado = crearEmpleado("cajero_unico");
        cajaService.abrirCaja(aperturaRequest(empleado.getId(), "100.00"));

        assertThatThrownBy(() -> cajaService.abrirCaja(aperturaRequest(empleado.getId(), "50.00")))
                .isInstanceOf(IllegalStateException.class)
                .hasMessageContaining("ya tiene una caja abierta");
    }

    @Test
    void registrarMovimientoEnCajaAbiertaPersisteMovimiento() {
        Empleado empleado = crearEmpleado("cajero_movimiento");
        CajaResponseDTO caja = cajaService.abrirCaja(aperturaRequest(empleado.getId(), "100.00"));

        MovimientoCajaResponseDTO movimiento = cajaService.registrarMovimiento(
                caja.getId(),
                movimientoRequest(empleado.getId(), TipoMovimientoCaja.INGRESO, "25.50", "Ajuste por sobrante"));

        assertThat(movimiento.getId()).isNotNull();
        assertThat(movimiento.getCajaId()).isEqualTo(caja.getId());
        assertThat(movimiento.getTipo()).isEqualTo(TipoMovimientoCaja.INGRESO);
        assertThat(movimiento.getMonto()).isEqualByComparingTo("25.50");
        assertThat(movimientoCajaRepository.findByCajaIdOrderByFechaAsc(caja.getId())).hasSize(1);
    }

    @Test
    void registrarGastoCreaGastoYMovimientoDeEgreso() {
        Empleado empleado = crearEmpleado("cajero_gasto");
        CajaResponseDTO caja = cajaService.abrirCaja(aperturaRequest(empleado.getId(), "200.00"));

        GastoResponseDTO gasto = cajaService.registrarGasto(caja.getId(), gastoRequest(empleado.getId(), "12.30"));
        MovimientoCajaResponseDTO movimiento = cajaService.listarMovimientos(caja.getId()).get(0);

        assertThat(gasto.getId()).isNotNull();
        assertThat(gasto.getEstado()).isEqualTo(EstadoGasto.REGISTRADO);
        assertThat(gasto.getMovimientoCajaId()).isEqualTo(movimiento.getId());
        assertThat(movimiento.getTipo()).isEqualTo(TipoMovimientoCaja.EGRESO);
        assertThat(movimiento.getOrigen()).isEqualTo(OrigenMovimientoCaja.GASTO);
        assertThat(movimiento.getMonto()).isEqualByComparingTo("12.30");
    }

    @Test
    void registrarMovimientoEnCajaCerradaFalla() {
        Empleado empleado = crearEmpleado("cajero_cerrada");
        CajaResponseDTO caja = cajaService.abrirCaja(aperturaRequest(empleado.getId(), "100.00"));
        cajaService.cerrarCaja(caja.getId(), cierreRequest("100.00"));

        assertThatThrownBy(() -> cajaService.registrarMovimiento(
                caja.getId(),
                movimientoRequest(empleado.getId(), TipoMovimientoCaja.INGRESO, "10.00", "Movimiento tardio")))
                .isInstanceOf(IllegalStateException.class)
                .hasMessageContaining("esta cerrada");
    }

    @Test
    void cerrarCajaCalculaMontoEsperadoYDiferencia() {
        Empleado empleado = crearEmpleado("cajero_cierre");
        CajaResponseDTO caja = cajaService.abrirCaja(aperturaRequest(empleado.getId(), "100.00"));
        cajaService.registrarMovimiento(
                caja.getId(),
                movimientoRequest(empleado.getId(), TipoMovimientoCaja.INGRESO, "40.00", "Ingreso manual"));
        cajaService.registrarGasto(caja.getId(), gastoRequest(empleado.getId(), "15.00"));

        CajaResponseDTO cierre = cajaService.cerrarCaja(caja.getId(), cierreRequest("130.00"));

        assertThat(cierre.getEstado()).isEqualTo(EstadoCaja.CERRADA);
        assertThat(cierre.getTotalIngresos()).isEqualByComparingTo("40.00");
        assertThat(cierre.getTotalEgresos()).isEqualByComparingTo("15.00");
        assertThat(cierre.getMontoEsperado()).isEqualByComparingTo("125.00");
        assertThat(cierre.getMontoReal()).isEqualByComparingTo("130.00");
        assertThat(cierre.getDiferencia()).isEqualByComparingTo("5.00");
    }

    private Empleado crearEmpleado(String username) {
        Perfil perfil = perfilRepository.save(Perfil.builder()
                .nombre("PERFIL_" + username)
                .descripcion("Perfil de prueba")
                .estado(1)
                .build());

        return empleadoRepository.save(Empleado.builder()
                .nombre("Cajero")
                .username(username)
                .apellidoPaterno("Prueba")
                .apellidoMaterno("Caja")
                .correo(username + "@example.test")
                .contrasena("secret")
                .telefono(String.format("%09d", Math.abs(username.hashCode()) % 1_000_000_000))
                .direccion("Direccion de prueba")
                .estado(1)
                .numeroDocumento(String.format("%08d", Math.abs((username + "doc").hashCode()) % 100_000_000))
                .perfil(perfil)
                .idTipoDocumento(1L)
                .idEmpresa(1L)
                .build());
    }

    private AperturaCajaRequestDTO aperturaRequest(Long empleadoId, String montoInicial) {
        AperturaCajaRequestDTO dto = new AperturaCajaRequestDTO();
        dto.setEmpleadoId(empleadoId);
        dto.setMontoInicial(new BigDecimal(montoInicial));
        dto.setObservaciones("Apertura de prueba");
        return dto;
    }

    private MovimientoCajaRequestDTO movimientoRequest(Long empleadoId, TipoMovimientoCaja tipo, String monto,
            String descripcion) {
        MovimientoCajaRequestDTO dto = new MovimientoCajaRequestDTO();
        dto.setEmpleadoId(empleadoId);
        dto.setTipo(tipo);
        dto.setOrigen(OrigenMovimientoCaja.AJUSTE);
        dto.setMetodoPago(MetodoPagoCaja.EFECTIVO);
        dto.setMonto(new BigDecimal(monto));
        dto.setDescripcion(descripcion);
        return dto;
    }

    private GastoRequestDTO gastoRequest(Long empleadoId, String monto) {
        GastoRequestDTO dto = new GastoRequestDTO();
        dto.setEmpleadoId(empleadoId);
        dto.setCategoria("MOVILIDAD");
        dto.setDescripcion("Movilidad operativa");
        dto.setMonto(new BigDecimal(monto));
        dto.setMetodoPago(MetodoPagoCaja.EFECTIVO);
        return dto;
    }

    private CierreCajaRequestDTO cierreRequest(String montoReal) {
        CierreCajaRequestDTO dto = new CierreCajaRequestDTO();
        dto.setMontoReal(new BigDecimal(montoReal));
        dto.setObservaciones("Cierre de prueba");
        return dto;
    }
}
