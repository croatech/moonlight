<template>
  <div class="gold">
    <img src="../../assets/gold.png" alt="gold">
    {{ player.gold }}
  </div>
</template>

<script>
  import { eventBus } from '../../application'

  export default {
    props: ['player'],
    created: function() {
      eventBus.$on('gold-decreased', (value) => {
        this.player.gold -= value
      })

      eventBus.$on('gold-increased', (value) => {
        this.player.gold += value
      })
    }
  }
</script>
