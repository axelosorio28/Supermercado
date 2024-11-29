<?php
// Incluir el archivo de conexión
require 'conexion.php';
require 'sesion.html';

// Obtener datos del formulario
$username = $_POST['username'];
$password = $_POST['password'];

// Preparar y ejecutar consulta para verificar credenciales
$sql = "SELECT * FROM usuarios WHERE username = ? AND password = ?";
$stmt = $conn->prepare($sql);
$stmt->bind_param("ss", $username, $password); // Evitar inyecciones SQL
$stmt->execute();
$result = $stmt->get_result();

// Verificar si las credenciales son correctas
if ($result->num_rows > 0) {
    // Credenciales válidas, redirigir al usuario
    header("Location: http://localhost/supermercado/proyecto/sesion.html");
    exit(); // Asegurar que el script se detenga después de la redirección
} else {
    // Credenciales inválidas, mostrar mensaje de error
    echo "Nombre de usuario o contraseña incorrectos.";
}

// Cerrar conexión
$stmt->close();
$conn->close();
?>
