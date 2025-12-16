<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Clase extends Model
{
    use HasFactory;

    protected $table = 'clases';

    protected $fillable = [
        'asignatura_id',
        'docente_id',
        'aula_id',
        'curso_id',
        'fecha',
        'hora_inicio',
        'hora_fin',
    ];

    // Relaciones

    public function asignatura() {
        return $this->belongsTo(Asignatura::class);
    }

    public function docente() {
        return $this->belongsTo(Docente::class, 'docente_id');
    }

    

    public function aula() {
        return $this->belongsTo(Aula::class, 'aula_id');
    }
    public function curso()
{
    return $this->belongsTo(Curso::class);
}

}
