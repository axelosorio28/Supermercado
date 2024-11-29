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
$num_registro = $_POST['num_registro'];
$descripcion = $_POST['descripcion'];
$monto = $_POST['monto'];
$fecha = $_POST['fecha'];
$tipo = $_POST['tipo'];

// Validar datos
if (empty($num_registro) || empty($descripcion) || empty($monto) || empty($fecha)|| empty($tipo)) {
    die("Todos los campos son obligatorios.");
}

// Insertar los datos en la tabla 'finanzas'
$sql = "INSERT INTO finanzas (num_registro, descripcion, monto, fecha, tipo) 
        VALUES ('$num_registro', '$descripcion', $monto, '$fecha', '$tipo')";

if ($conn->query($sql) === TRUE) {
    echo "Transacción registrada exitosamente.";
} else {
    echo "Error: " . $sql . "<br>" . $conn->error;
}

// Cerrar la conexión
$conn->close();
?>

<!-- Botón para regresar a la página principal -->
<form action="finanzas.html" method="get">
    <button type="submit">Registrar nueva Transaccion</button>
</form>
