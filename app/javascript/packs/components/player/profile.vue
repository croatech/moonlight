<template>
  <div class="profile">
    <div class="player-name">
      {{ player.name }}
      <strong>
        [{{ player.level }}]
      </strong>
      <a :href="'/players/' + player.name"><i class="fa fa-external-link"></i></a>
    </div>
  </div>


</template>

<script>
  import axios from 'axios'

  export default {
    props: ['player']
  }
</script>
