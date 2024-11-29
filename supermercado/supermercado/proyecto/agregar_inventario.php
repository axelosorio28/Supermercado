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
$precio = $_POST['precio'];

// Validar datos
if (empty($num_producto) || empty($cantidad) || empty($precio)) {
    die("Todos los campos son obligatorios.");
}

// Insertar los datos en la tabla 'inventario'
$sql = "INSERT INTO inventario (num_producto, cantidad, precio) 
        VALUES ('$num_producto', $cantidad, $precio)";

if ($conn->query($sql) === TRUE) {
    echo "Producto agregado exitosamente.";
} else {
    echo "Error: " . $sql . "<br>" . $conn->error;
}

// Cerrar la conexión
$conn->close();
?>

<a href="inventario.html"><button>Agregar mas Productos</button></a>
