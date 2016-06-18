module PlayersHelper

  def progress_percents(full, part)
    percent = part.to_f / full.to_f * 100.0
    "#{percent}%"
  end
end
