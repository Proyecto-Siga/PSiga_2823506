<?php

namespace App\Http\Controllers;

use App\Models\Asistencia;
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

        return response()->json(['message' => 'Asistencia registrada', 'asistencia' => $asistencia]);
    }
}