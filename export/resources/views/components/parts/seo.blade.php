@props(['page', 'settings'])

@php
    $metaDescription = $page->meta_description ?: $settings->meta_description;
    $browserTitle = $page->browser_title ?: $page->title;
@endphp

<title>{{ $browserTitle }} | {{ $settings->website_title }}</title>

@if ($metaDescription)
    <meta name="description" content="{{ $metaDescription }}" />
@endif
