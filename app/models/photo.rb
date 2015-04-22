class Photo < ActiveRecord::Base

  has_many :comments
  belongs_to  :user

  validates_presence_of :title

  has_attached_file :pic, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :pic, :content_type => /\Aimage\/.*\Z/
end
