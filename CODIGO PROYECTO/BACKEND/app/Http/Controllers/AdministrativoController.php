<?php

namespace App\Http\Controllers;

use App\Models\Administrativo;
use App\Models\Usuario;
use Illuminate\Http\Request;

class AdministrativoController extends Controller
{

    /**
 * @OA\Get(
 *     path="/api/administrativos",
 *     summary="Listar todos los administrativos",
 *     tags={"Administrativo"},
 *     security={{"bearerAuth":{}}},
 *     @OA\Response(
 *         response=200,
 *         description="Lista de administrativos"
 *     )
 * )
 */


    public function index()
    {
        $administrativos = Administrativo::with('usuario')->get();
        return response()->json($administrativos);
    }

    /**
 * @OA\Post(
 *     path="/api/administrativos",
 *     summary="Registrar un nuevo administrativo",
 *     tags={"Administrativo"},
 *     security={{"bearerAuth":{}}},
 *     @OA\RequestBody(
 *         required=true,
 *         @OA\JsonContent(ref="#/components/schemas/Administrativo")
 *     ),
 *     @OA\Response(
 *         response=201,
 *         description="Administrativo creado exitosamente"
 *     ),
 *     @OA\Response(
 *         response=400,
 *         description="Usuario no válido o error de validación"
 *     )
 * )
 */


    public function store(Request $request)
    {
        $request->validate([
            'usuario_id' => 'required|exists:usuarios,id',
            'nombre' => 'required|string|max:255',
            'apellido' => 'required|string|max:255',
        ]);

        $usuario = Usuario::find($request->usuario_id);
        if ($usuario->rol_id !== 1) {
            return response()->json(['error' => 'Este usuario no es de tipo administrativo.'], 400);
        }

        $administrativo = Administrativo::create($request->all());

        return response()->json($administrativo, 201);
    }

    /**
 * @OA\Put(
 *     path="/api/administrativos/{id}",
 *     summary="Actualizar un administrativo",
 *     tags={"Administrativo"},
 *     security={{"bearerAuth":{}}},
 *     @OA\Parameter(
 *         name="id",
 *         in="path",
 *         description="ID del administrativo",
 *         required=true,
 *         @OA\Schema(type="integer")
 *     ),
 *     @OA\RequestBody(
 *         required=true,
 *         @OA\JsonContent(
 *             required={"nombre", "apellido"},
 *             @OA\Property(property="nombre", type="string", example="Carlos"),
 *             @OA\Property(property="apellido", type="string", example="Ramírez")
 *         )
 *     ),
 *     @OA\Response(
 *         response=200,
 *         description="Administrativo actualizado"
 *     ),
 *     @OA\Response(
 *         response=404,
 *         description="Administrativo no encontrado"
 *     )
 * )
 */


    public function update(Request $request, $id)
    {
        $administrativo = Administrativo::find($id);
        if (!$administrativo) {
            return response()->json(['error' => 'Administrativo no encontrado'], 404);
        }

        $request->validate([
            'nombre' => 'required|string|max:255',
            'apellido' => 'required|string|max:255',
        ]);

        $administrativo->update($request->only('nombre', 'apellido'));

        return response()->json($administrativo);
    }

    /**
 * @OA\Delete(
 *     path="/api/administrativos/{id}",
 *     summary="Eliminar un administrativo",
 *     tags={"Administrativo"},
 *     security={{"bearerAuth":{}}},
 *     @OA\Parameter(
 *         name="id",
 *         in="path",
 *         description="ID del administrativo",
 *         required=true,
 *         @OA\Schema(type="integer")
 *     ),
 *     @OA\Response(
 *         response=200,
 *         description="Administrativo eliminado con éxito"
 *     ),
 *     @OA\Response(
 *         response=404,
 *         description="Administrativo no encontrado"
 *     )
 * )
 */


    public function destroy($id)
    {
        $administrativo = Administrativo::find($id);
        if (!$administrativo) {
            return response()->json(['error' => 'Administrativo no encontrado'], 404);
        }

        $administrativo->delete();
        return response()->json(['mensaje' => 'Administrativo eliminado con éxito']);
    }

    /**
 * @OA\Get(
 *     path="/api/usuarios-disponibles-administrativos",
 *     summary="Obtener usuarios disponibles para ser administrativos",
 *     tags={"Administrativo"},
 *     security={{"bearerAuth":{}}},
 *     @OA\Response(
 *         response=200,
 *         description="Usuarios disponibles obtenidos correctamente"
 *     )
 * )
 */


    public function usuariosDisponibles()
    {
        $usuarios = Usuario::where('rol_id', 1)
            ->whereNotIn('id', Administrativo::pluck('usuario_id'))
            ->get();

        return response()->json($usuarios);
    }
}
