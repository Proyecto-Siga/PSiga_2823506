<?php

use App\Http\Controllers\RolController;
use App\Http\Controllers\CursoController;
use App\Http\Controllers\AcudienteController;
use App\Http\Controllers\EstudianteController;
use App\Http\Controllers\AuthController;
use App\Http\Controllers\DocenteController;
use App\Http\Controllers\AdministrativoController;
use App\Http\Controllers\AsignaturaController;
use App\Http\Controllers\ClaseController;
use App\Http\Controllers\AsistenciaController;
use App\Http\Controllers\AulaController;
use Illuminate\Support\Facades\Route;

Route::post('/registrar-rol', [RolController::class, 'registrar']); 
Route::post('/login', [AuthController::class, 'login']);
Route::post('/registrar-usuario', [AuthController::class, 'registrar']);

Route::middleware('jwt.auth')->group(function () {

//Rutas para roles

Route::get('/obtener-roles', [RolController::class, 'index']);
Route::put('/actualizar-rol/{id}', [RolController::class, 'update']);
Route::patch('/actualizar-parcial-rol/{id}', [RolController::class, 'updatePartial']);
Route::delete('/eliminar-rol/{id}', [RolController::class, 'destroy']);

//Rutas para cursos
Route::post('/registrar-cursos', [CursoController::class, 'registrar']);
Route::get('/obtener-cursos', [CursoController::class, 'index']);
Route::put('/actualizar-cursos/{id}', [CursoController::class, 'update']);
Route::patch('/actualizar-parcial-cursos/{id}', [CursoController::class, 'updatePartial']);
Route::delete('/eliminar-cursos/{id}', [CursoController::class, 'destroy']);

//Rutas para acudientes
Route::post('/registrar-acudientes', [AcudienteController::class, 'registrar']);
Route::get('/obtener-acudientes', [AcudienteController::class, 'index']);
Route::put('/actualizar-acudientes/{id}', [AcudienteController::class, 'update']);
Route::patch('/actualizar-parcial-acudientes/{id}', [AcudienteController::class, 'updatePartial']);
Route::delete('/eliminar-acudientes/{id}', [AcudienteController::class, 'destroy']);

//Rutas para estudiantes
Route::post('/registrar-estudiantes', [EstudianteController::class, 'registrar']);
Route::get('/obtener-estudiantes', [EstudianteController::class, 'index']);
Route::put('/actualizar-estudiantes/{id}', [EstudianteController::class, 'update']);
Route::patch('/actualizar-parcial-estudiantes/{id}', [EstudianteController::class, 'updatePartial']);
Route::delete('/eliminar-estudiantes/{id}', [EstudianteController::class, 'destroy']);
Route::get('/estudiantes-curso/{curso_id}', [EstudianteController::class, 'obtenerPorCurso']);

//Rutas para autenticación (usuarios que se logean)
Route::get('/obtener-usuarios', [AuthController::class, 'index']);
Route::put('/actualizar-usuario/{id}', [AuthController::class, 'update']);
Route::patch('/actualizar-parcial-usuario/{id}', [AuthController::class, 'updatePartial']);
Route::delete('/eliminar-usuario/{id}', [AuthController::class, 'destroy']);



Route::post('/refrescar-token', [AuthController::class, 'refresh']);
Route::post('/logout', [AuthController::class, 'logout']);
Route::get('/perfil', [AuthController::class, 'profile']);


//Rutas para docentes
Route::get('/docentes', [DocenteController::class, 'index']);
Route::post('/docentes', [DocenteController::class, 'store']);
Route::get('/docentes/{id}', [DocenteController::class, 'show']);
Route::put('/docentes/{id}', [DocenteController::class, 'update']);
Route::delete('/docentes/{id}', [DocenteController::class, 'destroy']);
Route::get('/usuarios-disponibles', [DocenteController::class, 'usuariosDisponibles']);
Route::get('/usuarios-disponibles-docentes', [AuthController::class, 'usuariosDisponiblesDocentes']);

//Rutas para administrativos
Route::get('/administrativos', [AdministrativoController::class, 'index']);
Route::post('/administrativos', [AdministrativoController::class, 'store']);
Route::put('/administrativos/{id}', [AdministrativoController::class, 'update']);
Route::delete('/administrativos/{id}', [AdministrativoController::class, 'destroy']);
Route::get('/usuarios-disponibles-administrativos', [AuthController::class, 'usuariosDisponiblesAdministrativos']);

//Rutas para aulas
Route::post('/registrar-aulas', [AulaController::class, 'registrar']);
Route::get('/obtener-aulas', [AulaController::class, 'index']);
Route::put('/actualizar-aulas/{id}', [AulaController::class, 'update']);
Route::patch('/actualizar-parcial-aulas/{id}', [AulaController::class, 'updatePartial']);
Route::delete('/eliminar-aulas/{id}', [AulaController::class, 'destroy']);

//Rutas para asignatura 
Route::post('/registrar-asignaturas', [AsignaturaController::class, 'registrar']);
Route::get('/obtener-asignaturas', [AsignaturaController::class, 'index']);
Route::put('/actualizar-asignaturas/{id}', [AsignaturaController::class, 'update']);
Route::patch('/actualizar-parcial-asignaturas/{id}', [AsignaturaController::class, 'updatePartial']);
Route::delete('/eliminar-asignaturas/{id}', [AsignaturaController::class, 'destroy']);

//Rutas para clases
Route::post('/registrar-clases', [ClaseController::class, 'registrar']);
Route::get('/obtener-clases', [ClaseController::class, 'index']);
Route::put('/actualizar-clases/{id}', [ClaseController::class, 'update']);
Route::patch('/actualizar-parcial-clases/{id}', [ClaseController::class, 'updatePartial']);
Route::delete('/eliminar-clases/{id}', [ClaseController::class, 'destroy']);
Route::get('/clases-docente', [ClaseController::class, 'obtenerClaseDocente']);

//Rutas para asistencia
Route::post('/marcar-asistencia', [AsistenciaController::class, 'registrar']);
Route::get('/asistencias/{clase_id}', [AsistenciaController::class, 'obtenerPorClase']);
Route::get('/clases-del-dia', [ClaseController::class, 'clasesDelDia']);
});


