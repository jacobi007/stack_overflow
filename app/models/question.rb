class Question < ActiveRecord::Base
  belongs_to :user
  has_many :answers, counter_cache: true
  belongs_to :category

end
