@props(['set', 'ratio', 'url', 'alt'])

@php
    if ($set->force_ratio) {
        $ratioArr = explode(':', $set->ratio);
        $imgRatio = intval($ratioArr[0]) / intval($ratioArr[1]);
    } else {
        $imgRatio = $ratio->raw();
    }

    $dimensions = [
        'lg' => [
            'width' => 1600,
            'height' => 1600,
        ],
        'md' => [
            'width' => 1200,
            'height' => 1200,
        ],
        'default' => [
            'width' => 800,
            'height' => 800,
        ],
    ];

    $orientation = $imgRatio < 1.2 ? 'portrait' : 'landscape';

    $maxWidth = $orientation === 'landscape' ? '' : 'max-w-screen-md';

    if ($set->force_ratio) {
        foreach ($dimensions as $key => $values) {
            if ($imgRatio < 1) {
                $dimensions[$key]['width'] = $imgRatio * $dimensions[$key]['width'];
            } else {
                $dimensions[$key]['height'] = (1 / $imgRatio) * $dimensions[$key]['height'];
            }
        }
    }

    $fit = $set->force_ratio ? 'crop_focal' : 'max';

@endphp

<div class="flex justify-center">
    <div class="grid gap-1 {{ $maxWidth }}">
        <picture>
            <s:glide src="{{ $url }}" format="webp" width="{{ $dimensions['lg']['width'] }}"
                height="{{ $dimensions['lg']['height'] }}" fit="{{ $fit }}" quality="80">
                <source media="(min-width:800px)" srcset="{{ $url }}">
            </s:glide>

            <s:glide src="{{ $url }}" format="webp" width="{{ $dimensions['md']['width'] }}"
                height="{{ $dimensions['md']['height'] }}" fit="{{ $fit }}" quality="80">
                <source media="(min-width:600px)" srcset="{{ $url }}">
            </s:glide>

            <s:glide src="{{ $url }}" format="webp" width="{{ $dimensions['default']['width'] }}"
                height="{{ $dimensions['default']['height'] }}" fit="{{ $fit }}" quality="80">
                <img src="{{ $url }}" alt="{{ $alt }}" />
            </s:glide>
        </picture>

        <x-sets.image.captions :$set />
    </div>
</div>
