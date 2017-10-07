<template>
  <div class="row top">
    <div class="col-md-3">
      <img v-bind:src="item.image"/>
    </div>

    <div class="col-md-9">
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

  export default {
    props: ['item'],
    data: function() {
      return {
        stats: config.stats
      }
    }
  }
</script>
