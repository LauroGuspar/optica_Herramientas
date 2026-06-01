package com.herramientas.optica.modules.caja.repository;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.herramientas.optica.modules.caja.model.Caja;
import com.herramientas.optica.modules.caja.model.EstadoCaja;

@Repository
public interface CajaRepository extends JpaRepository<Caja, Long> {

    Optional<Caja> findByEmpleadoIdAndEstado(Long empleadoId, EstadoCaja estado);

    boolean existsByEmpleadoIdAndEstado(Long empleadoId, EstadoCaja estado);
}
