<?php

namespace App\Http\Controllers;

use App\Models\Clase;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Carbon;
use Illuminate\Support\Facades\DB;

class ClaseController extends Controller
{
    public function index()
    {
        $clases = Clase::all();

        return response()->json([
            'clases' => $clases,
            'status' => 200
        ]);
    }

    // Registrar clases recurrentes
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
}
