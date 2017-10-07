<template>
  <div class="row top">
    <div class="top col-md-3 col-md-offset-1">
      <img v-bind:src="item.image"/>
    </div>

    <div class="col-md-6">
      <div class="level">[{{ item.required_skill }}]</div>

      <h3>{{ item.name }}</h3>
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
