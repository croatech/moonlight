/* eslint no-console:0 */
// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.
//
// To reference this file, add <%= javascript_pack_tag 'application' %> to the appropriate
// layout file, like app/views/layouts/application.html.erb

import Vue from 'vue/dist/vue.esm'
import VueResource from 'vue-resource'
import WeaponShop from './components/weapon_shop.vue'
import CraftShop from './components/craft_shop.vue'
import BootstrapVue from 'bootstrap-vue'
import axios from 'axios'

import 'bootstrap/dist/css/bootstrap.css'
import 'bootstrap-vue/dist/bootstrap-vue.css'

Vue.use(VueResource)
Vue.use(BootstrapVue)

axios.defaults.baseURL = 'http://localhost:3000/api';

document.addEventListener('DOMContentLoaded', () => {
  const app = new Vue({
    el: '#app',
    components: {
      WeaponShop,
      CraftShop
    }
  })
})
