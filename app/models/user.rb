class User < ApplicationRecord
  acts_as_token_authenticatable
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  validates :name, :email, :password, presence: true

  #validates :is_admin, inclusion: {in: [true, false]}
  

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  has_one_attached :profile_pic

  has_many :favorites
  has_many :products, through: :favorites

end


