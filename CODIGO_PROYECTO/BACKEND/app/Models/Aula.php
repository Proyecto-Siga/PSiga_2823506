<?php
namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

/**
 * @OA\Schema(
 *     schema="Aula",
 *     title="Aula",
 *     description="Modelo de Aula",
 *     required={"nombre_aula"},
 *     @OA\Property(property="id", type="integer", example=1),
 *     @OA\Property(property="nombre_aula", type="string", example="Aula 101"),
 *     
 * )
 */


class Aula extends Model
{
    use HasFactory;

    protected $table = 'aulas';

    protected $fillable = ['nombre_aula'];

    public function clases() {
        return $this->hasMany(Clase::class);
    }
}