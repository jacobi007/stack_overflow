class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_many :questions
  has_many :answers, through: :questions

  accepts_nested_attributes_for :answers

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

end
