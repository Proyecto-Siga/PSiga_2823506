<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;

class DatabaseSeeder extends Seeder
{
    /**
     * Seed the application's database.
     */
    public function run(): void
    {
        // Llama a tu seeder personalizado
        $this->call([
            AcudienteSeeder::class,
        ]);
    }
}