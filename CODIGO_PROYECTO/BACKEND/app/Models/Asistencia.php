<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

/**
 * @OA\Schema(
 *     schema="Asistencia",
 *     title="Asistencia",
 *     description="Esquema del modelo Asistencia",
 *     required={"clase_id", "estudiante_id", "estado"},
 *     @OA\Property(property="id", type="integer", example=10),
 *     @OA\Property(property="clase_id", type="integer", example=1),
 *     @OA\Property(property="estudiante_id", type="integer", example=5),
 *     @OA\Property(property="estado", type="integer", example=1, description="0: falta, 1: presente")
 * )
 */


class Asistencia extends Model
{
    use HasFactory;

    protected $table = 'asistencias';
    protected $fillable=[
        'clase_id',
        'estudiante_id',
        'estado'
    ];

        public function clase() {
        return $this->belongsTo(Clase::class);
    }

    public function estudiante() {
        return $this->belongsTo(Estudiante::class);
    }
}