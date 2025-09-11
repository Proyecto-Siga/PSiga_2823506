<?php

namespace App\Models;

use Illuminate\Contracts\Auth\MustVerifyEmail;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Notifications\Notifiable;
use Tymon\JWTAuth\Contracts\JWTSubject;

/**
 * @OA\Schema(
 *     schema="Usuario",
 *     title="Usuario",
 *     description="Esquema del modelo Usuario",
 *     required={"correo", "password", "rol_id"},
 *     @OA\Property(property="id", type="integer", example=1),
 *     @OA\Property(property="correo", type="string", format="email", example="estiben@gmail.com"),
 *     @OA\Property(property="password", type="string", format="password", example="12345678"),
 *     @OA\Property(property="rol_id", type="integer", example=2),
 *     @OA\Property(property="estado", type="integer", example=1)
 * )
 */


class Usuario extends Authenticatable implements JWTSubject
{
    use HasFactory, Notifiable;

    protected $table = 'usuarios';

    protected $fillable = ['rol_id','estado','correo','password'];
    protected $hidden = ['password'];

    public function rol(){
        return $this->belongsTo(Rol::class);
    }

    public function docente(){
        return $this->hasOne(Docente::class);
    }

    public function administrativo(){
        return $this->hasOne(Administrativo::class);
    }
    

    public function getJWTIdentifier()
    {
        return $this->getKey();
    }

    public function getJWTCustomClaims(array $claims = [])
    {
        return [];
    }
}

