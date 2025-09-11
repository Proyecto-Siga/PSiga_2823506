<?php

namespace App\Models;
use App\Models\Estudiante;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Factories\HasFactory;

/**
 * @OA\Schema(
 *     schema="Reporte",
 *     title="Reporte",
 *     description="Esquema del modelo Reporte",
 *     required={"estudiante_id", "fecha_reporte", "correo", "fallas_acumuladas"},
 *     @OA\Property(property="id", type="integer", example=1),
 *     @OA\Property(property="estudiante_id", type="integer", example=5),
 *     @OA\Property(property="fecha_reporte", type="string", format="date", example="2025-07-04"),
 *     @OA\Property(property="correo", type="string", format="email", example="acudiente@correo.com"),
 *     @OA\Property(property="fallas_acumuladas", type="integer", example=3)
 * )
 */

class Reporte extends Model
{
    use HasFactory;

    protected $fillable = ['estudiante_id', 'fecha_reporte', 'correo', 'fallas_acumuladas'];
    public function estudiante()
    {
        return $this->belongsTo(Estudiante::class);
    }

}
