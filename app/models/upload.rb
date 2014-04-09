class Upload < ActiveRecord::Base
  belongs_to :user

  has_attached_file :photo, :styles => { :large => "600x600>", :small => "200x200>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :photo, :content_type => /\Aimage\/.*\Z/


end
