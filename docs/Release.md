# Guía de Gestión de Versiones y Despliegues (Releases)

Este documento detalla el flujo de trabajo para la gestión de ramas, versionado y despliegues en el proyecto **optica_Herramientas**. La estrategia se basa en pruebas locales rigurosas antes de promover cambios a producción, evitando la necesidad de un entorno de Staging en la nube.

---

## 1. Estrategia de Ramas en Git

El repositorio utiliza tres tipos de ramas principales para organizar el desarrollo y la estabilidad del código:

*   **`developers`**: Rama principal de desarrollo. Aquí se integran las nuevas características (*features*) y correcciones de errores diarias.
*   **`release/vX.Y.Z`**: Rama temporal de preparación para un lanzamiento específico (ej. `release/v1.0.1`). Aquí se realizan las pruebas locales y correcciones previas al despliegue.
*   **`main`**: Rama que contiene el código estable actualmente desplegado en producción. Solo recibe fusiones de ramas de `release/*` validadas.

---

## 2. Flujo de Trabajo para un Lanzamiento (Paso a Paso)

Cuando decidas consolidar los desarrollos de la rama `developers` y llevarlos a producción como una nueva versión (por ejemplo, `1.0.1`), sigue este flujo:

### Paso 2.1: Crear la rama de Release
A partir de la rama `developers` actualizada, crea una rama exclusiva para el lanzamiento:
```bash
git checkout developers
git pull origin developers
git checkout -b release/v1.0.1
```

### Paso 2.2: Configurar Versión Candidata (RC)
Para evitar conflictos y asegurar el control, actualiza los números de versión en el código indicando que es un candidato a lanzamiento (`RC`):
*   **Backend ([pom.xml](file:///home/rvelasco/Proyectos/optica_Herramientas/pom.xml)):**
    ```xml
    <version>1.0.1-RC1</version>
    ```
*   **Frontend ([frontend/package.json](file:///home/rvelasco/Proyectos/optica_Herramientas/frontend/package.json)):**
    ```json
    "version": "1.0.1-rc.1"
    ```
*   **Catálogo B2C ([catalogo-b2c/package.json](file:///home/rvelasco/Proyectos/optica_Herramientas/catalogo-b2c/package.json)):**
    ```json
    "version": "1.0.1-rc.1"
    ```

*Nota: La compilación de Docker es inmune a estos cambios de versión gracias al uso de comodines en el [Dockerfile](file:///home/rvelasco/Proyectos/optica_Herramientas/Dockerfile) (`COPY --from=build /app/target/optica-*.jar app.jar`).*

### Paso 2.3: Pruebas Locales (QA Local)
Levanta todo el stack tecnológico localmente para realizar las pruebas necesarias:
```bash
docker compose up --build
```
*   Prueba el flujo completo del sistema localmente.
*   Si encuentras errores, corrígelos directamente en la rama `release/v1.0.1`.
*   Si aplicas correcciones grandes, puedes actualizar la versión a `1.0.1-RC2` / `1.0.1-rc.2` para mantener la trazabilidad de tus pruebas locales.

### Paso 2.4: Fijar Versión Estable y Fusionar
Una vez que el sistema funcione perfectamente en tu máquina local:
1.  Cambia las versiones al valor definitivo estable en los archivos correspondientes (`pom.xml` y `package.json`):
    *   **Versión final:** `1.0.1` (elimina el sufijo `-RC1` o `-rc.1`).
2.  Realiza el commit final:
    ```bash
    git add .
    git commit -m "Bump version to stable 1.0.1"
    ```
3.  Fusiona los cambios a la rama `main` y envíalos al servidor:
    ```bash
    git checkout main
    git pull origin main
    git merge release/v1.0.1
    git push origin main
    ```
    *Al subir cambios a `main`, el pipeline de GitHub Actions ([deploy-vm.yml](file:///home/rvelasco/Proyectos/optica_Herramientas/.github/workflows/deploy-vm.yml)) se activará y desplegará automáticamente la versión estable en producción.*

### Paso 2.5: Sincronizar Rama de Desarrollo
Para asegurar que las correcciones hechas durante la fase de release se mantengan en el desarrollo futuro, fusiona la rama de release de vuelta a `developers`:
```bash
git checkout developers
git merge release/v1.0.1
git push origin developers
```

### Paso 2.6: Limpieza (Opcional)
Puedes eliminar la rama local de release una vez finalizado el proceso:
```bash
git branch -d release/v1.0.1
```

---

## 3. Registro en GitHub Releases

Para llevar un control histórico visual de tus despliegues, es recomendable crear una Release manual en la interfaz de GitHub después de cada despliegue en producción:

1.  Ve a tu repositorio en GitHub y haz clic en **Releases** -> **Draft a new release**.
2.  Configura los campos siguiendo este estándar:

| Campo | Release Candidate (Opcional) | Versión Estable (Producción) |
| :--- | :--- | :--- |
| **Choose a tag** | `v1.0.1-rc.1` | `v1.0.1` |
| **Target** | Rama `release/v1.0.1` | Rama `main` |
| **Release Title** | `v1.0.1-rc.1 - Pruebas Locales` | `v1.0.1` o `v1.0.1 - Título Descriptivo` |
| **Set as a pre-release** | **Sí (Marcado)** | **No (Desmarcado)** |

3.  Haz clic en **Generate release notes** para autogenerar la lista de cambios basados en tus commits y presiona **Publish release**.
