<?php

namespace App\Listeners;

use Statamic\Facades\Entry;
use Statamic\Events\EntrySaved;

class EnsureSingleHomepage
{
    public function handle(EntrySaved $event): void
    {
        if ($event->entry->collection?->handle === 'pages' && $event->entry->is_home) {


            Entry::query()->where('is_home', true)->where('id', '!=', $event->entry->id)->get()->each(function ($otherEntry) {
                $otherEntry->set('is_home', false);
                $otherEntry->save();
            });

        }
    }
}
