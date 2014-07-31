class Answer < ActiveRecord::Base
  after_save :update_answers_count
  belongs_to :question
  belongs_to :user
  validates_presence_of :body

  def update_answers_count
    if self.question.answers_count == 0
      self.question.update_attribute :answers_count, question.answers.count
    end
  end
end
