import Vue from 'vue/dist/vue.esm'
import Shop from './components/shop.vue'

document.addEventListener('DOMContentLoaded', () => {
  const shop = new Vue({
    el: '#shop',
    data: {
      message: "Can you say hello?",
      show: true
    },
    components: { Shop }
  })
})

console.log('shop.js loaded')
