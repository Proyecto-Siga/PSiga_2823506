<?php

namespace App\Http\Controllers;

use App\Models\Clase;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Carbon;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Auth;

class ClaseController extends Controller
{
    /**
 * @OA\Get(
 *     path="/api/obtener-clases",
 *     summary="Obtener todas las clases",
 *     tags={"Clases"},
 *     security={{"bearerAuth":{}}},
 *     @OA\Response(response=200, description="Lista de clases")
 * )
 */

    public function index()
    {
        $clases = Clase::with('docente','curso', 'asignatura')->get();


        return response()->json([
            'clases' => $clases,
            'status' => 200
        ]);
    }
    
    /**
 * @OA\Post(
 *     path="/api/registrar-clases",
 *     summary="Registrar clases recurrentes",
 *     tags={"Clases"},
 *     security={{"bearerAuth":{}}},
 *     @OA\RequestBody(
 *         required=true,
 *         @OA\JsonContent(
 *             required={"asignatura_id", "docente_id", "aula_id", "curso_id", "hora_inicio", "hora_fin", "fecha_inicio", "fecha_fin", "dias"},
 *             @OA\Property(property="asignatura_id", type="integer", example=1),
 *             @OA\Property(property="docente_id", type="integer", example=2),
 *             @OA\Property(property="aula_id", type="integer", example=3),
 *             @OA\Property(property="curso_id", type="integer", example=4),
 *             @OA\Property(property="hora_inicio", type="string", example="08:00"),
 *             @OA\Property(property="hora_fin", type="string", example="09:00"),
 *             @OA\Property(property="fecha_inicio", type="string", format="date", example="2025-07-01"),
 *             @OA\Property(property="fecha_fin", type="string", format="date", example="2025-07-31"),
 *             @OA\Property(property="dias", type="array", @OA\Items(type="string", example="lunes"))
 *         )
 *     ),
 *     @OA\Response(response=201, description="Clases creadas correctamente"),
 *     @OA\Response(response=400, description="Error de validación"),
 *     @OA\Response(response=500, description="Error del servidor al crear las clases")
 * )
 */

