import { defineConfig } from "astro/config";
import mdx from "@astrojs/mdx";
import tailwind from "@astrojs/tailwind";
import image from "@astrojs/image";
import sitemap from "@astrojs/sitemap";

// https://astro.build/config
export default defineConfig({
  vite: {
    ssr: {
      external: ["svgo"]
    }
  },
  markdown: {
    shikiConfig: {
      theme: "dracula",
      wrap: true
    }
  },
  site: "http://0.0.0.0:3000",
  integrations: [mdx({}), tailwind({
    config: {
      applyBaseStyles: false
    }
  }), 
  image(),
  sitemap({
    filter: (page) => page !== 'https://kolv.in/posts'
  })
]
});