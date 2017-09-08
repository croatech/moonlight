import Vue from 'vue/dist/vue.esm'
import VueResource from 'vue-resource'
import config from './config.js'
Vue.use(VueResource);

document.addEventListener('DOMContentLoaded', () => {
  new Vue({
    el: '#shop',
    data: {
      categories: ['First', 'Second']
    },
    methods: {
      getCategoriesList: function() {
        var link = config.apiUrl + 'equipment/categories'
        console.log(link)
        this.$http.get(link).then(response => {
          this.categories = response.body
        }, response => {
          // error callback
        });
      }
    },
    mounted: function() {
      this.getCategoriesList()
    }
  })
})

console.log('shop.js loaded')