    public function registrar(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'asignatura_id' => 'required|exists:asignaturas,id',
            'docente_id'    => 'required|exists:docentes,id',
            'aula_id'       => 'required|exists:aulas,id',
            'curso_id'      => 'required|exists:cursos,id',
            'hora_inicio'   => 'required',
            'hora_fin'      => 'required|after:hora_inicio',
            'fecha_inicio'  => 'required|date',
            'fecha_fin'     => 'required|date|after_or_equal:fecha_inicio',
            'dias'          => 'required|array|min:1',
        ]);

        if ($validator->fails()) {
            return response()->json([
                'mensaje' => 'Error de validación',
                'errores' => $validator->errors(),
                'status'  => 400
            ], 400);
        }

        $diasSemana = [
            'domingo'    => 0,
            'lunes'      => 1,
            'martes'     => 2,
            'miércoles'  => 3,
            'jueves'     => 4,
            'viernes'    => 5,
            'sábado'     => 6,
        ];

        $diasSeleccionados = array_map(fn($d) => $diasSemana[strtolower($d)], $request->dias);
        $fechaInicio = Carbon::parse($request->fecha_inicio);
        $fechaFin = Carbon::parse($request->fecha_fin);

        $clasesCreadas = [];

        try {
            DB::beginTransaction();

            for ($fecha = $fechaInicio->copy(); $fecha->lte($fechaFin); $fecha->addDay()) {
                if (in_array($fecha->dayOfWeek, $diasSeleccionados)) {
                    $clasesCreadas[] = Clase::create([
                        'asignatura_id' => $request->asignatura_id,
                        'docente_id'    => $request->docente_id,
                        'aula_id'       => $request->aula_id,
                        'curso_id'      => $request->curso_id,
                        'fecha'         => $fecha->toDateString(),
                        'hora_inicio'   => $request->hora_inicio,
                        'hora_fin'      => $request->hora_fin,
                    ]);
                }
            }

            DB::commit();

            return response()->json([
                'mensaje' => count($clasesCreadas) . ' clases creadas correctamente',
                'clases'  => $clasesCreadas,
                'status'  => 201
            ], 201);

        } catch (\Exception $e) {
            DB::rollback();
            return response()->json([
                'mensaje' => 'Error al crear las clases recurrentes',
                'error'   => $e->getMessage(),
                'status'  => 500
            ], 500);
        }
    }

    /**
 * @OA\Put(
 *     path="/api/actualizar-clases/{id}",
 *     summary="Actualizar una clase por ID",
 *     tags={"Clases"},
 *     security={{"bearerAuth":{}}},
 *     @OA\Parameter(name="id", in="path", required=true, description="ID de la clase", @OA\Schema(type="integer")),
 *     @OA\RequestBody(
 *         required=true,
 *         @OA\JsonContent(
 *             required={"asignatura_id", "docente_id", "aula_id", "curso_id", "fecha", "hora_inicio", "hora_fin"},
 *             @OA\Property(property="asignatura_id", type="integer", example=1),
 *             @OA\Property(property="docente_id", type="integer", example=2),
 *             @OA\Property(property="aula_id", type="integer", example=3),
 *             @OA\Property(property="curso_id", type="integer", example=4),
 *             @OA\Property(property="fecha", type="string", format="date", example="2025-07-15"),
 *             @OA\Property(property="hora_inicio", type="string", example="10:00"),
 *             @OA\Property(property="hora_fin", type="string", example="11:00")
 *         )
 *     ),
 *     @OA\Response(response=200, description="Clase actualizada correctamente"),
 *     @OA\Response(response=400, description="Error de validación"),
 *     @OA\Response(response=404, description="Clase no encontrada")
 * )
 */

    public function update(Request $request, $id)
    {
        $clase = Clase::find($id);

        if (!$clase) {
            return response()->json([
                'mensaje' => 'Clase no encontrada',
                'status'  => 404
            ], 404);
        }

        $validator = Validator::make($request->all(), [
            'asignatura_id' => 'required|exists:asignaturas,id',
            'docente_id'    => 'required|exists:docentes,id',
            'aula_id'       => 'required|exists:aulas,id',
            'curso_id'      => 'required|exists:cursos,id',
            'fecha'         => 'required|date',
            'hora_inicio'   => 'required',
            'hora_fin'      => 'required|after:hora_inicio',
        ]);

        if ($validator->fails()) {
            return response()->json([
                'mensaje' => 'Error de validación',
                'errores' => $validator->errors(),
                'status'  => 400
            ], 400);
        }

        $clase->update($request->all());

        return response()->json([
            'mensaje' => 'Clase actualizada correctamente',
            'clase'   => $clase,
            'status'  => 200
        ]);
    }

    /**
 * @OA\Patch(
 *     path="/api/actualizar-parcial-clases/{id}",
 *     summary="Actualizar parcialmente una clase",
 *     tags={"Clases"},
 *     security={{"bearerAuth":{}}},
 *     @OA\Parameter(name="id", in="path", required=true, description="ID de la clase", @OA\Schema(type="integer")),
 *     @OA\RequestBody(
 *         @OA\JsonContent(
 *             @OA\Property(property="asignatura_id", type="integer", example=1),
 *             @OA\Property(property="docente_id", type="integer", example=2),
 *             @OA\Property(property="aula_id", type="integer", example=3),
 *             @OA\Property(property="curso_id", type="integer", example=4),
 *             @OA\Property(property="fecha", type="string", format="date", example="2025-07-20"),
 *             @OA\Property(property="hora_inicio", type="string", example="13:00"),
 *             @OA\Property(property="hora_fin", type="string", example="14:00")
 *         )
 *     ),
 *     @OA\Response(response=200, description="Clase actualizada parcialmente"),
 *     @OA\Response(response=400, description="Error de validación"),
 *     @OA\Response(response=404, description="Clase no encontrada")
 * )
 */

    public function updatePartial(Request $request, $id)
    {
        $clase = Clase::find($id);

        if (!$clase) {
            return response()->json([
                'mensaje' => 'Clase no encontrada',
                'status'  => 404
            ], 404);
        }

        $validator = Validator::make($request->all(), [
            'asignatura_id' => 'sometimes|exists:asignaturas,id',
            'docente_id'    => 'sometimes|exists:docentes,id',
            'aula_id'       => 'sometimes|exists:aulas,id',
            'curso_id'      => 'sometimes|exists:cursos,id',
            'fecha'         => 'sometimes|date',
            'hora_inicio'   => 'sometimes',
            'hora_fin'      => 'sometimes|after:hora_inicio',
        ]);

        if ($validator->fails()) {
            return response()->json([
                'mensaje' => 'Error de validación',
                'errores' => $validator->errors(),
                'status'  => 400
            ], 400);
        }

        $clase->update($request->all());

        return response()->json([
            'mensaje' => 'Clase actualizada parcialmente',
            'clase'   => $clase,
            'status'  => 200
        ]);
    }

    /**
 * @OA\Delete(
 *     path="/api/eliminar-clases/{id}",
 *     summary="Eliminar una clase por ID",
 *     tags={"Clases"},
 *     security={{"bearerAuth":{}}},
 *     @OA\Parameter(name="id", in="path", required=true, description="ID de la clase", @OA\Schema(type="integer")),
 *     @OA\Response(response=200, description="Clase eliminada correctamente"),
 *     @OA\Response(response=404, description="Clase no encontrada")
 * )
 */

    public function destroy($id)
    {
        $clase = Clase::find($id);

        if (!$clase) {
            return response()->json([
                'mensaje' => 'Clase no encontrada',
                'status'  => 404
            ], 404);
        }

        $clase->delete();

        return response()->json([
            'mensaje' => 'Clase eliminada correctamente',
            'status'  => 200
        ]);
    }

    public function obtenerClaseDocente(Request $request)
        {
    $request->validate([
        'fecha' => 'required|date',
        'curso_id' => 'required|exists:cursos,id',
        'asignatura_id' => 'required|exists:asignaturas,id',
    ]);

    $user = auth()->user(); // el usuario logueado
    $docenteId = $user->docente?->id;

    $clase = Clase::where('fecha', $request->fecha)
        ->where('curso_id', $request->curso_id)
        ->where('asignatura_id', $request->asignatura_id)
        ->where('docente_id', $docenteId)
        ->first();

    if (!$clase) {
        return response()->json(['mensaje' => 'Clase no encontrada'], 404);
    }

    return response()->json(['clase' => $clase], 200);
        
    }
    public function clasesDelDia(Request $request)
{
    $fecha = $request->input('fecha');
    $usuario = auth()->user();

    if (!$usuario || !$usuario->docente) {
        return response()->json(['error' => 'No se encontró el docente asociado.'], 403);
    }

    $docenteId = $usuario->docente->id;

    $clases = Clase::where('fecha', $fecha)
        ->where('docente_id', $docenteId)
        ->with(['curso', 'asignatura'])
        ->get();

    return response()->json(['clases' => $clases]);
}

}

