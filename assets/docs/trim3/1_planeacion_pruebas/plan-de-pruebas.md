# Plan de pruebas de sistema MGM

Este plan de pruebas define la ruta de evaluación de calidad del sistema MGM en su fase de desarrollo. Esto con el fin de ayudar a garantizar que el sistema MGM cumpla con los requisitos del cliente y que se pueda identificar y corregir cualquier defecto o error en sus componentes. Por lo que se establecen los objetivos de las pruebas, los niveles de prueba, las características a probar y los criterios de evaluación.

### Objetivo

Verificar el funcionamiento de los componentes microservicio usuarios y microservicio productos del sistema MGM, además de su interfaz de usuario, en términos de su capacidad para realizar las funciones para las que han sido diseñados.

### Niveles de pruebas

- Pruebas de componente (API)
- Pruebas unitarias


### Tipos de pruebas

- Pruebas de integración
- Pruebas funcionales manuales


### Características

| **Características a probar** |  | **Características a no probar** |
| :--- | :--- | :--- |
| - Iniciar sesión | - Consultar productos | - Crear factura |
| - Crear usuarios | - Crear proveedores | - Consultar factura |
| - Consultar usuarios | - Consultar proveedores | - Eliminar factura |
| - Crear productos | - Cerrar sesión | - Actualizar factura |

### Criterios de aprobación

- Las pruebas están finalizadas y no existen bugs funcionales
- Todos los bugs encontrados tienen bajo nivel de severidad


### Entregables

- Reporte de ejecución de pruebas
- Reporte de bugs


### Entorno de pruebas

- Pruebas manuales
    - Sistema operativo Windows 10
    - Navegador: Google Chrome, última versión estable (116.0.5845.96)
    - Red: Wifi
- Pruebas automatizadas
    - Github Actions
    - Sistema operativo Ubuntu


### Estimación

| - Iniciar sesión | 6 h |
| :--- | :--- |
| - Crear usuarios | 4 h |
| - Consultar usuarios | 2 h |
| - Crear productos | 4 h |
| - Consultar productos | 2 h |
| - Crear proveedores | 4 h |
| - Consultar proveedores | 2 h |
| - Cerrar sesión | 2 h |


### Presuposiciones

Los desarrolladores (back-end y front-end) entregan el código relacionado a las caraterísticas en el repositorio de Github.

### Herramientas

- Postman
- Github Actions


### Referencias de pruebas

- Casos de uso
- Historias de usuario

