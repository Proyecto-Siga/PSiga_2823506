<?php

namespace App\Http\Controllers;

use App\Models\Rol;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;

class RolController extends Controller
{

    /**
 * @OA\Post(
 *     path="/api/registrar-rol",
 *     summary="Registrar un nuevo rol",
 *     tags={"Rol"},
 *     security={{"bearerAuth":{}}},
 *     @OA\RequestBody(
 *         required=true,
 *         @OA\JsonContent(ref="#/components/schemas/Rol")
 *     ),
 *     @OA\Response(
 *         response=201,
 *         description="Rol registrado con éxito"
 *     ),
 *     @OA\Response(
 *         response=400,
 *         description="Error de validación"
 *     )
 * )
 */

    public function registrar(Request $request)
    {
        // Validar los datos de entrada
        $validator = Validator::make($request->all(), [
            'nombre' => 'required|string|unique:roles,nombre',
            'permisos' => 'nullable|array', // Permisos opcionales que debemos investigar como carajo se llenan.
        ]);

        if ($validator->fails()) {
            return response()->json(['error' => $validator->errors()], 400);
        }

        // Crear el rol
        $rol = Rol::create([
            'nombre' => $request->nombre,
            'permisos' => $request->permisos, // Para almacenar los permisos
        ]);

        return response()->json(['mensaje' => 'Rol registrado con éxito', 'rol' => $rol], 201);
    }

    /**
 * @OA\Get(
 *     path="/api/obtener-roles",
 *     summary="Listar todos los roles",
 *     tags={"Rol"},
 *     security={{"bearerAuth":{}}},
 *     @OA\Response(
 *         response=200,
 *         description="Lista de roles obtenida exitosamente"
 *     )
 * )
 */

    
    public function index() {
        $roles = Rol::all();

        $data = [
            'roles' => $roles,
            'status' => 200
        ];

        return response()->json($data,200);
}

    /**
 * @OA\Put(
 *     path="/api/actualizar-rol/{id}",
 *     summary="Actualizar completamente un rol",
 *     tags={"Rol"},
 *     security={{"bearerAuth":{}}},
 *     @OA\Parameter(
 *         name="id",
 *         in="path",
 *         required=true,
 *         description="ID del rol",
 *         @OA\Schema(type="integer")
 *     ),
 *     @OA\RequestBody(
 *         required=true,
 *         @OA\JsonContent(ref="#/components/schemas/Rol")
 *     ),
 *     @OA\Response(
 *         response=200,
 *         description="Rol actualizado con éxito"
 *     ),
 *     @OA\Response(
 *         response=404,
 *         description="Rol no encontrado"
 *     )
 * )
 */


    public function update(Request $request, $id) {
        $rol = Rol::find($id);

        if (!$rol) {
            $data = [
                'mensaje' => 'Rol no encontrado',
                'status' => 404
            ];
            return response()->json($data, 404);
        }
        $validator = Validator::make($request->all(), [
            'nombre' => 'required|string|unique:roles,nombre,' . $rol->id,
            'permisos' => 'nullable|array',
        ]);

        if ($validator->fails()) {
            
            $data = [
                'mensaje' => 'Error al actualizar el rol',
                'error' => $validator->errors(),
                'status' => 400
            ];
            return response()->json($data, 400);
        }

        $rol->nombre = $request->nombre;
        $rol->permisos = $request->permisos;
        $rol->save();

        $data = [
            'mensaje' => 'Rol actualizado con exito',
            'rol' => $rol,
            'status' => 200
        ];
        return response()->json($data, 200);
}

    /**
 * @OA\Patch(
 *     path="/api/actualizar-parcial-rol/{id}",
 *     summary="Actualizar parcialmente un rol",
 *     tags={"Rol"},
 *     security={{"bearerAuth":{}}},
 *     @OA\Parameter(
 *         name="id",
 *         in="path",
 *         required=true,
 *         description="ID del rol",
 *         @OA\Schema(type="integer")
 *     ),
 *     @OA\RequestBody(
 *         required=false,
 *         @OA\JsonContent(
 *             @OA\Property(property="nombre", type="string", example="Editor"),
 *             @OA\Property(
 *                 property="permisos",
 *                 type="array",
 *                 @OA\Items(type="string"),
 *                 example={"editar_cursos", "ver_estadisticas"}
 *             )
 *         )
 *     ),
 *     @OA\Response(
 *         response=200,
 *         description="Rol actualizado parcialmente"
 *     ),
 *     @OA\Response(
 *         response=404,
 *         description="Rol no encontrado"
 *     )
 * )
 */


    public function updatePartial(Request $request, $id) {
        $rol = Rol::find($id);

        if (!$rol) {
            $data = [
                'mensaje' => 'Rol no encontrado',
                'status' => 404
            ];
            return response()->json($data, 404);
        }

        $validator = Validator::make($request->all(), [
            'nombre' => 'string',
            'permisos' => 'array',
        ]);

        if ($validator->fails()) {
            $data = [
                'mensaje' => 'Error al actualizar el rol',
                'error' => $validator->errors(),
                'status' => 400
            ];
            return response()->json($data, 400);
        }

        if ($request->has('nombre')) {
            $rol->nombre = $request->nombre;
        }

        if ($request->has('permisos')) {
            $rol->permisos = $request->permisos;    
        }

        $rol->save();

        $data = [
            'mensaje' => 'Rol actualizado con exito',
            'rol' => $rol,
            'status' => 200
        ];
        return response()->json($data, 200);
    }

    /**
 * @OA\Delete(
 *     path="/api/eliminar-rol/{id}",
 *     summary="Eliminar un rol",
 *     tags={"Rol"},
 *     security={{"bearerAuth":{}}},
 *     @OA\Parameter(
 *         name="id",
 *         in="path",
 *         required=true,
 *         description="ID del rol",
 *         @OA\Schema(type="integer")
 *     ),
 *     @OA\Response(
 *         response=200,
 *         description="Rol eliminado con éxito"
 *     ),
 *     @OA\Response(
 *         response=404,
 *         description="Rol no encontrado"
 *     )
 * )
 */


    public function destroy($id) {
        $rol = Rol::find($id);

        if (!$rol) {
            $data = [
                'mensaje' => 'Rol no encontrado',
                'status' => 404
            ];
            return response()->json($data, 404);
        }

        $rol->delete();

        $data = [
            'mensaje' => 'Rol eliminado con exito',
            'status' => 200
        ];
        return response()->json($data, 200);
    }
}