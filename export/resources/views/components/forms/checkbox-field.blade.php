@props([
    'id' => '',
    'label' => '',
    'required' => false,
    'size' => 'regular',
    'mode' => 'default',
    'live' => false,
    'name' => $attributes->whereStartsWith('wire:model')->first(),
])

@php
    $id = $id ?: 'id_' . Str::slug(Str::random(6));
@endphp

<div @class([
    'w-full relative flex-shrink-0 flex items-start',
    'gap-3' => $size === 'regular' && $mode !== 'map',
    'gap-1' => $size === 'small',
])>
    <input
        type="checkbox"
        {{ $attributes }}
        id="{{ $id }}"
        @class([
            'peer block opacity-0 flex-shrink-0',
            'w-9 h-9 translate-y-[-9px]' => $size === 'regular',
            'w-6 h-6 translate-y-[-3px]' => $size === 'small',
        ])
    />

    <div @class([
        'absolute pointer-events-none top-0 inset-0',
        'w-9 h-9 translate-y-[-9px]' => $size === 'regular',
        'w-6 h-6 translate-y-[-3px]' => $size === 'small',
        'bg-white dark:bg-base-700' => $mode === 'default',
        'bg-base-600' => $mode === 'forms',
        'rounded peer-checked:bg-task4' => $mode !== 'map',
        'outline-dashed outline-task2' => $errors->has($name),
    ])>

    </div>

    @if ($mode !== 'map')
        <i @class([
            'fa-solid fa-check opacity-0 peer-checked:opacity-100 absolute pointer-events-none text-white',
            'left-1 translate-y-[-4px] text-2xl' => $size === 'regular',
            'translate-y-[-2px] left-[1px] text-lg' => $size === 'small',
        ])></i>
    @else
        <i @class([
            'fa-solid fa-dot text-[20px] absolute top-[-1px] left-[2px] text-white pointer-events-none peer-checked:opacity-0',
        ])>
        </i>

        <i @class([
            'fa-solid fa-location-dot text-[20px] absolute top-[2px] left-[2px] text-task4 opacity-0 pointer-events-none peer-checked:opacity-100',
        ])>
        </i>
    @endif

    <label
        for="{{ $id }}"
        @class([
            'leading-[1.2em] w-full',
            'font-bold peer-checked:font-extrabold font-headline text-heading-sm peer-checked:text-heading-base translate-x-[-9px]' =>
                $mode === 'map',
            'text-base' => $mode !== 'map',
        ])
    >{!! $label !!}</label>
</div>
