<template>
  <div class="row top">
    <div class="col-md-3">
      <img v-bind:src="item.image"/>
    </div>

    <div class="col-md-9">
      <div class="level">[{{ item.required_skill }}]</div>

      <h3>{{ item.name }}</h3>
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
