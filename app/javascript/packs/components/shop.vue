<template>
  <div class="shop">
    <div class="item-categories">
      <div class="col-md-3">
        <div class="category" v-for="(category, i) in categories">
          <a @click="showCategory(i)" class="category-btn btn btn-default">{{category.name}}</a>
        </div>
      </div>
      <div class="col-md-9">
        <div class="items" v-if="currentCategory != null">
          <div class="item row" v-for="item in items">
            <div class="col-md-3">
              <img v-bind:src="item.image"/>
            </div>
            <div class="col-md-9">
              <div class="level">[{{item.required_level}}]</div>
              <h3>{{item.name}}</h3>
              <div v-for="stat in stats" :class="stat + ' stat'">
                <img :src="'../assets/' + stat + '.png'" :alt="stat">
                {{item[stat]}}
              </div>
              <a @click="buyItem(item.id)" class="buy-button btn btn-success">
                Buy for {{item.price}} gold
              </a>
            </div>
          </div>
        </div>
        <div v-if="currentCategory == null">
          <img src="../assets/locations/cities/moon_light/weapon_shop/bg.jpg" alt="equipment" class="center background">
        </div>
      </div>
    </div>
  </div>
</template>

<script>
  import config from '../config.js'

  export default {
    data: function () {
      return {
        categories: [],
        items: [],
        currentCategory: null,
        stats: config.stats
      }
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
        this.$http.patch(link).then(response => {
          console.log(response)
        }, response => {
          console.log(response)
        });
      }
    },
    mounted: function() {
      this.getCategoriesList()
    }
  }
</script>
