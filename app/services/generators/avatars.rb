module Generators::Avatars
  def self.call
    Dir.glob("app/assets/images/players/avatars/*.jpg").sort.each do |file|
      Avatar.create(image: File.new(file, "r"), private: false)
    end
  end
end
