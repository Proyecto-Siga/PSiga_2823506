<?php

namespace App\Http\Controllers;

use App\Models\Usuario;
use App\Models\Docente;
use App\Models\Administrativo;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;
use Tymon\JWTAuth\Facades\JWTAuth;
use Illuminate\Support\Facades\Validator;

/**
 * @OA\Info(
 *     title="API Laravel Proyecto SIGA (Sistema Integral de Gestión Académica)",
 *     version="1.0.0",
 *     description="Esta API permite gestionar los procesos académicos y administrativos de una institución educativa.",
 *     @OA\Contact(
 *         name="Soporte ",
 *         email="stevencuellar98@hotmail.es"
 *     )
 * )
 *
 * @OA\SecurityScheme(
 *     securityScheme="bearerAuth",
 *     type="http",
 *     scheme="bearer",
 *     bearerFormat="JWT"
 * )

 * @OA\Tag(name="Autenticación", description="Operaciones de login, registro y autenticación"),
 * @OA\Tag(name="Usuario", description="Gestión general de usuarios del sistema"),
 * @OA\Tag(name="Rol", description="Gestion de roles del sistema"),
 * @OA\Tag(name="Administrativo", description="Gestión de personal administrativo"),
 * @OA\Tag(name="Docente", description="Gestión de docentes y su información"),
 * @OA\Tag(name="Estudiantes", description="Gestión de estudiantes y sus datos"),
 * @OA\Tag(name="Acudiente", description="Gestion iformación de acudientes de los estudiantes"),
 * @OA\Tag(name="Cursos", description="Gestión de cursos académicos"),
 * @OA\Tag(name="Asignatura", description="Gestión de materias o asignaturas"),
 * @OA\Tag(name="Clases", description="Gestion de clases por curso/asignatura"),
 * @OA\Tag(name="Aulas", description="Gestión de aulas físicas o virtuales"),
 * @OA\Tag(name="Asistencias", description="Registro y control de asistencias"),
 * @OA\Tag(name="Reportes", description="Consultas y generación de reportes del sistema")
 */



class AuthController extends Controller
{
    /**
 * @OA\Post(
 *     path="/api/registrar-usuario",
 *     summary="Registrar un nuevo usuario",
 *     tags={"Autenticación"},
 *     @OA\RequestBody(
 *         required=true,
 *         @OA\JsonContent(ref="#/components/schemas/Usuario")
 *     ),
 *     @OA\Response(
 *         response=201,
 *         description="Usuario registrado con éxito"
 *     ),
 *     @OA\Response(
 *         response=400,
 *         description="Error de validación"
 *     )
 * )
 */


    public function registrar(Request $request)
{
    $validator = Validator::make($request->all(), [
        'correo' => 'required|email|unique:usuarios,correo',
        'password' => 'required|string|min:6',
        'rol_id' => 'required|exists:roles,id',
    ]);

    if ($validator->fails()) {
        return response()->json(['error' => $validator->errors()], 400);
    }

    $usuario = Usuario::create([
        'correo' => $request->correo,
        'password' => Hash::make($request->password),
        'estado' => 1,
        'rol_id' => $request->rol_id,
    ]);

    return response()->json(['mensaje' => 'Usuario registrado con éxito', 'usuario' => $usuario], 201);
}

    /**
 * @OA\Post(
 *     path="/api/login",
 *     summary="Iniciar sesión",
 *     tags={"Autenticación"},
 *     @OA\RequestBody(
 *         required=true,
 *         @OA\JsonContent(
 *             required={"correo", "password"},
 *             @OA\Property(property="correo", type="string", format="email", example="estiben@gmail.com"),
 *             @OA\Property(property="password", type="string", format="password", example="12345678")
 *         )
 *     ),
 *     @OA\Response(
 *         response=200,
 *         description="Token generado exitosamente"
 *     ),
 *     @OA\Response(
 *         response=401,
 *         description="Credenciales inválidas"
 *     )
 * )
 */


