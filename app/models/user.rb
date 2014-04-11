require 'pry'

class User < ActiveRecord::Base
  has_many :tags
  has_many :likes

  has_secure_password
  validates_uniqueness_of :email
  has_many :uploads

  has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "40x40>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/

  def recommend

    array = []
    self.likes.each do |like|
      Like.where(upload_id: like.upload_id).each do |like2|
        if like2.user_id != self.id
          array << like2.user_id
        end
      end
    end
    array
    hash = Hash.new(0)
    freq = array.inject(Hash.new(0)) { |h,v| h[v] += 1; h }
    that_user_id = array.max_by { |v| freq[v] }
    his_photo_array = []


    self.likes.each do |mylike|
      User.find(that_user_id).likes.each do |hislike|
        if hislike.upload_id != mylike.upload_id
          his_photo_array << hislike.upload_id
        end
        binding.pry
      end

      his_photo_array

    end




    # Like.all.each do |like|
      # defined?("@a#{like.user_id}")
      # instance_variable_set("@a#{like.user_id}", [like.upload_id])
    # end

  end

  def tagged
    return_array = []
    self.tags.each do |tag|
      Upload.all.each do |upload|
        if tag.upload_id == upload.id
          return_array << upload
        end
      end
    end
    return_array
  end


end
