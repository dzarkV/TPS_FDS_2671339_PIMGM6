# Plan de despliegue de la aplicación MGM

## Introducción
El propósito del presente documento es establecer cómo se llevarà a cabo la instalación del sistema MGM propuesta como solución a la Miscelanea Ginna Marcela, en su àmbito de producción final.

## Propósito
El software de invetario MGM permitirá a sus usuarios realizar el registro y seguimiento de los procesos de venta y compra de la microempresa beneficiada, con lo que se pretende obtener información precisa de las ganancias y de los gastos, así como el detalle de los productos existentes, los proveedores y las facturas que se generan.

## Alcance
Este documento es de interés para el cliente y para los involucrados en el desarrollo, pues se refiere a la primera puesta en marcha de la solución en la nube, y posterior uso a travès del navegador web.

## Planificación del despliegue
Se provee un script de aprovisionamiento de recursos en la nube y una serie de instrucciones para configurar ciertos recursos importantes que contienen el código del sistema MGM.

## Herramientas de despliegue
Las siguientes herramientas se usarán para el despliegue de los componentes necesarios para el funcionamiento del sistema MGM:

* Cuenta en la nube de Microsoft Azure
* La interfaz de la línea de comandos de Azure o Azure CLI
* Terraform como herramienta de infraestructura como código 
* Azure portal para detalles de configuración
