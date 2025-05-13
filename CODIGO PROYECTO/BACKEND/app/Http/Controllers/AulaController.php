<?php

namespace App\Http\Controllers;

use App\Models\Aula;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;

class AulaController extends Controller
{
    public function registrar(Request $request)
    {
        // Validar los datos de entrada
        $validator = Validator::make($request->all(), [
            'nombre_aula' => 'required|string|max:255',
        ]);

        if ($validator->fails()) {
            return response()->json(['error' => $validator->errors()], 400);
        }

        // Crear el aula
        $aula = Aula::create([
            'nombre_aula' => $request->nombre_aula,
        ]);

        return response()->json(['mensaje' => 'Aula registrado con éxito', 'aula' => $aula], 201);
    }

    public function index() {
        $aulas = Aula::all();
        
        $data = [
            'aulas' => $aulas,
            'status' => 200
        ];
        
        return response()->json($data,200);
    }
    public function update(Request $request, $id) {
        $aula = Aula::find($id);
    
        if (!$aula) {
            $data = [
                'mensaje' => 'Aula no encontrada',
                'status' => 404
            ];
            return response()->json($data, 404);
        }
    
        $validator = Validator::make($request->all(), [
        'nombre_aula' => 'required|string|max:255' . $aula->id,
        ]);
    
        if ($validator->fails()) {
            $data = [
                'mensaje' => 'Error al actualizar el aula',
                'error' => $validator->errors(),
                'status' => 400
            ];
            return response()->json($data, 400);
        }
    
        $aula->nombre_aula = $request->nombre_aula;
        $aula->save();
    
        $data = [
            'mensaje' => 'Aula actualizado con exito',
            'aula' => $aula,
            'status' => 200
        ];
        return response()->json($data, 200);
    }
    
    public function updatePartial(Request $request, $id) {
        $aula = Aula::find($id);
    
        if (!$aula) {
            $data = [
                'mensaje' => 'Aula no encontrada',
                'status' => 404
            ];
            return response()->json($data, 404);
        }
    
        $validator = Validator::make($request->all(), [
            'nombre_aula' => 'string',
        ]);
    
        if ($validator->fails()) {
            $data = [
                'mensaje' => 'Error al actualizar el aula',
                'error' => $validator->errors(),
                'status' => 400
            ];
            return response()->json($data, 400);
        }
    
        if ($request->has('nombre_aula')) {
            $aula->nombre_aula = $request->nombre_aula;
        }
    
        $aula->save();
    
        $data = [
            'mensaje' => 'Aula actualizado con exito',
            'aula' => $aula,
            'status' => 200
        ];
        return response()->json($data, 200);
    }
    
    public function destroy($id) {
        $aula = Aula::find($id);
    
        if (!$aula) {
            $data = [
                'mensaje' => 'Aula no encontrada',
                'status' => 404
            ];
            return response()->json($data, 404);
        }
    
        $aula->delete();
    
        $data = [
            'mensaje' => 'Aula eliminada con exito',
            'status' => 200
        ];
        return response()->json($data, 200);
    }   
}