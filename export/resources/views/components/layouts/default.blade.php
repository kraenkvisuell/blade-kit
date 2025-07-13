@props(['page', 'settings', 'site'])

<!doctype html>
<html lang="{{ $site->short_locale }}">

<head>
    <meta charset="utf-8">
    <meta
        http-equiv="X-UA-Compatible"
        content="IE=edge"
    >
    <meta
        name="viewport"
        content="width=device-width, initial-scale=1"
    >

    <x-parts.favicons
        :$page
        :$settings
    />
    <x-parts.seo
        :$page
        :$settings
    />

    <link
        rel="manifest"
        href="/manifest.json"
    >

    @production
        @if (config('services.fathom.key'))
            <script
                src="https://cdn.usefathom.com/script.js"
                data-site="{{ config('services.fathom.key') }}"
                defer
            ></script>
        @endif
    @endproduction

    @vite(['resources/css/site.css', 'resources/js/site.js'])

    @livewireStyles
</head>

<body class="w-full bg-base-50 dark:bg-base-900 text-base-900 dark:text-base-200 font-default font-light leading-normal">
    <x-parts.header :$settings />

    <div class="w-full min-h-screen flex flex-col gap-12 pt-64 pb-32">
        <div class="w-full text-copy-base leading-6 min-h-screen">
            {{ $slot }}
        </div>
    </div>

    @livewireScripts
</body>

</html>

@php
    $bogusString = 'aspect-2/1 aspect-16/9 aspect-16/10 aspect-5/3 aspect-4/3 aspect-1/1 aspect-3/4 aspect-3/5 aspect-10/16 aspect-9/16 aspect-1/2
';
@endphp