    public function login(Request $request)
    {
        $credentials = $request->only('correo', 'password');
    
        try {
            if (!$token = JWTAuth::attempt($credentials)) {
                return response()->json(['error' => 'Credenciales inválidas'], 401);
            }
        } catch (\Tymon\JWTAuth\Exceptions\JWTException $e) {
            return response()->json(['error' => 'Error al generar el token: ' . $e->getMessage()], 500);
        }
    
        return response()->json(['token' => $token]);
    }

    /**
 * @OA\Get(
 *     path="/api/obtener-usuarios",
 *     summary="Listar todos los usuarios",
 *     tags={"Usuario"},
 *     security={{"bearerAuth":{}}},
 *     @OA\Response(
 *         response=200,
 *         description="Lista de usuarios"
 *     )
 * )
 */


    public function index() {
        $usuarios = Usuario::all();

        $data = [
            'usuarios' => $usuarios,
            'status' => 200
        ];

        return response()->json($data,200);
    }

    /**
 * @OA\Post(
 *     path="/api/refrescar-token",
 *     summary="Refrescar token JWT",
 *     tags={"Autenticación"},
 *     security={{"bearerAuth":{}}},
 *     @OA\Response(
 *         response=200,
 *         description="Nuevo token generado"
 *     )
 * )
 */


    public function refresh() {
        return response()->json(['token' => JWTAuth::refresh()]);           
    }

    /**
 * @OA\Get(
 *     path="/api/perfil",
 *     summary="Obtener perfil del usuario autenticado",
 *     tags={"Usuario"},
 *     security={{"bearerAuth":{}}},
 *     @OA\Response(
 *         response=200,
 *         description="Perfil del usuario"
 *     ),
 *     @OA\Response(
 *         response=404,
 *         description="Usuario no encontrado"
 *     )
 * )
 */


    public function profile() {
        
        $usuarios = JWTAuth::user();

        if(!$usuarios) {
            return response()->json([
                'mensaje' => 'El usuario no existe',
                'error' => 'not found',
            ],404);
        }

        $data = [
            'usuarios' => [
                'id'=> $usuarios->id,
                'rol_id' => $usuarios->rol_id,
                'correo' => $usuarios->correo,
                'password' => $usuarios->password,
            ],
        ];

        return response()->json ([
            'success' => $data,
            'message' => 'Perfil del usuario'
        ]);
    }

    /**
 * @OA\Post(
 *     path="/api/logout",
 *     summary="Cerrar sesión",
 *     tags={"Autenticación"},
 *     security={{"bearerAuth":{}}},
 *     @OA\Response(
 *         response=200,
 *         description="Sesión cerrada con éxito"
 *     )
 * )
 */


    public function logout() {
        JWTAuth::invalidate();
        return response()->json(['mensaje' => 'Sesion cerrada con exito']);
    }

    /**
 * @OA\Put(
 *     path="/api/actualizar-usuario/{id}",
 *     summary="Actualizar completamente un usuario",
 *     tags={"Usuario"},
 *     security={{"bearerAuth":{}}},
 *     @OA\Parameter(
 *         name="id",
 *         in="path",
 *         required=true,
 *         description="ID del usuario",
 *         @OA\Schema(type="integer")
 *     ),
 *     @OA\RequestBody(
 *         required=true,
 *         @OA\JsonContent(ref="#/components/schemas/Usuario")
 *     ),
 *     @OA\Response(
 *         response=200,
 *         description="Usuario actualizado con éxito"
 *     ),
 *     @OA\Response(
 *         response=404,
 *         description="Usuario no encontrado"
 *     )
 * )
 */


    public function update(Request $request, $id) {
        $usuario = Usuario::find($id);

        if (!$usuario) {
            $data = [
                'mensaje' => 'Usuario no encontrado',
                'status' => 404
            ];
            return response()->json($data, 404);
        }

        $validator = Validator::make($request->all(), [
            'rol_id' => 'required|exists:roles,id',
            'correo' => 'required_if:rol_id,1,2|email|unique:usuarios,correo,' . $usuario->id,
            'password' => 'required_if:rol_id,1,2|string|min:6',
        ]);

        if ($validator->fails()) {
            $data = [
                'mensaje' => 'Error al actualizar el usuario',
                'error' => $validator->errors(),
                'status' => 400
            ];
            return response()->json($data, 400);
        }

        $usuario->rol_id = $request->rol_id;
        $usuario->correo = $request->correo;
        $usuario->password = Hash::make($request->password);
        $usuario->save();

        $data = [
            'usuario' => $usuario,
            'mensaje' => 'Usuario actualizado con exito',
            'status' => 200
        ];
        return response()->json($data, 200);
    }

