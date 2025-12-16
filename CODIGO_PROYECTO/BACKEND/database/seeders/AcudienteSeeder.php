<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use App\Models\Acudiente;
use Faker\Factory as Faker;

class AcudienteSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        $faker = Faker::create();

        for ($i = 0; $i < 330; $i++) {
            Acudiente::create([
                'nombre' => $faker->firstName,
                'apellido' => $faker->lastName,
                'correo' => $faker->unique()->safeEmail,
            ]);
        }
    }
}
