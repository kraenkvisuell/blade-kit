<?php

namespace App\Console\Commands\StarterKit;

use Illuminate\Console\Command;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Storage;

class Init extends Command
{
    protected $signature = 'kit:init';

    protected $description = 'Import starter-kit stubs';

    public function handle()
    {

        $composerJson = json_decode(Storage::disk('base')->get('composer.json'));

        $composerJson->autoload->files = [
            'helpers.php'
        ];

        Storage::disk('base')
            ->put('composer.json', json_encode($composerJson, JSON_UNESCAPED_SLASHES | JSON_PRETTY_PRINT));

        $this->info('composer.json updated!');


        $dbPath = base_path('stubs/db/dummy.sql');
        DB::unprepared(file_get_contents($dbPath));
        $this->info('db seeded from stub!');

        $allFilePaths = Storage::disk('stubs')->allFiles('assets');

        foreach ($allFilePaths as $filePath) {
            $file = Storage::disk('stubs')->get($filePath);
            $this->info('copying ' . $filePath);
            Storage::disk('baseS3')->put($filePath, $file, 'public');
        }
    }
}
