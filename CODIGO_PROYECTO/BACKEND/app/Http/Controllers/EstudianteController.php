<?php

namespace App\Http\Controllers;

use App\Models\Estudiante;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;

class EstudianteController extends Controller
{

    /**
 * @OA\Post(
 *     path="/api/registrar-estudiantes",
 *     summary="Registrar un nuevo estudiante",
 *     tags={"Estudiantes"},
 *     security={{"bearerAuth":{}}},
 *     @OA\RequestBody(
 *         required=true,
 *         @OA\JsonContent(
 *             required={"nombre", "apellido", "acudiente_id", "curso_id"},
 *             @OA\Property(property="nombre", type="string", example="Juan"),
 *             @OA\Property(property="apellido", type="string", example="Pérez"),
 *             @OA\Property(property="acudiente_id", type="integer", example=2),
 *             @OA\Property(property="curso_id", type="integer", example=5)
 *         )
 *     ),
 *     @OA\Response(response=201, description="Estudiante registrado con éxito"),
 *     @OA\Response(response=400, description="Error de validación")
 * )
 */

    public function registrar(Request $request)
    {
        // Validar los datos de entrada
        $validator = Validator::make($request->all(), [
            'nombre' => 'required|string',
            'apellido' => 'required|string',
            'acudiente_id' => 'required|exists:acudientes,id',
            'curso_id' => 'required|exists:cursos,id',
        ]);

        if ($validator->fails()) {
            return response()->json(['error' => $validator->errors()], 400);
        }

        // Crear el estudiante
        $estudiante = Estudiante::create([
            'nombre' => $request->nombre,
            'apellido' => $request->apellido,
            'acudiente_id' => $request->acudiente_id,
            'curso_id' => $request->curso_id,
        ]);

        return response()->json(['mensaje' => 'Estudiante registrado con éxito', 'estudiante' => $estudiante], 201);
    }

    /**
 * @OA\Get(
 *     path="/api/obtener-estudiantes",
 *     summary="Obtener todos los estudiantes",
 *     tags={"Estudiantes"},
 *     security={{"bearerAuth":{}}},
 *     @OA\Response(response=200, description="Lista de estudiantes")
 * )
 */

    public function index()
    {
        $estudiantes = Estudiante::all();
        $data = [
            'estudiantes' => $estudiantes,
            'status' => 200 
        ];
        return response()->json($data, 200);
    }

    /**
 * @OA\Patch(
 *     path="/api/actualizar-parcial-estudiantes/{id}",
 *     summary="Actualizar parcialmente un estudiante",
 *     tags={"Estudiantes"},
 *     security={{"bearerAuth":{}}},
 *     @OA\Parameter(name="id", in="path", required=true, description="ID del estudiante", @OA\Schema(type="integer")),
 *     @OA\RequestBody(
 *         @OA\JsonContent(
 *             @OA\Property(property="nombre", type="string", example="Carlos"),
 *             @OA\Property(property="apellido", type="string", example="Mendoza"),
 *             @OA\Property(property="acudiente_id", type="integer", example=4),
 *             @OA\Property(property="curso_id", type="integer", example=1)
 *         )
 *     ),
 *     @OA\Response(response=200, description="Estudiante actualizado parcialmente"),
 *     @OA\Response(response=400, description="Error de validación"),
 *     @OA\Response(response=404, description="Estudiante no encontrado")
 * )
 */

