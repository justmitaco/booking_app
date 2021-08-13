class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  validates :full_name, presence: true, length: {maximum: 50}
         
  has_many :rooms
  has_many :bookings
  
  attr_accessor :current_password
  
  has_one_attached :avatar
  
  mount_uploader :image, ImagesUploader
  
end
