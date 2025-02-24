<x-layouts.default :$page :$settings :$site>
    <div class="grid gap-16">
        <div class="grid gap-24">
            <x-shared.section>
                <div class="editor">
                    <h1>{{ $page->title }}</h1>
                </div>
            </x-shared.section>

            <div class="grid gap-24">
                @foreach ($page->content ?? [] as $set)
                    <x-dynamic-component :component="'sets.' . $set->type" :$set :$page />
                @endforeach
            </div>
        </div>
    </div>
</x-layouts.default>
