import { createApp } from 'vue';
import AppHeader from './components/AppHeader.vue';
import HeroSection from './components/HeroSection.vue';
import FeaturedProducts from './components/FeaturedProducts.vue';
import CategoryBanners from './components/CategoryBanners.vue';
import NewsletterSection from './components/NewsletterSection.vue';
import AppFooter from './components/AppFooter.vue';

const app = createApp({
  components: {
    AppHeader,
    HeroSection,
    FeaturedProducts,
    CategoryBanners,
    NewsletterSection,
    AppFooter
  }
});

app.mount('#app');
