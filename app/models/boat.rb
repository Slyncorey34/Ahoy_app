class Boat < ActiveRecord::Base
  validates :name, uniqueness: true, on: :create
  validates :location, inclusion: {in: %w('Halifax', 'Havana', 'Jakarta', 'Los Angeles', 'Split')}
  # validates presence of array of locales [Jakarta, Havana, Split, Los Angeles, Halifax]
  belongs_to :user
  has_many :jobs, dependent: :destroy

  has_attached_file :avatar, :styles => { :thumb => "60x60>" }, :default_url => "/images/:style/missing.png" 
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/
  
end
