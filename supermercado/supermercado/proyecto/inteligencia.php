<?php
// Conexión a la base de datos
$host = 'localhost';
$dbname = 'supermercado';
$username = 'root'; // Cambia si usas un usuario distinto
$password = ''; // Cambia si tienes contraseña configurada

try {
    $conn = new PDO("mysql:host=$host;dbname=$dbname", $username, $password);
    $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

    // Verificar si se envió el formulario
    if ($_SERVER["REQUEST_METHOD"] == "POST") {
        $nombre = $_POST['nombre'];
        $correo = $_POST['correo'];
        $sugerencia = $_POST['sugerencia'];

        // Insertar datos en la tabla
        $sql = "INSERT INTO inteligencia_negocios (nombre, correo, sugerencia) 
                VALUES (:nombre, :correo, :sugerencia)";
        $stmt = $conn->prepare($sql);

        $stmt->bindParam(':nombre', $nombre);
        $stmt->bindParam(':correo', $correo);
        $stmt->bindParam(':sugerencia', $sugerencia);

        $stmt->execute();

        echo "¡Gracias por tu sugerencia! Ha sido registrada exitosamente.";
    }
} catch (PDOException $e) {
    echo "Error de conexión: " . $e->getMessage();
}
?>

<!-- Botón para regresar a la página principal -->
<form action="recursos humanos.html" method="get">
    <button type="submit">Regresar</button>
</form>