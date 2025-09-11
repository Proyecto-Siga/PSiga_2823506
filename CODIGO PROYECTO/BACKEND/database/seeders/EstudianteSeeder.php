<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use App\Models\Estudiante;
use Faker\Factory as Faker;

class EstudianteSeeder extends Seeder
{
    public function run(): void
    {
        $faker = Faker::create();
        $acudienteId = 1;

        // 11 cursos con 30 estudiantes cada uno
        for ($cursoId = 1; $cursoId <= 11; $cursoId++) {
            for ($i = 0; $i < 30; $i++) {
                Estudiante::create([
                    'nombre' => $faker->firstName,
                    'apellido' => $faker->lastName,
                    'acudiente_id' => $acudienteId,
                    'curso_id' => $cursoId,
                ]);

                $acudienteId++;
            }
        }
    }
}
