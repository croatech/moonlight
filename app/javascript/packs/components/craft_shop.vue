<template>
  <div class="shop">
    <div class="item-categories">
      <div class="col-md-3">
        <div class="category" v-for="(category, i) in categories">
          <a @click="showCategory(i)" :class="'category-btn btn btn-default ' + resolveCategoryClass(i)">{{category.name}}</a>
        </div>
      </div>

      <div class="col-md-9">
        <div class="items" v-if="currentCategory != null">
          <h3 v-if="items.length == 0">Items will be soon</h3>
          <div class="item row" v-for="item in items">
            <div class="col-md-3">
              <img v-bind:src="item.image"/>
            </div>

            <div class="col-md-9">
              <div class="level">[{{item.required_skill}}]</div>

              <h3>{{item.name}}</h3>

              <a @click="buyItem(item.id)" class="buy-button btn btn-success">
                Buy for {{item.price}} gold
              </a>

              <b-alert variant="danger"
                       dismissible
                       :show="showErrorFlash && boughtItemId == item.id"
                       @dismissed="showErrorFlash=false">
                {{errorMessage}}
              </b-alert>

              <b-alert variant="success"
                       dismissible
                       :show="showSuccessFlash && boughtItemId == item.id"
                       @dismissed="showSuccessFlash=false">
                {{successMessage}}
              </b-alert>
            </div>
          </div>
        </div>

        <div v-if="currentCategory == null">
          <img :src="'../assets/locations/cities/moon_light/craft_shop/bg.jpg'" alt="equipment" class="center background">
        </div>
      </div>
    </div>
  </div>
</template>

<script>
  import config from '../config.js'
  import axios from 'axios'

  export default {
    data: function () {
      return {
        categories: [],
        items: [],
        currentCategory: null,
        boughtItemId: null,
        resource_name: null,
        dismissSecs: 1,

        // flashes
        showErrorFlash: false,
        errorMessage: '',
        showSuccessFlash: false,
        successMessage: ''
      }
    },
    methods: {
      getCategoriesList: function() {
        axios.get('/tools/categories')
        .then(response => {
          this.categories = response.data
        })
        .catch(e => {
          console.log(e)
        })
      },
      showCategory: function(index) {
        this.currentCategory = index
        this.items = this.categories[index].items
      },
      buyItem: function(item_id) {
        this.boughtItemId = item_id

        this.showErrorFlash = false
        this.showSuccessFlash = false

        var link = '/equipment/items/' + item_id + '/buy'
        axios.patch(link)
        .then(response => {
          this.showSuccessFlash = true
          this.successMessage = 'Congrats! You have bought ' + response.data.name
        })
        .catch(e => {
          this.showErrorFlash = true
          this.errorMessage = e.response.data
        })
      },
      resolveCategoryClass: function(index) {
        if(this.currentCategory == index) {
          return 'active'
        }
      }
    },
    created: function() {
      this.getCategoriesList()
    }
  }
</script>