    public function updatePartial(Request $request, $id) {
        $estudiante = Estudiante::find($id);

        if (!$estudiante) {
            $data = [
                'mensaje' => 'Estudiante no encontrado',
                'status' => 404
            ];
            return response()->json($data, 404);
        }

        $validator = Validator::make($request->all(), [
            'nombre',
            'apellido',
            'acudiente_id',
            'curso_id',
        ]);

        if ($validator->fails()) {
            $data = [
                'mensaje' => 'Error al actualizar el estudiante',
                'error' => $validator->errors(),
                'status' => 400
            ];
            return response()->json($data, 400);
        }

        if ($request->has('nombre')) {
            $estudiante->nombre = $request->nombre;
        }
        if ($request->has('apellido')) {
            $estudiante->apellido = $request->apellido;
        }
        if ($request->has('acudiente_id')) {
            $estudiante->acudiente_id = $request->acudiente_id;
        }
        if ($request->has('curso_id')) {
            $estudiante->curso_id = $request->curso_id;
        }

        $estudiante->save();

        $data = [
            'mensaje' => 'Estudiante actualizado con éxito',
            'estudiante' => $estudiante,
            'status' => 200
        ];
        return response()->json($data, 200);
    }

    /**
 * @OA\Put(
 *     path="/api/actualizar-estudiantes/{id}",
 *     summary="Actualizar un estudiante por ID",
 *     tags={"Estudiantes"},
 *     security={{"bearerAuth":{}}},
 *     @OA\Parameter(name="id", in="path", required=true, description="ID del estudiante", @OA\Schema(type="integer")),
 *     @OA\RequestBody(
 *         required=true,
 *         @OA\JsonContent(
 *             required={"nombre", "apellido", "acudiente_id", "curso_id"},
 *             @OA\Property(property="nombre", type="string", example="Laura"),
 *             @OA\Property(property="apellido", type="string", example="Gómez"),
 *             @OA\Property(property="acudiente_id", type="integer", example=3),
 *             @OA\Property(property="curso_id", type="integer", example=7)
 *         )
 *     ),
 *     @OA\Response(response=200, description="Estudiante actualizado con éxito"),
 *     @OA\Response(response=400, description="Error de validación"),
 *     @OA\Response(response=404, description="Estudiante no encontrado")
 * )
 */

    public function update(Request $request, $id) {
        $estudiante = Estudiante::find($id);

        if (!$estudiante) {
            $data = [
                'mensaje' => 'Estudiante no encontrado',
                'status' => 404
            ];
            return response()->json($data, 404);

        }

        $validator = Validator::make($request->all(), [
            'nombre' => 'required|string',
            'apellido' => 'required|string',
            'acudiente_id' => 'required|exists:acudientes,id',
            'curso_id' => 'required|exists:cursos,id',
        ]);

        if ($validator->fails()) {
            $data = [
                'mensaje' => 'Error al actualizar el estudiante',
                'error' => $validator->errors(),
                'status' => 400
            ];
            return response()->json($data, 400);
        }

        $estudiante->nombre = $request->nombre;
        $estudiante->apellido = $request->apellido;
        $estudiante->acudiente_id = $request->acudiente_id;
        $estudiante->curso_id = $request->curso_id;

        $estudiante->save();

        $data = [
            'mensaje' => 'Estudiante actualizado con éxito',
            'estudiante' => $estudiante,
            'status' => 200
        ];
        return response()->json($data, 200);
    }

    /**
 * @OA\Delete(
 *     path="/api/eliminar-estudiantes/{id}",
 *     summary="Eliminar un estudiante por ID",
 *     tags={"Estudiantes"},
 *     security={{"bearerAuth":{}}},
 *     @OA\Parameter(name="id", in="path", required=true, description="ID del estudiante", @OA\Schema(type="integer")),
 *     @OA\Response(response=200, description="Estudiante eliminado con éxito"),
 *     @OA\Response(response=404, description="Estudiante no encontrado")
 * )
 */

    public function destroy($id) {
        $estudiante = Estudiante::find($id);

        if (!$estudiante) {
            $data = [
                'mensaje' => 'Estudiante no encontrado',
                'status' => 404
            ];
            return response()->json($data, 404);
        }

        $estudiante->delete();

        $data = [
            'mensaje' => 'Estudiante eliminado con exito',
            'status' => 200
        ];
        return response()->json($data, 200);
    }

    public function obtenerPorCurso($curso_id)
{
    $estudiantes = Estudiante::where('curso_id', $curso_id)->get();
    return response()->json(['estudiantes' => $estudiantes]);
}
}