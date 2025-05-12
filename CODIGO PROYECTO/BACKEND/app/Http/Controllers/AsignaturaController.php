<?php

namespace App\Http\Controllers;

use App\Models\Asignatura;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;

class AsignaturaController extends Controller
{
    public function store(Request $request)
    {
     
        $validator = Validator::make($request->all(), [
            'nombre_asignatura' => 'required'
        ]);

        if ($validator->fails()) {
            return response()->json(['error' => $validator->errors()], 400);
        }

        // Crear el rol
        $asignatura = Asignatura::create([
            'nombre_asignatura' => $request->nombre_asignatura,
        ]);

        return response()->json(['mensaje' => 'Asignatura registrada con éxito', 'asignatura' => $asignatura], 201);
    }
}
