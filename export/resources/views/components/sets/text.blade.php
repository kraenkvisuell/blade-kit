@props(['set', 'page'])

<x-shared.section>
    <div class="grid gap-9">
        <x-shared.headline :$set />

        <div class="editor">
            {!! $set->text !!}
        </div>
    </div>
</x-shared.section>
