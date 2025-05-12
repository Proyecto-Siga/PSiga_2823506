<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use app\Models\Clase;
use Carbon\Carbon;

class ClaseController extends Controller
{
    // Crear una clase individual
    public function store(Request $request)
    {
        $request->validate([
            'asignatura_id' => 'required|exists:asignatura,id',
            'docente_id' => 'required|exists:docente,id',
            'aula_id' => 'required|exists:aula,id',
            'curso_id' => 'required|exists:curso,id',
            'fecha' => 'required|date',
            'hora_inicio' => 'required',
            'hora_fin' => 'required|after:hora_inicio',
        ]);

        $clase = Clase::create($request->all());

        return response()->json(['message' => 'Clase creada correctamente', 'clase' => $clase], 201);
    }

    // Crear clases recurrentes (por días)
    public function crearRecurrentes(Request $request)
    {
        $request->validate([
            'asignatura_id' => 'required|exists:asignatura,id',
            'docentes_id' => 'required|exists:docente,id',
            'aula_id' => 'required|exists:aula,id',
            'curso_id' => 'required|exists:curso,id',
            'hora_inicio' => 'required',
            'hora_fin' => 'required|after:hora_inicio',
            'fecha_inicio' => 'required|date',
            'fecha_fin' => 'required|date|after_or_equal:fecha_inicio',
            'dias' => 'required|array|min:1', // Ej: ['martes', 'viernes']
        ]);

        $diasSemana = [
            'domingo' => 0,
            'lunes' => 1,
            'martes' => 2,
            'miércoles' => 3,
            'jueves' => 4,
            'viernes' => 5,
            'sábado' => 6,
        ];

        $fechaInicio = Carbon::parse($request->fecha_inicio);
        $fechaFin = Carbon::parse($request->fecha_fin);
        $diasSeleccionados = array_map(fn($d) => $diasSemana[strtolower($d)], $request->dias);

        $clasesCreadas = [];

        for ($fecha = $fechaInicio->copy(); $fecha->lte($fechaFin); $fecha->addDay()) {
            if (in_array($fecha->dayOfWeek, $diasSeleccionados)) {
                $clasesCreadas[] = Clase::create([
                    'asignatura_id' => $request->asignatura_id,
                    'docente_id' => $request->docente_id,
                    'aula_id' => $request->aula_id,
                    'curso_id' => $request->curso_id,
                    'fecha' => $fecha->toDateString(),
                    'hora_inicio' => $request->hora_inicio,
                    'hora_fin' => $request->hora_fin,
                ]);
            }
        }

        return response()->json([
            'message' => count($clasesCreadas) . ' clases creadas correctamente',
            'clases' => $clasesCreadas,
        ]);
    }
}