import { defineConfig } from 'vite';

export default defineConfig({
  base: './', // This ensures assets are loaded correctly
  build: {
    outDir: 'dist',
    assetsDir: 'assets',
    emptyOutDir: true,
    rollupOptions: {
      output: {
        manualChunks: undefined
      }
    }
  },
  resolve: {
    alias: {
      '~bootstrap': 'bootstrap'
    }
  }
});
