<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

    /**
 * @OA\Schema(
 *     schema="Administrativo",
 *     title="Administrativo",
 *     description="Modelo que representa a un administrativo",
 *     required={"usuario_id", "nombre", "apellido"},
 *     @OA\Property(property="id", type="integer", example=1),
 *     @OA\Property(property="usuario_id", type="integer", example=4),
 *     @OA\Property(property="nombre", type="string", example="Juan"),
 *     @OA\Property(property="apellido", type="string", example="Pérez")
 * )
 */


class Administrativo extends Model
{
    use HasFactory;

    protected $fillable = [
        'usuario_id',
        'nombre',
        'apellido',
    ];

    public function usuario()
    {
        return $this->belongsTo(Usuario::class);
    }
}