import Vue from 'vue/dist/vue.esm'
import VueResource from 'vue-resource'
import config from './config.js'
Vue.use(VueResource);

document.addEventListener('DOMContentLoaded', () => {
  new Vue({
    el: '#shop',
    data: {
      categories: [],
      items: [],
      currentCategory: null
    },
    methods: {
      getCategoriesList: function() {
        var link = config.apiUrl + '/equipment/categories'
        console.log(link)
        this.$http.get(link).then(response => {
          this.categories = response.body
        }, response => {
          console.log(response)
        });
      },
      showCategory: function(index) {
        this.currentCategory = index
        this.items = this.categories[index].items
      },
      buyItem: function(item_id) {
        var link = config.apiUrl + '/equipment/items/' + item_id + '/buy'
        this.$http.post(link).then(response => {
          console.log(response)
        }, response => {
          console.log(response)
        });
      }
    },
    mounted: function() {
      this.getCategoriesList()
    }
  })
})

console.log('shop.js loaded')
