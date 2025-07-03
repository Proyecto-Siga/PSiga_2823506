<?php

namespace App\Models;
use App\Models\Estudiante;


use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Factories\HasFactory;


class Reporte extends Model
{
    use HasFactory;

    protected $fillable = ['estudiante_id', 'fecha_reporte', 'correo', 'fallas_acumuladas'];
    public function estudiante()
    {
        return $this->belongsTo(Estudiante::class);
    }

}
