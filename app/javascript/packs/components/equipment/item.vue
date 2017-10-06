<template>
  <div class="row">
    <div class="col-md-3 col-md-offset-1">
      <img v-bind:src="item.image"/>
    </div>

    <div class="col-md-6">
      <div class="level">[{{ item.required_level }}]</div>

      <h3>{{ item.name }}</h3>

      <div v-for="stat in stats" :class="stat + ' stat'">
        <img :src="'../assets/' + stat + '.png'" :alt="stat">
        {{ item[stat] }}
      </div>
    </div>
  </div>
</template>

<script>
  import config from '../../config'
  import axios from 'axios'

  export default {
    props: ['item'],
    data: function() {
      return {
        stats: config.stats
      }
    }
  }
</script>
