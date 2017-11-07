module CustomErrors
  extend ActiveSupport::Concern

  def not_found
    render plain: '404 Not found', status: :not_found
  end
end
