# Establecer la imagen base
FROM nginx:alpine3.18-slim

# Copiar el archivo de configuración de nginx
COPY nginx.conf /etc/nginx/nginx.conf

# Copiar los archivos estáticos de la aplicación al directorio de trabajo
COPY sistema_inventario /usr/share/nginx/html

# Exponer el puerto 80
EXPOSE 80

# Iniciar Nginx cuando se arranca el contenedor
CMD ["nginx", "-g", "daemon off;"]
