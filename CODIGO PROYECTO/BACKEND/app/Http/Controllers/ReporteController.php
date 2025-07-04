<?php

namespace App\Http\Controllers;

use App\Models\Reporte;
use Illuminate\Http\Request;

class ReporteController extends Controller
{

    /**
 * @OA\Get(
 *     path="/api/obtener-reportes",
 *     summary="Obtener todos los reportes",
 *     tags={"Reportes"},
 *     security={{"bearerAuth":{}}},
 *     @OA\Response(response=200, description="Lista de reportes")
 * )
 */

    public function index()
    {
        $reportes = Reporte::with('estudiante')->get();
        return response()->json($reportes);
    }

    /**
 * @OA\Get(
 *     path="/api/reportes/{id}",
 *     summary="Obtener un reporte por ID",
 *     tags={"Reportes"},
 *     security={{"bearerAuth":{}}},
 *     @OA\Parameter(name="id", in="path", required=true, description="ID del reporte", @OA\Schema(type="integer")),
 *     @OA\Response(response=200, description="Reporte encontrado"),
 *     @OA\Response(response=404, description="Reporte no encontrado")
 * )
 */

    public function show($id)
    {
        $reporte = Reporte::with('estudiante')->find($id);
        if (!$reporte) {
            return response()->json(['error' => 'Reporte no encontrado'], 404);
        }
        return response()->json($reporte);
    }

    /**
 * @OA\Delete(
 *     path="/api/eliminar-reportes/{id}",
 *     summary="Eliminar un reporte por ID",
 *     tags={"Reportes"},
 *     security={{"bearerAuth":{}}},
 *     @OA\Parameter(name="id", in="path", required=true, description="ID del reporte", @OA\Schema(type="integer")),
 *     @OA\Response(response=200, description="Reporte eliminado"),
 *     @OA\Response(response=404, description="Reporte no encontrado")
 * )
 */

    public function destroy($id)
    {
        $reporte = Reporte::find($id);
        if (!$reporte) {
            return response()->json(['error' => 'Reporte no encontrado'], 404);
        }
        $reporte->delete();
        return response()->json(['message' => 'Reporte eliminado']);
    }
}
