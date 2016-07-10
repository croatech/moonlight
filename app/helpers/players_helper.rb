module PlayersHelper

  def progress_percents(full, part)
    if part
      percent = part.to_f / full.to_f * 100.0
      "#{percent}%"
    else
      '100%'
    end
  end

  def check_for_active_avatar(avatar_id, player_id)
    'active' if avatar_id == player_id
  end
end
