<?php

use Statamic\Facades\Entry;
use Illuminate\Support\Facades\Route;

Route::statamic('/', 'default', function (Request $request) {
    return ['page' => Entry::query()->where('is_home', true)->first()];
});
