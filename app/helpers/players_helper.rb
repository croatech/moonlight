module PlayersHelper

  def progress_percents(full, part)
    if part
      percent = part.to_f / full.to_f * 100.0
      "#{percent}%"
    else
      '100%'
    end
  end
end
