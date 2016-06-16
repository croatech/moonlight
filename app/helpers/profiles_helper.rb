module ProfilesHelper

  def progress_percents(all, part)
    percent = part.to_f / all.to_f * 100.0
    "#{percent}%"
  end
end
