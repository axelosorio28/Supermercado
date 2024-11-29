<?php
// Configuración de conexión a la base de datos
$servidor = "localhost";
$usuario = "root";
$contraseña = ""; // Cambia según tu configuración
$baseDatos = "supermercado";

// Crear conexión
$conn = new mysqli($servidor, $usuario, $contraseña, $baseDatos);

// Verificar la conexión
if ($conn->connect_error) {
    die("Conexión fallida: " . $conn->connect_error);
}

// Obtener los datos del formulario
$num_producto = $_POST['num_producto'];
$cantidad = $_POST['cantidad'];
$producto = $_POST['producto'];
$precio = $_POST['precio'];

// Validar datos
if (empty($num_producto) || empty($cantidad) || empty($producto) || empty($precio)) {
    die("Todos los campos son obligatorios.");
}

// Insertar los datos en la tabla 'ventas'
$sql = "INSERT INTO ventas (num_producto, cantidad, producto, precio) 
        VALUES ('$num_producto', $cantidad, '$producto', $precio)";

if ($conn->query($sql) === TRUE) {
    echo "Venta registrada exitosamente.";
} else {
    echo "Error: " . $sql . "<br>" . $conn->error;
}

// Cerrar la conexión
$conn->close();
?>

<!-- Botón para regresar a la página principal -->
<form action="ventas.html" method="get">
    <button type="submit">Registrar nueva Venta</button>
</form>
