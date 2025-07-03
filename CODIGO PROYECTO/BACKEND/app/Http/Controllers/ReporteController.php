<?php

namespace App\Http\Controllers;

use App\Models\Reporte;
use Illuminate\Http\Request;

class ReporteController extends Controller
{
    public function index()
    {
        $reportes = Reporte::with('estudiante')->get();
        return response()->json($reportes);
    }

    public function show($id)
    {
        $reporte = Reporte::with('estudiante')->find($id);
        if (!$reporte) {
            return response()->json(['error' => 'Reporte no encontrado'], 404);
        }
        return response()->json($reporte);
    }

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
