@props([
    'isLink' => false,
    'disabled' => false,
    'mode' => 'primary',
    'type' => 'button',
])

<div>
    <{{ $isLink ? 'a' : 'button' }}
        @if (!$isLink) type="{{ $type }}" @endif
        {{ $attributes }}
        @class([
            'relative block text-white font-headline rounded-lg px-3 py-2 text-sm',
            'leading-5 overflow-visible bg-base-500 text-heading-base',
            'cursor-pointer' => !$disabled,
        ])
    >
        <div class="leading-[1.1em]">{{ $slot }}</div>

        </{{ $isLink ? 'a' : 'button' }}>
</div>
