@props(['name' => 'empty'])

<div
    @class(['grid scroll-m-20 items-start gap-2'])
    x-ref="{{ $name }}"
>
    {{ $slot }}
</div>
