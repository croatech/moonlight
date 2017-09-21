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
  import axios from 'axios'

  export default {
    props: ['player'],
    data: function() {
      return {
        stats: config.stats
      }
    },
    methods: {
      incrementStat: function(stat_name) {
        var link = '/player/stats/' + stat_name + '/increase'
        axios.patch(link)
        .then(response => {
          player[stat_name] = player[stat_name] + 1
          player[free_stats] = player[free_stats] - 1
          console.log(response)
        })
        .catch(e => {
          console.log(e)
        })
      }
    },
    created: function() {
      eventBus.$on('stat-was-incremented', (value) => {
        this.player.gold = this.player.gold - value
      })
    }
  }
</script>
