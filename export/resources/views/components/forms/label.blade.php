@props(['id', 'required' => false, 'align' => 'center'])

<label
    @class([
        'font-headline text-heading-base flex items-center dark:text-white',
        'font-bold' => $required,
        'text-center justify-center' => $align === 'center',
        'text-left' => $align === 'left',
    ])
    for="{{ $id }}"
>
    <div>{{ $slot }}</div>
</label>
