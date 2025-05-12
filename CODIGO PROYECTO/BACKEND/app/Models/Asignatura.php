<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Asignatura extends Model
{
    use HasFactory;

    protected $fillable = ['nombre_aula'];
    
    public function usuarios()
    {
    return $this->hasMany(Clase::class);
    }
}
