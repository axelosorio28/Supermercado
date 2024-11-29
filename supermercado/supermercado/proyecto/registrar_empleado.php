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
$num_empleado = $_POST['num_empleado'];
$nombre = $_POST['nombre'];
$puesto = $_POST['puesto'];
$departamento = $_POST['departamento'];
$fecha_contratacion = $_POST['fecha_contratacion'];

// Validar datos
if (empty($num_empleado) || empty($nombre) || empty($puesto) || empty($departamento) || empty($fecha_contratacion)) {
    die("Todos los campos son obligatorios.");
}

// Insertar los datos en la tabla 'recursos_humanos'
$sql = "INSERT INTO recursos_humanos (num_empleado, nombre, puesto, departamento, fecha_contratacion) 
        VALUES ('$num_empleado', '$nombre', '$puesto', '$departamento', '$fecha_contratacion')";

if ($conn->query($sql) === TRUE) {
    echo "Empleado registrado exitosamente.";
} else {
    echo "Error: " . $sql . "<br>" . $conn->error;
}

// Cerrar la conexión
$conn->close();
?>

<!-- Botón para regresar a la página principal -->
<form action="recursos humanos.html" method="get">
    <button type="submit">Ingresar nuevo Empleado</button>
</form>
