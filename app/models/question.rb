class Question < ActiveRecord::Base
  belongs_to :user
  has_many :answers, counter_cache: true
  belongs_to :category

  def has_accepted_answer?
    accepted = false
    self.answers.each do |ans|
      if ans.accepted
        accepted = true
        return accepted
      end
    end
    return accepted
  end

end
