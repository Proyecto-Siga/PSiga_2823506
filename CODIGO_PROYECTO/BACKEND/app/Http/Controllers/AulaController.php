<?php

namespace App\Http\Controllers;

use App\Models\Aula;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;

class AulaController extends Controller
{

    /**
 * @OA\Post(
 *     path="/api/registrar-aulas",
 *     tags={"Aulas"},
 *     summary="Registrar un aula",
 *     security={{"bearerAuth":{}}},
 *     @OA\RequestBody(
 *         required=true,
 *         @OA\JsonContent(
 *             required={"nombre_aula"},
 *             @OA\Property(property="nombre_aula", type="string", example="Aula 1501")
 *         )
 *     ),
 *     @OA\Response(
 *         response=201,
 *         description="Aula registrada con éxito"
 *     ),
 *     @OA\Response(
 *         response=400,
 *         description="Error de validación"
 *     )
 * )
 */


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

    /**
 * @OA\Get(
 *     path="/api/obtener-aulas",
 *     tags={"Aulas"},
 *     summary="Obtener todas las aulas",
 *     security={{"bearerAuth":{}}},
 *     @OA\Response(
 *         response=200,
 *         description="Lista de aulas"
 *     )
 * )
 */

    public function index() {
        $aulas = Aula::all();
        
        $data = [
            'aulas' => $aulas,
            'status' => 200
        ];
        
        return response()->json($data,200);
    }

    /**
 * @OA\Put(
 *     path="/api/actualizar-aulas/{id}",
 *     tags={"Aulas"},
 *     summary="Actualizar un aula completamente",
 *     security={{"bearerAuth":{}}},
 *     @OA\Parameter(
 *         name="id",
 *         in="path",
 *         required=true,
 *         description="ID del aula",
 *         @OA\Schema(type="integer", example=1)
 *     ),
 *     @OA\RequestBody(
 *         required=true,
 *         @OA\JsonContent(
 *             required={"nombre_aula"},
 *             @OA\Property(property="nombre_aula", type="string", example="Aula 102")
 *         )
 *     ),
 *     @OA\Response(
 *         response=200,
 *         description="Aula actualizada con éxito"
 *     ),
 *     @OA\Response(
 *         response=400,
 *         description="Error de validación"
 *     ),
 *     @OA\Response(
 *         response=404,
 *         description="Aula no encontrada"
 *     )
 * )
 */

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

    /**
 * @OA\Patch(
 *     path="/api/actualizar-parcial-aulas/{id}",
 *     tags={"Aulas"},
 *     summary="Actualizar parcialmente un aula",
 *     security={{"bearerAuth":{}}},
 *     @OA\Parameter(
 *         name="id",
 *         in="path",
 *         required=true,
 *         description="ID del aula",
 *         @OA\Schema(type="integer", example=1)
 *     ),
 *     @OA\RequestBody(
 *         required=false,
 *         @OA\JsonContent(
 *             @OA\Property(property="nombre_aula", type="string", example="Aula 103")
 *         )
 *     ),
 *     @OA\Response(
 *         response=200,
 *         description="Aula actualizada parcialmente"
 *     ),
 *     @OA\Response(
 *         response=400,
 *         description="Error de validación"
 *     ),
 *     @OA\Response(
 *         response=404,
 *         description="Aula no encontrada"
 *     )
 * )
 */

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

    /**
 * @OA\Delete(
 *     path="/api/eliminar-aulas/{id}",
 *     tags={"Aulas"},
 *     summary="Eliminar un aula",
 *     security={{"bearerAuth":{}}},
 *     @OA\Parameter(
 *         name="id",
 *         in="path",
 *         required=true,
 *         description="ID del aula",
 *         @OA\Schema(type="integer", example=1)
 *     ),
 *     @OA\Response(
 *         response=200,
 *         description="Aula eliminada con éxito"
 *     ),
 *     @OA\Response(
 *         response=404,
 *         description="Aula no encontrada"
 *     )
 * )
 */

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