@props([
    'align' => 'left',
    'clearable' => false,
    'clearMethod' => '',
    'id' => '',
    'isRecording' => false,
    'isPaused' => false,
    'label' => '',
    'help' => '',
    'size' => 'regular',
    'name' => $attributes->whereStartsWith('wire:model')->first(),
    'required' => false,
    'type' => 'text',
])

@php
    $id = $id ?: 'id_' . Str::slug(Str::random(6));

    $cssClasses = [
        'rounded bg-white dark:bg-base-700 dark:text-white w-full leading-[1.15em]',
        'text-center' => $align === 'center',
        'text-left' => $align === 'left',
        'px-3 text-md h-9' => $size === 'regular',
        'px-3 text-md h-7' => $size === 'small',
        'px-4 text-2xl h-12' => $size === 'large',
        'text-base-900 dark:text-white' => !$isRecording,
        'text-highlight' => $isRecording,
        'outline-dashed outline-task2' => $errors->has($name),
        'min-h-32 pt-1' => $type === 'textarea',
    ];
@endphp

<x-forms.field-wrapper :$name>
    @if ($label)
        <x-forms.label
            :$align
            :$required
            :$id
        >{{ $label }}</x-forms.label>
    @endif

    <div
        class="w-full relative"
        x-data="{
            inputValue: $wire.entangle('{{ $name }}'),
            get isNotEmpty() {
                return this.inputValue !== ''
            }
        }"
    >
        @if ($type === 'textarea')
            <textarea
                x-model="inputValue"
                id="{{ $id }}"
                name="{{ $name }}"
                {{ $attributes }}
                @class($cssClasses)
            ></textarea>
        @else
            <input
                x-model="inputValue"
                id="{{ $id }}"
                name="{{ $name }}"
                {{ $attributes }}
                type="{{ $type }}"
                @class($cssClasses)
            />
        @endif

        @if ($clearable)
            <div
                x-show="isNotEmpty"
                x-cloak
                class="absolute top-2 right-2"
            >
                <x-forms.remove-button wire:click="{{ $clearMethod }}" />
            </div>
        @endif

        @if ($isRecording)
            <div class="absolute top-[18px] right-4 w-3 h-3 rounded-full bg-highlight animate-ping">

            </div>

            <div class="absolute top-[18px] right-4 w-3 h-3 rounded-full bg-highlight">

            </div>
        @endif

        @if ($isPaused)
            <div class="absolute top-[18px] right-4 w-3 h-3 rounded-full bg-base-900/30">

            </div>
        @endif
    </div>

    @if ($help)
        <x-forms.field-help :text="$help" />
    @endif

    @if ($errors->has($name))
        <x-forms.field-error :error="$errors->first($name)" />
    @endif
</x-forms.field-wrapper>
