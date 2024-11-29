<?php
// Configuración de la base de datos
$host = "localhost"; // Cambiar si es necesario
$usuario = "root"; // Cambiar si es necesario
$password = ""; // Cambiar si es necesario
$base_datos = "supermercado";

// Crear la conexión
$conexion = new mysqli($host, $usuario, $password, $base_datos);

// Verificar la conexión
if ($conexion->connect_error) {
    die("Error de conexión: " . $conexion->connect_error);
}

// Obtener datos del formulario
$nombre_cliente = $_POST['nombre_cliente'];
$asunto = $_POST['asunto'];
$estado = $_POST['estado'];
$fecha_creacion = $_POST['fecha_creacion'];

// Insertar datos en la tabla atencion_cliente
$sql = "INSERT INTO atencion_cliente (nombre_cliente, asunto, estado, fecha_creacion) 
        VALUES (?, ?, ?, ?)";
$stmt = $conexion->prepare($sql);
$stmt->bind_param("ssss", $nombre_cliente, $asunto, $estado, $fecha_creacion);

if ($stmt->execute()) {
    echo "Ticket creado exitosamente.";
} else {
    echo "Error al crear el ticket: " . $conexion->error;
}

// Cerrar la conexión
$stmt->close();
$conexion->close();
?>

<!-- Botón para regresar a la página principal -->
<form action="atencion.html" method="get">
    <button type="submit">Nuevo Registro </button>
</form>