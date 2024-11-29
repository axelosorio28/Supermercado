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
$num_factura = $_POST['num_factura'];
$cliente = $_POST['cliente'];
$monto = $_POST['monto'];
$fecha = $_POST['fecha'];

// Validar datos
if (empty($num_factura) || empty($cliente) || empty($monto) || empty($fecha)) {
    die("Todos los campos son obligatorios.");
}

// Insertar los datos en la tabla 'facturacion'
$sql = "INSERT INTO facturacion (num_factura, cliente, monto, fecha) 
        VALUES ('$num_factura', '$cliente', $monto, '$fecha')";

if ($conn->query($sql) === TRUE) {
    echo "Factura registrada exitosamente.";
} else {
    echo "Error: " . $sql . "<br>" . $conn->error;
}

// Cerrar la conexión
$conn->close();
?>

<!-- Botón para regresar a la página principal -->
<form action="facturacion.html" method="get">
    <button type="submit">Regristrar nueva facura</button>
</form>
