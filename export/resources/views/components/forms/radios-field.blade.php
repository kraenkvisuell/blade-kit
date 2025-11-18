@props([
    'id' => '',
    'label' => '',
    'live' => false,
    'name' => $attributes->whereStartsWith('wire:model')->first(),
    'options' => [],
])

@php
    $id = $id ?: 'id_' . Str::slug(Str::random(6));
@endphp

<x-forms.field-wrapper :$name>
    @if ($label)
        <x-forms.label
            :$required
            :$id
        >{{ $label }}</x-forms.label>
    @endif

    <div @class(['flex gap-6 flex-col @sm:flex-row'])>
        @foreach ($options as $option)
            @php
                $optionId = $id . '_' . Str::slug(Str::random(6));
            @endphp

            <x-forms.radio-option
                :label="$option['label']"
                :value="$option['value']"
                {{ $attributes }}
                :$optionId
            />
        @endforeach
    </div>

</x-forms.field-wrapper>
