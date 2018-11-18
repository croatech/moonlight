module Generators::Players
  def self.call
    params = { email: 'croaton6@gmail.com', password: 'password', username: 'Croaton' }
    Users::CreateService.call(params: params)
  end
end
