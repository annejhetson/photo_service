require 'spec_helper'

describe Tag do
  it { should belong_to :user }
  it { should belong_to :upload}

  describe '#check_dup' do
    it 'should check for a duplicate user-photo combination' do
      tag1 = Tag.create(user_id: 1, upload_id: 2)
      tag2 = Tag.create(user_id: 1, upload_id: 2)
      tag3 = Tag.create(user_id: 1, upload_id: 3)
      tag4 = Tag.create(user_id: 2, upload_id: 2)
      Tag.all.should eq [tag1, tag3, tag4]

    end
  end
end

