<template>
 <div class="stats">
   <div v-for="stat in stats" :class="stat + ' stat'">
    <img :src="'../assets/' + stat + '.png'" :alt="stat">
      {{ player[stat] }}
      <a @click="incrementStat(stat)">+</a>
   </div>

   <div class="free-stats stat">
     Free stats:
     {{ player.free_stats }}
   </div>
 </div>
</template>

<script>
  import { eventBus } from '../../application'
  import config from '../../config'

  export default {
    props: ['player'],
    data: function() {
      return {
        stats: config.stats
      }
    },
    methods: {
      incrementStat: function(name) {
        console.log(name)
      }
    },
    created: function() {
      eventBus.$on('stat-was-incremented', (value) => {
        this.player.gold = this.player.gold - value
      })
    }
  }
</script>
