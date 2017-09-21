<template>
  <div class="gold">
    <img :src="'../assets/players/gold.png'" alt="gold">
    <p>{{ gold }}</p>
  </div>
</template>

<script>
  import { eventBus } from '../../application'

  export default {
    props: ['gold'],
    created: function() {
      eventBus.$on('gold-changed', (value) => {
        var newGold = this.gold - value
        this.gold = newGold
      })
    }
  }
</script>
