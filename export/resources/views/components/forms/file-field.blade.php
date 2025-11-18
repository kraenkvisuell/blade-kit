@props([
    'required' => false,
    'label' => '',
    'live' => false,
    'multiple' => false,
    'inscription' => '',
    'help' => '',
    'accept' => null,
    'id' => '',
    'clearOnEvent' => '',
    'name' => $attributes->whereStartsWith('wire:model')->first(),
])

@php
    $id = $id ?: 'id_' . Str::slug(Str::random(6));

    $cssClasses = [
        'px-3 py-2 h-9 rounded-xs inset-shadow-xs bg-base-100 dark:bg-base-900 text-base-900 dark:text-white 
            pointer-events-none text-center leading-[1.3]',
        'outline-dashed outline-task2' => $errors->has($name),
    ];
@endphp

<x-forms.field-wrapper :$name>
    @if ($label)
        <x-forms.label
            :$required
            :$id
        >{{ $label }}</x-forms.label>
    @endif

    <div
        class="grid gap-3"
        x-data="{
            file: {},
            thumbnail: '',
            updateFile(newFiles) {
                this.thumbnail = ''
                if (Object.values(newFiles).length) {
                    this.file = Object.values(newFiles)[0]
        
                    if (this.file.type.startsWith('image/') && this.file.size < 10000000) {
                        const reader = new FileReader();
        
                        reader.addEventListener('load', () => this.thumbnail = reader.result, false);
        
                        reader.readAsDataURL(this.file)
                    }
                }
            },
            removeFile() {
                this.file = {}
                this.thumbnail = ''
                this.$refs.fileinput.value = null;
            }
        }"
    >
        <div class="relative">
            <div @class($cssClasses)>{{ $inscription ?: __('Datei auswählen') }}</div>

            <input
                x-ref="fileinput"
                x-on:change="updateFile($event.target.files)"
                @if ($clearOnEvent) x-on:{{ $clearOnEvent }}.window="removeFile" @endif
                @if ($accept) accept="{{ $accept }}" @endif
                {{ $attributes }}
                type="file"
                class="absolute inset-0 opacity-0 bg-warning"
            />

            @if ($help)
                <x-forms.field-help :text="$help" />
            @endif
        </div>

        {{-- <div
            x-show="!file.name"
            class="opacity-30 text-sm -mt-2"
        >
            {{ __('Keine Datei ausgewählt') }}
        </div> --}}

        <template x-if="file.name">
            <div class="border rounded-xs px-2 py-2 flex justify-between items-center gap-2">
                <div class="flex gap-2">
                    <template x-if="thumbnail">
                        <div class="w-24 h-24 p-2 bg-base-100 dark:bg-base-900 rounded-xs inset-shadow-xs">
                            <img
                                x-bind:src="thumbnail"
                                class="w-full h-full object-contain"
                            />
                        </div>
                    </template>

                    <div>
                        <div x-text="file.name">
                        </div>

                        <div
                            class="text-sm"
                            x-text="filesize(file.size, {locale: 'de', round: 1})"
                        >
                        </div>
                    </div>
                </div>

                <div class="flex justify-end pr-1 pt-1 z-10">
                    <x-forms.remove-button x-on:click="removeFile()" />
                </div>
            </div>

        </template>
    </div>

    @if ($errors->has($name))
        <x-forms.field-error :error="$errors->first($name)" />
    @endif
</x-forms.field-wrapper>
