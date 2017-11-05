<template>
  <div class="container">
    <div class="round">
      <%= form_for fight_round_path(round_id: params[:round_id]), method: :put do |f| %>
      <div class="row">
        <div class="col-md-6">
          <div class="character player">
            <div class="progress">
              <div aria-valuemax="100" aria-valuemin="0" aria-valuenow="80" class="progress-bar progress-bar-danger" role="progressbar" style="width: <%= progress_percents(@player.hp, @round.player_hp) %>">
                <span class="sr-only">80% Complete (danger)</span>
                <%= "#{@round.player_hp} HP" %>
              </div>
            </div>
            <div class="progress">
              <div aria-valuemax="100" aria-valuemin="0" aria-valuenow="20" class="progress-bar progress-bar-info" role="progressbar" style="width: 100%">
                <span class="sr-only">20% Complete</span>
                1 MP
              </div>
            </div>
            <%= image_tag @player.avatar.url, class: 'image' %>
            <div class="points">
              <h4 class="block-title">Defense:</h4>
              <% @points.each do |point_name| %>
              <div class="button">
                <%= f.label point_name %>
                <%= f.radio_button 'defense', point_name, checked: true %>
              </div>
              <% end %>
            </div>
          </div>
        </div>
        <div class="col-md-6">
          <div class="character bot">
            <div class="progress">
              <div aria-valuemax="100" aria-valuemin="0" aria-valuenow="80" class="progress-bar progress-bar-danger" role="progressbar" style="width: <%= progress_percents(@bot.hp, @round.bot_hp) %>">
                <span class="sr-only">80% Complete (danger)</span>
                <%= "#{@round.bot_hp} HP" %>
              </div>
            </div>
            <div class="progress">
              <div aria-valuemax="100" aria-valuemin="0" aria-valuenow="20" class="progress-bar progress-bar-info" role="progressbar" style="width: 100%">
                <span class="sr-only">20% Complete</span>
                1 MP
              </div>
            </div>
            <div class="points">
              <h4 class="block-title">Attack:</h4>
              <% @points.each do |point_name| %>
              <div class="button">
                <%= f.label point_name %>
                <%= f.radio_button 'attack', point_name, checked: true %>
              </div>
              <% end %>
            </div>
            <%= image_tag @bot.avatar.url, class: 'image' %>
          </div>
        </div>
      </div>
      <div class="row">
        <%= f.submit 'HIT', class: 'btn btn-danger center' %>
      </div>
      <% end %>
      <div class="rounds">
        <% @rounds.each do |round| %>
        <hr/>
        <div class="damage">
          <p>
            <%= "#{@player.name} has dealt" %>
            <span>
              <%= "#{round.player_damage}" %>
            </span>
            <%= "to #{@bot.name}." %>
          </p>
        </div>
        <div class="damage">
          <p>
            <%= "#{@bot.name} has dealt" %>
            <span>
              <%= "#{round.bot_damage}" %>
            </span>
            <%= "to #{@player.name}." %>
          </p>
        </div>
        <hr/>
        <% end %>
      </div>
    </div>
  </div>

</template>

<script>
  import axios from 'axios'

  export default {
    data: function() {
      return {
        fight: null,
        player: null,
        bot: null
      }
    },
    methods: {
      getFight: function() {
        axios.get('/fight')
        .then(response => {
          this.fight = response.data
          console.log(response)
        })
        .catch(e => {
          console.log(e)
        })
      }
    },
    created: function() {
      this.getFight()
    }
  }
</script>
