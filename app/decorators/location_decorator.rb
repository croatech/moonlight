class LocationDecorator < Draper::Decorator
  delegate_all


  def background_image
    h.image_tag "locations/wayward_pines/cells-bg/#{self.name}.jpg", class: 'center'
  end
end
