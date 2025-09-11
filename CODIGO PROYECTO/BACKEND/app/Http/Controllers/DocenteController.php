<?php

namespace App\Http\Controllers;

use App\Models\Docente;
use App\Models\Usuario;
use Illuminate\Http\Request;

class DocenteController extends Controller
{
    /**
 * @OA\Get(
 *     path="/api/docentes",
 *     summary="Listar todos los docentes",
 *     tags={"Docente"},
 *     security={{"bearerAuth":{}}},
 *     @OA\Response(
 *         response=200,
 *         description="Lista de docentes con sus usuarios"
 *     )
 * )
 */

    
    public function index()
    {
        $docentes = Docente::with('usuario')->get();
        return response()->json($docentes);
    }

    /**
 * @OA\Post(
 *     path="/api/docentes",
 *     summary="Registrar un nuevo docente",
 *     tags={"Docente"},
 *     security={{"bearerAuth":{}}},
 *     @OA\RequestBody(
 *         required=true,
 *         @OA\JsonContent(ref="#/components/schemas/Docente")
 *     ),
 *     @OA\Response(
 *         response=201,
 *         description="Docente creado exitosamente"
 *     ),
 *     @OA\Response(
 *         response=400,
 *         description="Error de validación o usuario ya asignado"
 *     )
 * )
 */

    
    public function store(Request $request)
    {
        $request->validate([
            'usuario_id' => 'required|exists:usuarios,id|unique:docentes,usuario_id',
            'nombre' => 'required|string|max:255',
            'apellido' => 'required|string|max:255',
        ]);

        $docente = Docente::create($request->all());
        return response()->json($docente, 201);
    }

  
    public function show($id)
    {
        $docente = Docente::with('usuario')->findOrFail($id);
        return response()->json($docente);
    }

    /**
 * @OA\Put(
 *     path="/api/docentes/{id}",
 *     summary="Actualizar un docente",
 *     tags={"Docente"},
 *     security={{"bearerAuth":{}}},
 *     @OA\Parameter(
 *         name="id",
 *         in="path",
 *         description="ID del docente",
 *         required=true,
 *         @OA\Schema(type="integer")
 *     ),
 *     @OA\RequestBody(
 *         required=true,
 *         @OA\JsonContent(
 *             required={"nombre", "apellido"},
 *             @OA\Property(property="nombre", type="string", example="Carlos"),
 *             @OA\Property(property="apellido", type="string", example="Gómez")
 *         )
 *     ),
 *     @OA\Response(
 *         response=200,
 *         description="Docente actualizado"
 *     ),
 *     @OA\Response(
 *         response=404,
 *         description="Docente no encontrado"
 *     )
 * )
 */


    public function update(Request $request, $id)
    {
        $docente = Docente::findOrFail($id);

        $request->validate([
            'nombre' => 'required|string|max:255',
            'apellido' => 'required|string|max:255',
        ]);

        $docente->update([
            'nombre' => $request->nombre,
            'apellido' => $request->apellido,
        ]);

        return response()->json($docente);
    }

    /**
 * @OA\Delete(
 *     path="/api/docentes/{id}",
 *     summary="Eliminar un docente",
 *     tags={"Docente"},
 *     security={{"bearerAuth":{}}},
 *     @OA\Parameter(
 *         name="id",
 *         in="path",
 *         description="ID del docente",
 *         required=true,
 *         @OA\Schema(type="integer")
 *     ),
 *     @OA\Response(
 *         response=200,
 *         description="Docente eliminado con éxito"
 *     ),
 *     @OA\Response(
 *         response=404,
 *         description="Docente no encontrado"
 *     )
 * )
 */

    
    public function destroy($id)
    {
        $docente = Docente::findOrFail($id);
        $docente->delete();

        return response()->json(['mensaje' => 'Docente eliminado']);
    }

    /**
 * @OA\Get(
 *     path="/api/usuarios-disponibles-docentes",
 *     summary="Obtener usuarios disponibles para docentes",
 *     tags={"Docente"},
 *     security={{"bearerAuth":{}}},
 *     @OA\Response(
 *         response=200,
 *         description="Lista de usuarios disponibles"
 *     )
 * )
 */

    
    public function usuariosDisponibles()
    {
        $usuariosAsignados = Docente::pluck('usuario_id');
        $usuariosDisponibles = Usuario::whereNotIn('id', $usuariosAsignados)->get();

        return response()->json($usuariosDisponibles);
    }
}
