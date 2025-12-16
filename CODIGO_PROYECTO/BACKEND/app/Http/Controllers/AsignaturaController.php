<?php

namespace App\Http\Controllers;

use App\Models\Asignatura;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;

class AsignaturaController extends Controller
{

    /**
 * @OA\Post(
 *     path="/api/registrar-asignaturas",
 *     summary="Registrar una asignatura",
 *     tags={"Asignatura"},
 *     security={{"bearerAuth":{}}},
 *     @OA\RequestBody(
 *         required=true,
 *         @OA\JsonContent(ref="#/components/schemas/Asignatura")
 *     ),
 *     @OA\Response(
 *         response=201,
 *         description="Asignatura registrada con éxito"
 *     ),
 *     @OA\Response(
 *         response=400,
 *         description="Error de validación"
 *     )
 * )
 */


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

    /**
 * @OA\Get(
 *     path="/api/obtener-asignaturas",
 *     summary="Obtener todas las asignaturas",
 *     tags={"Asignatura"},
 *     security={{"bearerAuth":{}}},
 *     @OA\Response(
 *         response=200,
 *         description="Lista de asignaturas"
 *     )
 * )
 */

    public function index() {
        $asignaturas = Asignatura::all();
        
        $data = [
            'asignaturas' => $asignaturas,
            'status' => 200
        ];
        
        return response()->json($data,200);
    }

    /**
 * @OA\Put(
 *     path="/api/actualizar-asignaturas/{id}",
 *     summary="Actualizar completamente una asignatura",
 *     tags={"Asignatura"},
 *     security={{"bearerAuth":{}}},
 *     @OA\Parameter(
 *         name="id",
 *         in="path",
 *         required=true,
 *         description="ID de la asignatura",
 *         @OA\Schema(type="integer")
 *     ),
 *     @OA\RequestBody(
 *         required=true,
 *         @OA\JsonContent(ref="#/components/schemas/Asignatura")
 *     ),
 *     @OA\Response(
 *         response=200,
 *         description="Asignatura actualizada con éxito"
 *     ),
 *     @OA\Response(
 *         response=400,
 *         description="Error de validación"
 *     ),
 *     @OA\Response(
 *         response=404,
 *         description="Asignatura no encontrada"
 *     )
 * )
 */

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

    /**
 * @OA\Patch(
 *     path="/api/actualizar-parcial-asignaturas/{id}",
 *     summary="Actualizar parcialmente una asignatura",
 *     tags={"Asignatura"},
 *     security={{"bearerAuth":{}}},
 *     @OA\Parameter(
 *         name="id",
 *         in="path",
 *         required=true,
 *         description="ID de la asignatura",
 *         @OA\Schema(type="integer")
 *     ),
 *     @OA\RequestBody(
 *         required=true,
 *         @OA\JsonContent(
 *             @OA\Property(property="nombre_asignatura", type="string", example="Ciencias Naturales")
 *         )
 *     ),
 *     @OA\Response(
 *         response=200,
 *         description="Asignatura actualizada parcialmente"
 *     ),
 *     @OA\Response(
 *         response=400,
 *         description="Error de validación"
 *     ),
 *     @OA\Response(
 *         response=404,
 *         description="Asignatura no encontrada"
 *     )
 * )
 */

    public function updatePartial($id) {
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

    /**
 * @OA\Delete(
 *     path="/api/eliminar-asignaturas/{id}",
 *     summary="Eliminar una asignatura",
 *     tags={"Asignatura"},
 *     security={{"bearerAuth":{}}},
 *     @OA\Parameter(
 *         name="id",
 *         in="path",
 *         required=true,
 *         description="ID de la asignatura",
 *         @OA\Schema(type="integer")
 *     ),
 *     @OA\Response(
 *         response=200,
 *         description="Asignatura eliminada con éxito"
 *     ),
 *     @OA\Response(
 *         response=404,
 *         description="Asignatura no encontrada"
 *     )
 * )
 */


        public function destroy($id) {
            
        $asignatura = Asignatura::find($id);
    
        if (!$asignatura) {
            $data = [
                'mensaje' => 'Asingatura no encontrada',
                'status' => 404
            ];
            return response()->json($data, 404);
        }
    
        $asignatura->delete();
    
        $data = [
            'mensaje' => 'Asignatura eliminada con exito',
            'status' => 200
        ];
        return response()->json($data, 200);
    } 
}
    
    


