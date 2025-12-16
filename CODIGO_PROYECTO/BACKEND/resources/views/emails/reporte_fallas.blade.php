<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Reporte de fallas</title>
</head>
<body>
    <h2>Reporte de inasistencias</h2>

    <p>Estimado acudiente,</p>

    <p>Le informamos que el estudiante <strong>{{ $estudiante->nombre }} {{ $estudiante->apellido }}</strong> ha acumulado un total de <strong>{{ $fallas }}</strong> inasistencias a clases.</p>

    <p>Le recomendamos tomar las acciones necesarias para garantizar la asistencia del estudiante a futuras clases.</p>
    <p>Si lees esto te amo gallo :v</p>

    <p>Atentamente,<br>El equipo del sistema de asistencia.</p>
</body>
</html>
