require 'spec_helper'
require 'pry'

describe User do
  it{ should have_many :tags }
  it{ should have_many :uploads}
  it{ should have_many :likes}
end

describe '#recommend' do
  it 'return user_id of the person who shares the most number of th common like photos' do
    new_user = User.create(name: "bob", email: "bob1@gmail.com", password: "pop", password_confirmation: "pop")
    like1 = Like.create(user_id: new_user.id, upload_id: 2)
    like2 = Like.create(user_id: new_user.id, upload_id: 3)
    like3 = Like.create(user_id: 1, upload_id: 2)
    like4 = Like.create(user_id: 1, upload_id: 4)
    like5 = Like.create(user_id: 2, upload_id: 2)
    like6 = Like.create(user_id: 2, upload_id: 3)
    like7 = Like.create(user_id: 2, upload_id: 4)
    new_user.recommend.should eq 2
  end
end

