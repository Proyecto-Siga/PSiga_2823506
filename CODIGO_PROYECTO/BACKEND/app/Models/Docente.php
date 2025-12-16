<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

/**
 * @OA\Schema(
 *     schema="Docente",
 *     title="Docente",
 *     description="Modelo que representa a un docente",
 *     required={"usuario_id", "nombre", "apellido"},
 *     @OA\Property(property="id", type="integer", example=1),
 *     @OA\Property(property="usuario_id", type="integer", example=3),
 *     @OA\Property(property="nombre", type="string", example="Laura"),
 *     @OA\Property(property="apellido", type="string", example="Martínez")
 * )
 */


class Docente extends Model
{
    use HasFactory;

    protected $fillable = ['usuario_id', 'nombre', 'apellido'];

    public function usuario()
    {
        return $this->belongsTo(Usuario::class);
    }

    public function asignaturas()
    {
    return $this->hasMany(Asignatura::class);
    }
}
