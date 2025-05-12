<?php

namespace App\Http\Controllers;
use App\Models\Aula;
use Illuminate\Http\Request;

class AulaController extends Controller
{
    public function store(Request $request)
    {
        $request->validate(['nombre_aula' => 'required']);
        $aula = Aula::create(['nombre_aula' => $request->nombre_aula]);
        return response()->json(['message' => 'Aula creada', 'aula' => $aula]);
    }

    public function index()
    {
        return Aula::all();
    }
}