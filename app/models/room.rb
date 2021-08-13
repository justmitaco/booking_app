class Room < ApplicationRecord
    
  belongs_to :user
  has_many :bookings

  validates :name, presence: true
  validates :introduction, presence: true
  validates :price, numericality: true
  validates :image, presence: true
  validates :address, presence: true
  

  def self.search(search)
    if search
      Room.where(['address LIKE ? OR name LIKE ?', "%#{search}%", "%#{search}%"])
    else
      Room.all
    end
  end
  
  mount_uploader :image, ImagesUploader
  
end
