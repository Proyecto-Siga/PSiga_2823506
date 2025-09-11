<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

/**
 * @OA\Schema(
 *     schema="Estudiante",
 *     title="Estudiante",
 *     description="Esquema del modelo Estudiante",
 *     required={"nombre", "apellido", "acudiente_id", "curso_id"},
 *     @OA\Property(property="id", type="integer", example=1),
 *     @OA\Property(property="nombre", type="string", example="Pedro"),
 *     @OA\Property(property="apellido", type="string", example="García"),
 *     @OA\Property(property="acudiente_id", type="integer", example=2),
 *     @OA\Property(property="curso_id", type="integer", example=3)
 * )
 */


class Estudiante extends Model
{
    use HasFactory;

    protected $fillable = ['acudiente_id', 'curso_id', 'nombre', 'apellido'];

    public function acudiente()
    {
        return $this->belongsTo(Acudiente::class);
    }

    public function curso()
    {
        return $this->belongsTo(Curso::class);
    }
}
