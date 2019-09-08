# typed: true
require 'settingslogic'

class Settings < Settingslogic
  source './config/application.yml'

  namespace Rails.env
end
