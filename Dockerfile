# Usa una imagen base de Go 1.23.4
FROM golang:1.23.4

# Establece el directorio de trabajo dentro del contenedor
WORKDIR /app

# Copia los archivos del módulo para manejar dependencias
COPY go.mod go.sum ./
RUN go mod download

# Copia el resto de los archivos del proyecto al contenedor
COPY . .

# Expone el puerto 8080 para la API REST
EXPOSE 8080

# Compila la aplicación
RUN go build -o main .

# Ejecuta la aplicación
CMD ["./main"]


