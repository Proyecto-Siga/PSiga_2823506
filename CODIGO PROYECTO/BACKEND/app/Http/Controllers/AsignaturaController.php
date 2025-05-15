<?php

namespace App\Http\Controllers;

use App\Models\Asignatura;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;

class AsignaturaController extends Controller
{
    public function registrar (Request $request)
    {
    
        $validator = Validator::make($request->all(), [
            'nombre_asignatura' => 'required|string|max:255',
        ]);

        if ($validator->fails()) {
            return response()->json(['error' => $validator->errors()], 400);
        }

        // Crear la asignatura
        $asignatura = Asignatura::create([
            'nombre_asignatura' => $request->nombre_asignatura,
        ]);

        return response()->json(['mensaje' => 'Asignatura registrada con éxito', 'asignatura' => $asignatura], 201);

    }
    public function index() {
        $asignaturas = Asignatura::all();
        
        $data = [
            'asignaturas' => $asignaturas,
            'status' => 200
        ];
        
        return response()->json($data,200);
    }
    public function update(Request $request, $id) {
        $asignatura = Asignatura::find($id);

        if (!$asignatura) {
            $data = [
                'mensaje' => 'Asignatura no encontrada',
                'status' => 404
            ];
            return response()->json($data, 404);
        }

        $validator = Validator::make($request->all(), [
            'nombre_asignatura' => 'required|string|unique:asignaturas,nombre_asignatura,' . $asignatura->id,
        ]);

        if ($validator->fails()) {
            $data = [
                'mensaje' => 'Error al actualizar la asignatura',
                'error' => $validator->errors(),
                'status' => 400
            ];
            return response()->json($data, 400);
        }
        $asignatura->nombre_asignatura = $request->nombre_asignatura;
        $asignatura->save();

        $data = [
            'mensaje' => 'Asignatura actualizada con exito',
            'asignatura' => $asignatura,
            'status' => 200
        ];
        return response()->json($data, 200);

    }
    public function updatepartial($id) {
        $asignatura = Asignatura::find($id);

        if (!$asignatura) {
            $data = [
                'mensaje' => 'Asignatura no encontrada',
                'status' => 404
            ];
            return response()->json($data, 404);
        }

        $validator = Validator::make($request->all(), [
            'nombre_asignatura' => 'string',
        ]);

        if ($validator->fails()) {
            $data = [
                'mensaje' => 'Error al actualizar la asignatura',
                'error' => $validator->errors(),
                'status' => 400
            ];
            return response()->json($data, 400);
        }

        if ($request->has('nombre_asignatura')) {
            $asignatura->nombre_asignatura = $request->nombre_asignatura;
        }
        $asignatura->save();

        $data = [
            'mensaje' => 'Asignatura actualizada con exito',
            'asignatura' => $asignatura,
            'status' => 200
        ];
        return response()->json($data, 200);
    }

        public function destroy($id) {
        $asignatura = Asignatura::find($id);
    
        if (!$asignatura) {
            $data = [
                'mensaje' => 'Asingatura no encontrada',
                'status' => 404
            ];
            return response()->json($data, 404);
        }
    
        $curso->delete();
    
        $data = [
            'mensaje' => 'Asignatura eliminada con exito',
            'status' => 200
        ];
        return response()->json($data, 200);
    } 
}
    
    


