<?php

namespace App\Http\Controllers;

use App\Models\Asistencia;
use App\Models\Reporte;
use App\Mail\ReporteFallasMail;
use Illuminate\Support\Facades\Mail;
use App\Models\Estudiante;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;

class AsistenciaController extends Controller
{
   
    public function registrar (Request $request)

   {
    $validator =Validator::make($request->all(), [

        'clase_id' =>'required|exists:clases,id',
        'estudiante_id' =>'required|exists:estudiantes,id',
        'estado' =>'required',
    ]);

    if ($validator->fails()) {
        return response()->json(['error' => $validator->errors()], 400);
        }

        //crear asistencia
        $asistencia =Asistencia::create([
            'clase_id' =>$request->clase_id,
            'estudiante_id' =>$request->estudiante_id,
            'estado' =>$request->estado,

        ]);

        // Desde acá empieza la lógica del reporte
            if ($request->estado == 0) {
        $estudianteId = $request->estudiante_id;

        // 3. Contar cuántas fallas ha tenido este estudiante
        $fallas = Asistencia::where('estudiante_id', $estudianteId)
                            ->where('estado', 0)
                            ->count();

        // 4. Verificar si ya se ha creado un reporte para este número de fallas
        $yaReportado = Reporte::where('estudiante_id', $estudianteId)
                              ->where('fallas_acumuladas', $fallas)
                              ->first();

        if (!$yaReportado && $fallas % 3 === 0){
            // 5. Obtener el correo del acudiente
            $estudiante = Estudiante::with('acudiente')->find($estudianteId);
            if ($estudiante && $estudiante->acudiente) {
            $correo = $estudiante->acudiente->correo;
            } else {
            \Log::warning("Estudiante sin acudiente: ID $estudianteId");
            }


            // 6. Crear el reporte

            \Log::info("📨 Reporte creado para estudiante ID: $estudianteId con $fallas fallas.");

            Reporte::create([
                'estudiante_id' => $estudianteId,
                'correo' => $correo,
                'fecha_reporte' => now()->toDateString(),
                'fallas_acumuladas' => $fallas,
            ]);
            \Log::info("Enviando correo a $correo por $fallas fallas.");

            // Envío del correo
            Mail::to($correo)->send(new ReporteFallasMail($estudiante, $fallas));
        }
    }

        return response()->json(['message' => 'Asistencia registrada', 'asistencia' => $asistencia]);
    }


    public function obtenerPorClase($clase_id)
{
    $asistencias = Asistencia::with('estudiante')->where('clase_id', $clase_id)->get();
    return response()->json(['asistencias' => $asistencias]);
}
}