    /**
 * @OA\Patch(
 *     path="/api/actualizar-parcial-usuario/{id}",
 *     summary="Actualizar parcialmente un usuario",
 *     tags={"Usuario"},
 *     security={{"bearerAuth":{}}},
 *     @OA\Parameter(
 *         name="id",
 *         in="path",
 *         required=true,
 *         description="ID del usuario",
 *         @OA\Schema(type="integer")
 *     ),
 *     @OA\RequestBody(
 *         required=false,
 *         @OA\JsonContent(
 *             @OA\Property(property="correo", type="string", example="nuevo@correo.com"),
 *             @OA\Property(property="password", type="string", example="12345678"),
 *             @OA\Property(property="rol_id", type="integer", example=2)
 *         )
 *     ),
 *     @OA\Response(
 *         response=200,
 *         description="Usuario actualizado parcialmente"
 *     ),
 *     @OA\Response(
 *         response=404,
 *         description="Usuario no encontrado"
 *     )
 * )
 */


    public function updatePartial(Request $request, $id) {
        $usuario = Usuario::find($id);

        if (!$usuario) {
            $data = [
                'mensaje' => 'Usuario no encontrado',
                'status' => 404
            ];
            return response()->json($data, 404);
        }

        $validator = Validator::make($request->all(), [
            'rol_id', 
            'correo',
            'password',
        ]);

        if ($validator->fails()) {
            $data = [
                'mensaje' => 'Error al actualizar el usuario',
                'error' => $validator->errors(),
                'status' => 400
            ];
            return response()->json($data, 400);
        }

        if ($request->has('rol_id')) {
            $usuario->rol_id = $request->rol_id;
        }

        if ($request->has('correo')) {
            $usuario->correo = $request->correo;
        }

        if ($request->has('password')) {
            $usuario->password = Hash::make($request->password);
        }

        $usuario->save();

        $data = [
            'usuario' => $usuario,
            'mensaje' => 'Usuario actualizado con exito',
            'status' => 200
        ];
        return response()->json($data, 200);
        
        } 

        /**
 * @OA\Delete(
 *     path="/api/eliminar-usuario/{id}",
 *     summary="Eliminar un usuario",
 *     tags={"Usuario"},
 *     security={{"bearerAuth":{}}},
 *     @OA\Parameter(
 *         name="id",
 *         in="path",
 *         required=true,
 *         description="ID del usuario",
 *         @OA\Schema(type="integer")
 *     ),
 *     @OA\Response(
 *         response=200,
 *         description="Usuario eliminado con éxito"
 *     ),
 *     @OA\Response(
 *         response=404,
 *         description="Usuario no encontrado"
 *     )
 * )
 */


        public function destroy($id) {
            $usuario = Usuario::find($id);

            if (!$usuario) {
                $data = [
                    'mensaje' => 'Usuario no encontrado',
                    'status' => 404
                ];
                return response()->json($data, 404);
            }

            $usuario->delete();

            $data = [
                'mensaje' => 'Usuario eliminado con exito',
                'status' => 200
            ];
            return response()->json($data, 200);
        }

    public function usuariosDisponiblesDocentes() {
            $usuarios = Usuario::where('rol_id', 2)
                                ->whereNotIn('id', Docente::pluck('usuario_id'))
                                ->get();
        
            return response()->json($usuarios);
        }

        public function usuariosDisponiblesAdministrativos()
        {
            $usuarios = Usuario::where('rol_id', 1)
                                ->whereNotIn('id', Administrativo::pluck('usuario_id'))
                                ->get();
        
            return response()->json($usuarios);
        }
}