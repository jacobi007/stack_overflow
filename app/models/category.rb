class Category < ActiveRecord::Base
  has_many :questions, counter_cache: true

end
