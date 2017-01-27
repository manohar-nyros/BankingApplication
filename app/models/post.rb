class Post < ActiveRecord::Base
	has_many :comments, dependent: :destroy
		has_many :reviews, dependent: :destroy
		has_many :bookings, dependent: :destroy
	#validates_presence_of :title,:description
	 has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/
end