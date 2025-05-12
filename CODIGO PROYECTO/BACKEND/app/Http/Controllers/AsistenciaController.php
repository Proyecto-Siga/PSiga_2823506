<?php

namespace App\Http\Controllers;

use App\Models\Asistencia;
use Illuminate\Http\Request;

class AsistenciaController extends Controller
{
    // Registrar o actualizar asistencia
    public function marcar(Request $request)
    {
        $request->validate([
            'clase_id' => 'required|exists:clase,id',
            'estudiante_id' => 'required|exists:estudiante,id',
            'estado' => 'required',
        ]);

        $asistencia = Asistencia::updateOrCreate(
            [
                'clase_id' => $request->clase_id,
                'estudiante_id' => $request->estudiante_id,
                'estado' => $request->estado,
            ],
        );

        return response()->json(['message' => 'Asistencia registrada', 'asistencia' => $asistencia]);
    }
}