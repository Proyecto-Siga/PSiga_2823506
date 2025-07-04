<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Notifications\Notifiable;
use Illuminate\Database\Eloquent\Model;

/**
 * @OA\Schema(
 *     schema="Rol",
 *     title="Rol",
 *     description="Modelo Rol con nombre y lista de permisos",
 *     required={"nombre"},
 *     @OA\Property(property="nombre", type="string", example="Rol prueba"),
 *     
 *     )
 * )
 */



class Rol extends Model
{
    use HasFactory, Notifiable;
    protected $table = 'roles';

    protected $fillable = ['nombre','permisos'];
    protected $casts = ['permisos' => 'array',];

    public function usuarios()
    {
    return $this->hasMany(Usuario::class);
    }
}

