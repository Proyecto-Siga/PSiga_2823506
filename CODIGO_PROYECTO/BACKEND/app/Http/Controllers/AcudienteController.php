<?php

namespace App\Http\Controllers;

use App\Models\Acudiente;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;

class AcudienteController extends Controller
{

    /**
 * @OA\Post(
 *     path="/api/registrar-acudientes",
 *     summary="Registrar un acudiente",
 *     tags={"Acudiente"},
 *     security={{"bearerAuth":{}}},
 *     @OA\RequestBody(
 *         required=true,
 *         @OA\JsonContent(ref="#/components/schemas/Acudiente")
 *     ),
 *     @OA\Response(
 *         response=201,
 *         description="Acudiente registrado con éxito"
 *     ),
 *     @OA\Response(
 *         response=400,
 *         description="Error de validación"
 *     )
 * )
 */


    public function registrar(Request $request)
    {
        $acudiente = auth()->user();
        // Validar los datos de entrada
        $validator = Validator::make($request->all(), [
            'nombre' => 'required|string',
            'apellido' => 'required|string',
            'correo' => 'required|email|unique:acudientes,correo',
        ]);

        if ($validator->fails()) {
            return response()->json(['error' => $validator->errors()], 400);
        }

        // Crear el acudiente
        $acudiente = Acudiente::create([
            'nombre' => $request->nombre,
            'apellido' => $request->apellido,
            'correo' => $request->correo,
        ]);

        return response()->json(['mensaje' => 'Acudiente registrado con éxito', 'acudiente' => $acudiente], 201);
    }

    /**
 * @OA\Get(
 *     path="/api/obtener-acudientes",
 *     summary="Obtener todos los acudientes",
 *     tags={"Acudiente"},
 *     security={{"bearerAuth":{}}},
 *     @OA\Response(
 *         response=200,
 *         description="Lista de acudientes"
 *     )
 * )
 */


    public function index()
    {
        $acudientes = auth()->user();
        $acudientes = Acudiente::all();

        $data = [
            'acudientes' => $acudientes,
            'status' => 200
        ];

        return response()->json($data, 200);
    }

    /**
 * @OA\Put(
 *     path="/api/actualizar-acudientes/{id}",
 *     summary="Actualizar completamente un acudiente",
 *     tags={"Acudiente"},
 *     security={{"bearerAuth":{}}},
 *     @OA\Parameter(
 *         name="id",
 *         in="path",
 *         required=true,
 *         description="ID del acudiente",
 *         @OA\Schema(type="integer")
 *     ),
 *     @OA\RequestBody(
 *         required=true,
 *         @OA\JsonContent(ref="#/components/schemas/Acudiente")
 *     ),
 *     @OA\Response(
 *         response=200,
 *         description="Acudiente actualizado"
 *     ),
 *     @OA\Response(
 *         response=400,
 *         description="Error de validación"
 *     ),
 *     @OA\Response(
 *         response=404,
 *         description="Acudiente no encontrado"
 *     )
 * )
 */


    public function update(Request $request, $id)
    {
        $acudiente = auth()->user();
        $acudiente = Acudiente::find($id);


        if (!$acudiente) {
            $data = [
                'mensaje' => 'Acudiente no encontrado',
                'status' => 404
            ];
            return response()->json($data, 404);
        }

        $validator = Validator::make($request->all(), [
            'nombre' => 'required|string',
            'apellido' => 'required|string',
            'correo' => 'required|email|unique:acudientes,correo,' . $acudiente->id,
        ]);

        if ($validator->fails()) {
            $data = [
                'mensaje' => 'Error al actualizar el acudiente',
                'error' => $validator->errors(),
                'status' => 400
            ];
            return response()->json($data, 400);
        }

        $acudiente->nombre = $request->nombre;
        $acudiente->apellido = $request->apellido;
        $acudiente->correo = $request->correo;
        $acudiente->save();

        $data = [
            'mensaje' => 'Acudiente actualizado con exito',
            'acudiente' => $acudiente,
            'status' => 200
        ];
        return response()->json($data, 200);
    }

    /**
 * @OA\Patch(
 *     path="/api/actualizar-parcial-acudientes/{id}",
 *     summary="Actualizar parcialmente un acudiente",
 *     tags={"Acudiente"},
 *     security={{"bearerAuth":{}}},
 *     @OA\Parameter(
 *         name="id",
 *         in="path",
 *         required=true,
 *         description="ID del acudiente",
 *         @OA\Schema(type="integer")
 *     ),
 *     @OA\RequestBody(
 *         required=true,
 *         @OA\JsonContent(
 *             @OA\Property(property="nombre", type="string", example="Carlos"),
 *             @OA\Property(property="apellido", type="string", example="López"),
 *             @OA\Property(property="correo", type="string", example="carlos.lopez@example.com")
 *         )
 *     ),
 *     @OA\Response(
 *         response=200,
 *         description="Acudiente actualizado parcialmente"
 *     ),
 *     @OA\Response(
 *         response=400,
 *         description="Error de validación"
 *     ),
 *     @OA\Response(
 *         response=404,
 *         description="Acudiente no encontrado"
 *     )
 * )
 */


    public function updatePartial(Request $request, $id)
    {
        $acudiente = auth()->user();
        $acudiente = Acudiente::find($id);

        if (!$acudiente) {
            $data = [
                'mensaje' => 'Acudiente no encontrado',
                'status' => 404
            ];
            return response()->json($data, 404);
        }

        $validator = Validator::make($request->all(), [
            'nombre' => 'string',
            'apellido' => 'string',
            'correo' => 'email',
        ]);

        if ($validator->fails()) {
            $data = [
                'mensaje' => 'Error al actualizar el acudiente',
                'error' => $validator->errors(),
                'status' => 400
            ];
            return response()->json($data, 400);
        }

        if ($request->has('nombre')) {
            $acudiente->nombre = $request->nombre;
        }

        if ($request->has('apellido')) {
            $acudiente->apellido = $request->apellido;
        }

        if ($request->has('correo')) {
            $acudiente->correo = $request->correo;
        }

        $acudiente->save();

        $data = [
            'mensaje' => 'Acudiente actualizado con exito',
            'acudiente' => $acudiente,
            'status' => 200
        ];
        return response()->json($data, 200);
    }

    /**
 * @OA\Delete(
 *     path="/api/eliminar-acudientes/{id}",
 *     summary="Eliminar un acudiente",
 *     tags={"Acudiente"},
 *     security={{"bearerAuth":{}}},
 *     @OA\Parameter(
 *         name="id",
 *         in="path",
 *         required=true,
 *         description="ID del acudiente",
 *         @OA\Schema(type="integer")
 *     ),
 *     @OA\Response(
 *         response=200,
 *         description="Acudiente eliminado con éxito"
 *     ),
 *     @OA\Response(
 *         response=404,
 *         description="Acudiente no encontrado"
 *     )
 * )
 */


    public function destroy($id)
    {
        $acudiente = auth()->user();
        $acudiente = Acudiente::find($id);

        if (!$acudiente) {
            $data = [
                'mensaje' => 'Acudiente no encontrado',
                'status' => 404
            ];
            return response()->json($data, 404);
        }

        $acudiente->delete();

        $data = [
            'mensaje' => 'Acudiente eliminado con exito',
            'status' => 200
        ];
        return response()->json($data, 200);
    }
}