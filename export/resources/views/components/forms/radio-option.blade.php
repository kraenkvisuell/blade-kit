@props(['optionId', 'label', 'value', 'labelSize' => 'regular'])

<div @class(['flex items-start gap-2'])>
    <div class="w-8 h-8 relative flex-shrink-0 flex-grow-0">
        <input
            type="radio"
            {{ $attributes }}
            value="{{ $value }}"
            id="{{ $optionId }}"
            class="peer w-full h-full opacity-0"
        />

        <div
            class="
                    absolute pointer-events-none top-0 inset-0 rounded-full inset-shadow-xs
                    bg-white dark:bg-base-700 dark:peer-checked:bg-white
                    peer-checked:border-9 peer-checked:border-task4 
                ">

        </div>
    </div>

    <label
        for="{{ $optionId }}"
        @class([
            'font-headline font-bold',
            'text-heading-base mt-1' => $labelSize === 'regular',
            'leading-[1.1em] text-heading-sm mt-[10px]' => $labelSize === 'small',
        ])
    >{{ $label }}</label>
</div>
