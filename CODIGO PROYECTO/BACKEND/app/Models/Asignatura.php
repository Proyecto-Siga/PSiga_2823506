<?php

namespace App\Models;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

/**
 * @OA\Schema(
 *     schema="Asignatura",
 *     title="Asignatura",
 *     description="Modelo que representa una asignatura",
 *     required={"nombre_asignatura"},
 *     @OA\Property(property="id", type="integer", example=1),
 *     @OA\Property(property="nombre_asignatura", type="string", example="Matemáticas")
 * )
 */


class Asignatura extends Model
{
    use HasFactory;
    protected $table = 'asignaturas';
    protected $fillable = ['nombre_asignatura'];
    
    public function clases()
    {
    return $this->hasMany(Clase::class);
    }
}
