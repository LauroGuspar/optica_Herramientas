package com.herramientas.optica.modules.productos.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.herramientas.optica.modules.productos.model.Producto;

@Repository
public interface ProductoRepository extends JpaRepository<Producto, Long> {
    long countByCategoriaIdAndEstadoNot(Long categoriaId, Integer estado);

    long countByMarcaIdAndEstadoNot(Long marcaId, Integer estado);

    long countByUnidadVentaIdOrUnidadCompraIdAndEstadoNot(Integer unidadVentaId, Integer unidadCompraId,
            Integer estado);
}