<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

/**
 * @OA\Schema(
 *     schema="Acudiente",
 *     title="Acudiente",
 *     description="Modelo que representa un acudiente",
 *     required={"nombre", "apellido", "correo"},
 *     @OA\Property(property="nombre", type="string", example="Lucía"),
 *     @OA\Property(property="apellido", type="string", example="Ramírez"),
 *     @OA\Property(property="correo", type="string", format="email", example="lucia.ramirez@example.com")
 * )
 */


class Acudiente extends Model
{
    use HasFactory;

    protected $fillable = ['nombre', 'apellido', 'correo'];


    public function estudiantes()
    {
        return $this->hasMany(Estudiante::class);
    }
}
