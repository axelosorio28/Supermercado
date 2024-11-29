<?php
// Configuración de conexión a la base de datos
$servidor = "localhost";
$usuario = "root";
$contraseña = ""; // Ajusta según tu configuración
$baseDatos = "supermercado";

// Crear conexión
$conn = new mysqli($servidor, $usuario, $contraseña, $baseDatos);

// Verificar conexión
if ($conn->connect_error) {
    die("Conexión fallida: " . $conn->connect_error);
}

// Obtener datos del formulario
$nombre_cliente = $_POST['nombre_cliente'];
$asunto = $_POST['asunto'];
$estado = $_POST['estado'];
$fecha = $_POST['fecha'];

// Validar campos
if (empty($nombre_cliente) || empty($asunto) || empty($estado) || empty($fecha)) {
    die("Todos los campos son obligatorios.");
}

// Insertar datos en la tabla `atencion_cliente`
$sql = "INSERT INTO atencion_cliente (nombre_cliente, asunto, estado, fecha) 
        VALUES ('$nombre_cliente', '$asunto', '$estado', '$fecha')";

if ($conn->query($sql) === TRUE) {
    echo "Ticket creado exitosamente.";
} else {
    echo "Error: " . $sql . "<br>" . $conn->error;
}

// Cerrar conexión
$conn->close();
?>

<!-- Botón para regresar a la página principal -->
<form action="atencion a clientes.html" method="get">
    <button type="submit">Regristrar nuevo Cliente</button>
</form>
