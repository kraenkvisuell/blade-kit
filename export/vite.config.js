import { defineConfig, loadEnv } from 'vite'
import laravel from 'laravel-vite-plugin'
// import vue2 from '@vitejs/plugin-vue2';

const env = loadEnv('', '')

export default defineConfig({
    plugins: [
        laravel({
            input: [
                'resources/css/site.css',
                'resources/js/site.js',

                // Control Panel assets.
                // https://statamic.dev/extending/control-panel#adding-css-and-js-assets
                // 'resources/css/cp.css',
                // 'resources/js/cp.js',
            ],
            refresh: true,
        }),
        // vue2(),
    ],
    server: {
        origin: 'https://' + env.VITE_SLUG + '.test:5173',
        cors: true,
    }
})
