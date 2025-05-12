<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

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