package com.herramientas.optica.modules.productos.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.herramientas.optica.modules.productos.model.Unidad;
import com.herramientas.optica.modules.productos.repository.ProductoRepository;
import com.herramientas.optica.modules.productos.repository.UnidadRepository;

@Service
public class UnidadService {

    private final UnidadRepository unidadRepository;
    private final ProductoRepository productoRepository;

    public UnidadService(UnidadRepository unidadRepository, ProductoRepository productoRepository) {
        this.unidadRepository = unidadRepository;
        this.productoRepository = productoRepository;
    }

    public List<Unidad> listarGestion() {
        return unidadRepository.findByEstadoNot(0);
    }

    @Transactional
    public Unidad crear(Unidad request) {
        String nombre = request.getNombre().trim().toUpperCase();
        if (unidadRepository.existsByNombre(nombre)) {
            throw new IllegalArgumentException("La unidad '" + nombre + "' ya está registrada.");
        }
        request.setNombre(nombre);
        request.setEstado(1);
        return unidadRepository.save(request);
    }

    @Transactional
    public Unidad cambiarEstado(Integer id) {
        Unidad unidad = unidadRepository.findById(id)
                .orElseThrow(() -> new IllegalArgumentException("Unidad no encontrada."));

        if (unidad.getEstado() == 1) {
            long conteo = productoRepository.countByUnidadVentaIdOrUnidadCompraIdAndEstadoNot(id, id, 0);
            if (conteo > 0) {
                throw new IllegalStateException("La unidad '" + unidad.getNombre() +
                        "' está siendo usada como unidad de compra o venta en " + conteo + " productos.");
            }
        }

        unidad.setEstado(unidad.getEstado() == 1 ? 2 : 1);
        return unidadRepository.save(unidad);
    }

    @Transactional
    public void eliminar(Integer id) {
        Unidad unidad = unidadRepository.findById(id).orElseThrow();

        long conteo = productoRepository.countByUnidadVentaIdOrUnidadCompraIdAndEstadoNot(id, id, 0);
        if (conteo > 0) {
            throw new IllegalStateException("No se puede eliminar la unidad '" + unidad.getNombre() +
                    "' porque hay productos que dependen de ella.");
        }

        unidad.setEstado(0);
        unidadRepository.save(unidad);
    }
}