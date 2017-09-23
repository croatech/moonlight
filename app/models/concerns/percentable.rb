module Percentable
  def try_chance(percent:)
    i = 100
    result = i / percent
    1 == rand(1..result)
  end
end
