<?php

namespace App\Http\Controllers;

use App\Models\Curso;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;

class CursoController extends Controller
{

    /**
 * @OA\Post(
 *     path="/api/registrar-cursos",
 *     summary="Registrar un nuevo curso",
 *     tags={"Cursos"},
 *     security={{"bearerAuth":{}}},
 *     @OA\RequestBody(
 *         required=true,
 *         @OA\JsonContent(
 *             required={"nombre"},
 *             @OA\Property(property="nombre", type="string", example="Octavo A")
 *         )
 *     ),
 *     @OA\Response(response=201, description="Curso registrado con éxito"),
 *     @OA\Response(response=400, description="Error de validación")
 * )
 */

    public function registrar(Request $request)
    {
        // Validar los datos de entrada
        $validator = Validator::make($request->all(), [
            'nombre' => 'required|string|unique:cursos,nombre',
        ]);

        if ($validator->fails()) {
            return response()->json(['error' => $validator->errors()], 400);
        }

        // Crear el curso
        $curso = Curso::create([
            'nombre' => $request->nombre,
        ]);

        return response()->json(['mensaje' => 'Curso registrado con éxito', 'curso' => $curso], 201);
    }
    
    /**
 * @OA\Get(
 *     path="/api/obtener-cursos",
 *     summary="Obtener todos los cursos",
 *     tags={"Cursos"},
 *     security={{"bearerAuth":{}}},
 *     @OA\Response(response=200, description="Lista de cursos")
 * )
 */

    public function index() {
        $cursos = Curso::all();
        
        $data = [
            'cursos' => $cursos,
            'status' => 200
        ];
        
        return response()->json($data,200);
    }

    /**
 * @OA\Put(
 *     path="/api/actualizar-cursos/{id}",
 *     summary="Actualizar un curso por ID",
 *     tags={"Cursos"},
 *     security={{"bearerAuth":{}}},
 *     @OA\Parameter(name="id", in="path", required=true, description="ID del curso", @OA\Schema(type="integer")),
 *     @OA\RequestBody(
 *         required=true,
 *         @OA\JsonContent(
 *             required={"nombre"},
 *             @OA\Property(property="nombre", type="string", example="Décimo B")
 *         )
 *     ),
 *     @OA\Response(response=200, description="Curso actualizado con éxito"),
 *     @OA\Response(response=400, description="Error de validación"),
 *     @OA\Response(response=404, description="Curso no encontrado")
 * )
 */

    public function update(Request $request, $id) {
        $curso = Curso::find($id);
    
        if (!$curso) {
            $data = [
                'mensaje' => 'Curso no encontrado',
                'status' => 404
            ];
            return response()->json($data, 404);
        }
    
        $validator = Validator::make($request->all(), [
            'nombre' => 'required|string|unique:cursos,nombre,' . $curso->id,
        ]);
    
        if ($validator->fails()) {
            $data = [
                'mensaje' => 'Error al actualizar el curso',
                'error' => $validator->errors(),
                'status' => 400
            ];
            return response()->json($data, 400);
        }
    
        $curso->nombre = $request->nombre;
        $curso->save();
    
        $data = [
            'mensaje' => 'Curso actualizado con exito',
            'curso' => $curso,
            'status' => 200
        ];
        return response()->json($data, 200);
    }

    /**
 * @OA\Patch(
 *     path="/api/actualizar-parcial-cursos/{id}",
 *     summary="Actualizar parcialmente un curso",
 *     tags={"Cursos"},
 *     security={{"bearerAuth":{}}},
 *     @OA\Parameter(name="id", in="path", required=true, description="ID del curso", @OA\Schema(type="integer")),
 *     @OA\RequestBody(
 *         @OA\JsonContent(
 *             @OA\Property(property="nombre", type="string", example="Noveno A")
 *         )
 *     ),
 *     @OA\Response(response=200, description="Curso actualizado parcialmente"),
 *     @OA\Response(response=400, description="Error de validación"),
 *     @OA\Response(response=404, description="Curso no encontrado")
 * )
 */

    public function updatePartial(Request $request, $id) {
        $curso = Curso::find($id);
    
        if (!$curso) {
            $data = [
                'mensaje' => 'Curso no encontrado',
                'status' => 404
            ];
            return response()->json($data, 404);
        }
    
        $validator = Validator::make($request->all(), [
            'nombre' => 'string',
        ]);
    
        if ($validator->fails()) {
            $data = [
                'mensaje' => 'Error al actualizar el curso',
                'error' => $validator->errors(),
                'status' => 400
            ];
            return response()->json($data, 400);
        }
    
        if ($request->has('nombre')) {
            $curso->nombre = $request->nombre;
        }
    
        $curso->save();
    
        $data = [
            'mensaje' => 'Curso actualizado con exito',
            'curso' => $curso,
            'status' => 200
        ];
        return response()->json($data, 200);
    }

    /**
 * @OA\Delete(
 *     path="/api/eliminar-cursos/{id}",
 *     summary="Eliminar un curso por ID",
 *     tags={"Cursos"},
 *     security={{"bearerAuth":{}}},
 *     @OA\Parameter(name="id", in="path", required=true, description="ID del curso", @OA\Schema(type="integer")),
 *     @OA\Response(response=200, description="Curso eliminado con éxito"),
 *     @OA\Response(response=404, description="Curso no encontrado")
 * )
 */

    
    public function destroy($id) {
        $curso = Curso::find($id);
    
        if (!$curso) {
            $data = [
                'mensaje' => 'Curso no encontrado',
                'status' => 404
            ];
            return response()->json($data, 404);
        }
    
        $curso->delete();
    
        $data = [
            'mensaje' => 'Curso eliminado con exito',
            'status' => 200
        ];
        return response()->json($data, 200);
    }   
}