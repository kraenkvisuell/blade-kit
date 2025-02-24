@props(['settings'])

<picture>
    <s:glide src="{{ $settings->main_logo_dark }}" height="100">
        <source srcset="{{ $url }}" media="(prefers-color-scheme: dark)" />
    </s:glide>

    <s:glide src="{{ $settings->main_logo }}" height="100">
        <source srcset="{{ $url }}" media="(prefers-color-scheme: light)" />

        <img src="{{ $url }}" class="h-full" alt="{{ $settings->website_title }} Logo" />
    </s:glide>
</picture>
