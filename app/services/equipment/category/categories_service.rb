module Equipment::Category::CategoriesService
  class << self
    def all
      set_array_if_categories_key_is_empty
      $redis.smembers('equipment_categories')
    end

    private

    def set_array_if_categories_key_is_empty
      if $redis.smembers('equipment_categories').empty?
        $redis.sadd('equipment_categories', Equipment::Category.pluck(:name))
      end
    end
  end
end