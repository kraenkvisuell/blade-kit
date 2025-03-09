<?php

namespace App\Console\Commands;

use Illuminate\Console\Command;
use Illuminate\Support\Facades\DB;

class ImportStubs extends Command
{
    protected $signature = 'app:import-stubs';

    protected $description = 'Import starter-kit stubs';

    public function handle()
    {
        $path = base_path('stubs/db/dummy.sql');
        DB::unprepared(file_get_contents($path));
        $this->info('db seeded from stub!');
    }
}
