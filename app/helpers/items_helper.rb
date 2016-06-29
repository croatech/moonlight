module ItemsHelper 

  def check_for_active_tab(id, slug)
    'active' if id == slug
  end
end