<?php
// Configuración de conexión a la base de datos
$servername = "localhost"; // Cambiar si usas un servidor remoto
$username = "root";        // Usuario predeterminado en XAMPP
$password = "";            // Contraseña predeterminada (vacía en XAMPP)
$database = "supermercado"; // Nombre de tu base de datos

// Crear conexión
$conn = new mysqli($servername, $username, $password, $database);

// Verificar conexión
if ($conn->connect_error) {
    die("Conexión fallida: " . $conn->connect_error);
}

// Obtener datos del formulario
$user = $_POST['username'];
$pass = $_POST['password'];

// Preparar y ejecutar consulta SQL
$sql = "SELECT * FROM usuarios WHERE username = ? AND password = ?";
$stmt = $conn->prepare($sql);
$stmt->bind_param("ss", $user, $pass); // Evita inyecciones SQL
$stmt->execute();
$result = $stmt->get_result();

// Verificar si las credenciales son correctas
if ($result->num_rows > 0) {
    // Redirigir a pagina.html si el inicio de sesión es exitoso
    header("http://localhost/supermercado/proyecto/pagina.html");
    exit(); // Asegura que el script se detenga después de la redirección
} else {
    // Mostrar mensaje de error si las credenciales son incorrectas
    echo "Nombre de usuario o contraseña incorrectos.";
}

// Cerrar conexión
$stmt->close();
$conn->close();
?>

