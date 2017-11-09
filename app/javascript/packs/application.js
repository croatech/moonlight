/* eslint no-console:0 */
// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.
//
// To reference this file, add <%= javascript_pack_tag 'application' %> to the appropriate
// layout file, like app/views/layouts/application.html.erb

import Vue from 'vue/dist/vue.esm'
import Vuex from 'vuex'
import VueResource from 'vue-resource'
import BootstrapVue from 'bootstrap-vue'
import axios from 'axios'
import WeaponShop from './components/locations/weapon_shop.vue'
import CraftShop from './components/locations/craft_shop.vue'
import Gold from './components/player/gold.vue'
import Stats from './components/player/stats.vue'
import Inventory from './components/player/inventory.vue'
import Fight from './components/fight.vue'
import WaywardPines from './components/wayward_pines.vue'

import 'bootstrap/dist/css/bootstrap.css'
import 'bootstrap-vue/dist/bootstrap-vue.css'

Vue.use(VueResource);
Vue.use(BootstrapVue);
Vue.use(Vuex);

axios.defaults.baseURL = 'http://localhost:3000/api';

export const store = new Vuex.Store({
  state: {
    player: {}
  },
  mutations: {
    increment_gold(state, n) {
      state.player.gold += n
    },
    decrement_gold(state, n) {
      state.player.gold -= n
    },
    updatePlayer(state, data) {
      state.player = data
    }
  }
});

document.addEventListener('DOMContentLoaded', () => {
  const app = new Vue({
    el: '#app',
    store,
    components: {
      WeaponShop,
      CraftShop,
      Gold,
      Stats,
      Inventory,
      Fight,
      WaywardPines
    },
    data: {
      currentPlayer: null
    },
    methods: {
      setPlayerData: function() {
        axios.get('/players/current')
        .then(response => {
          this.$store.state.player = response.data
          this.$store.state.player.gold = response.data['gold']
        })
        .catch(e => {
          console.log(e)
        })
      },
    },
    created: function() {
      this.setPlayerData()
    }
  })
})
