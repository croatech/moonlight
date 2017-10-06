<template>
  <div class="profile">
    <div class="player-name">
      <%= @player.name %>
      <strong>
        <%= "[#{@player.level}]" %>
      </strong>
      <%= link_to fa_icon("external-link"), player_path(id: @player.name) %>
    </div>
  </div>
</template>

<script>
  import axios from 'axios'

  export default {
    props: ['player']
  }
</script>
