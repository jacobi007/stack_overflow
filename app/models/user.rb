class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_many :questions
  has_many :answers, through: :questions

  has_attached_file :avatar, :styles => { :topka => "40x40>", :thumb => "80x80>", :profile => "170x170>" },
   :default_url => "http://lorempixel.com/120/80/abstract/"
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/


  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

end
