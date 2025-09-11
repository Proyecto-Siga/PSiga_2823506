<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Reporte de fallas</title>
</head>
<body>
    <h2>Reporte de inasistencias</h2>

    <p>Estimado acudiente,</p>

    <p>Le informamos que el estudiante <strong><?php echo e($estudiante->nombre); ?> <?php echo e($estudiante->apellido); ?></strong> ha acumulado un total de <strong><?php echo e($fallas); ?></strong> inasistencias a clases.</p>

    <p>Le recomendamos tomar las acciones necesarias para garantizar la asistencia del estudiante a futuras clases.</p>
    <p>Si lees esto te amo gallo :v</p>

    <p>Atentamente,<br>El equipo del sistema de asistencia.</p>
</body>
</html>
<?php /**PATH C:\xampp\htdocs\Repositorio_SIGA\PSiga_2823506\CODIGO PROYECTO\BACKEND\resources\views/emails/reporte_fallas.blade.php ENDPATH**/ ?>