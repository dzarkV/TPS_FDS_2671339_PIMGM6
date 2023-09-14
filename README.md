# Inventory project

Este es el repositorio de los requerimientos y el desarrollo del
proyecto de inventario sistema MGM.

El sistema de archivos es

```bash
├── assets
│   └── docs
│       ├── trim1
│       │   ├── 1_gestion_proyecto
│       │   ├── 2_levantamiento_informacion
│       │   ├── 3_diagrama_procesos
│       │   ├── 4_requisitos_software
│       │   ├── 5_diagrama_casos_uso
│       │   ├── 6_casos_uso_extendido
│       │   ├── 7_diagrama_clases
│       │   └── 9_arquitectura_software
│       ├── trim2
│       │   ├── 1_mer
│       │   ├── 2_mr
│       │   ├── 3_diccionario_datos
│       │   ├── 4_bbdd
│       │   ├── 5_ddl
│       │   ├── 6_dml
│       ├── trim3
│       │   ├── 1_planeacion_pruebas
│       │   └── 2_ejecucion_pruebas
│       ├── trim4
│       └── trim5
├── backend
│   ├── proyectoGinnaMarcela
│   └── users-module
└── frontend
    └── sistema_inventario
```

La arquitectura inicial del proyecto distribuye al backend y al frontend de la siguiente manera:

![arquitectura_proyecto](./assets/docs/trim1/9_arquitectura_software/inventary-arq.jpg)

## Backend

* El módulo que gestiona a los usuarios y su atenticación en el sistema (con JWT) usa el framework [Fast API](https://fastapi.tiangolo.com/) y MongoBD como base de datos.
* El modulo que gestiona los productos usa el framework [Springboot](https://spring.io/projects/spring-boot)

Se esta usando [Github actions](https://docs.github.com/en/actions/quickstart) como CI/CD [aqui](https://github.com/dzarkV/TPS_FDS_2671339_PMGM6/actions/runs/6177413671/workflow).

## Frontend

Se construyó usando HTML, CSS y Javascript. Se consume con fetch las APIs de los microservicios del frontend.

## Tests

https://github.com/dzarkV/TPS_FDS_2671339_PMGM6/actions/runs/6177856071/attempts/1#summary-16769890679