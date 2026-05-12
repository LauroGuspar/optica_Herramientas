package com.herramientas.optica.modules.productos.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.herramientas.optica.modules.productos.model.Categoria;
import com.herramientas.optica.modules.productos.repository.CategoriaRepository;
import com.herramientas.optica.modules.productos.repository.ProductoRepository;

@Service
public class CategoriaService {

    private final CategoriaRepository categoriaRepository;
    private final ProductoRepository productoRepository;

    private static final int ESTADO_ACTIVO = 1;
    private static final int ESTADO_INACTIVO = 2;
    private static final int ESTADO_BORRADO = 0;

    public CategoriaService(CategoriaRepository categoriaRepository, ProductoRepository productoRepository) {
        this.categoriaRepository = categoriaRepository;
        this.productoRepository = productoRepository;
    }

    public List<Categoria> listarGestion() {
        return categoriaRepository.findByEstadoNot(ESTADO_BORRADO);
    }

    @Transactional
    public Categoria crear(Categoria request) {
        String nombreLimpio = request.getNombre().trim().toUpperCase();
        if (categoriaRepository.existsByNombre(nombreLimpio)) {
            throw new IllegalArgumentException("La categoría '" + nombreLimpio + "' ya existe.");
        }
        request.setNombre(nombreLimpio);
        request.setEstado(ESTADO_ACTIVO);
        return categoriaRepository.save(request);
    }

    @Transactional
    public Categoria actualizar(Long id, Categoria request) {
        Categoria categoria = categoriaRepository.findById(id)
                .orElseThrow(() -> new IllegalArgumentException("Categoría no encontrada."));

        String nombreNuevo = request.getNombre().trim().toUpperCase();
        if (!categoria.getNombre().equals(nombreNuevo) && categoriaRepository.existsByNombre(nombreNuevo)) {
            throw new IllegalArgumentException("Ya existe otra categoría con el nombre '" + nombreNuevo + "'.");
        }

        categoria.setNombre(nombreNuevo);
        return categoriaRepository.save(categoria);
    }

    @Transactional
    public Categoria cambiarEstado(Long id) {
        Categoria categoria = categoriaRepository.findById(id)
                .orElseThrow(() -> new IllegalArgumentException("Categoría no encontrada."));

        if (categoria.getEstado() == ESTADO_ACTIVO) {
            long conteo = productoRepository.countByCategoriaIdAndEstadoNot(id, ESTADO_BORRADO);
            if (conteo > 0) {
                throw new IllegalStateException("No se puede desactivar la categoría '" + categoria.getNombre() +
                        "' porque tiene productos vinculados.");
            }
        }
        categoria.setEstado(categoria.getEstado() == ESTADO_ACTIVO ? ESTADO_INACTIVO : ESTADO_ACTIVO);
        return categoriaRepository.save(categoria);
    }

    @Transactional
    public void eliminar(Long id) {
        Categoria categoria = categoriaRepository.findById(id).orElseThrow();
        long conteo = productoRepository.countByCategoriaIdAndEstadoNot(id, ESTADO_BORRADO);
        if (conteo > 0) {
            throw new IllegalStateException("No se puede eliminar una categoría con productos activos.");
        }
        categoria.setEstado(ESTADO_BORRADO);
        categoriaRepository.save(categoria);
    }
}