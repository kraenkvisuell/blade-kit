<?php

namespace App\Console\Commands;

use Illuminate\Console\Command;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Storage;

class ImportStubs extends Command
{
    protected $signature = 'app:import-stubs';

    protected $description = 'Import starter-kit stubs';

    public function handle()
    {
        $dbPath = base_path('stubs/db/dummy.sql');
        DB::unprepared(file_get_contents($dbPath));
        $this->info('db seeded from stub!');

        $allFilePaths = Storage::disk('stubs')->allFiles('/');

        foreach ($allFilePaths as $filePath) {
            $file = Storage::disk('stubs')->get($filePath);
            $this->info('copying ' . $filePath);
            Storage::disk('assets')->put($filePath, $file, 'public');
        }
    }
}
