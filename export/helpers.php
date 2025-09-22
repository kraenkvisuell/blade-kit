<?php

use Illuminate\Support\Str;

function cdnImage($image, array $options = [])
{
    if (!$image) {
        return '';
    }

    $output = $options['fileformat'] ?? 'webp';

    $transformations = ['output=' . $output];

    $crop = $options['crop'] ?? false;

    if (isset($options['quality'])) {
        $transformations[] = 'quality=' . $options['quality'];
    }

    if (@$options['focus']) {
        $focusArr = array_map(fn($item) => intval($item) . 'p', array_filter(explode(' ', $options['focus'])));

        if (count($focusArr) === 2) {
            $transformations[] = 'focus=' . implode('x', $focusArr);
        }
    }

    if ($crop && isset($options['fit']) && is_array($options['fit']) && count($options['fit']) === 2) {
        $transformations[] = 'cover-max=' . implode('x', $options['fit']);
    } elseif (isset($options['fit']) && is_array($options['fit']) && count($options['fit']) === 2) {
        $transformations[] = 'contain-max=' . implode('x', $options['fit']);
    } elseif (isset($options['width']) && !isset($options['height'])) {
        $transformations[] = 'resize-max=' . $options['width'];
    } elseif (!isset($options['width']) && isset($options['height'])) {
        $transformations[] = 'resize-max=-x' . $options['height'];
    } elseif (isset($options['width']) && isset($options['height'])) {
        $transformations[] = 'resize-max=' . $options['width'] . 'x' . $options['height'];
    }

    return config('app.image_cdn')
        . '/' . config('filesystems.disks.assets.root') . '/' . $image['path']
        . '?twic=v1/' . implode('/', $transformations);
}

function ensureUrl($str)
{
    $str = trim($str);

    if (
        !Str::startsWith($str, '/')
        && !Str::startsWith($str, 'http://')
        && !Str::startsWith($str, 'https://')
        && !Str::startsWith($str, 'mailto:')
        && !Str::startsWith($str, 'tel:')
    ) {
        $str = 'https://' . $str;
    }

    return $str;
}
