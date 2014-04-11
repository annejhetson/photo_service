class Tag < ActiveRecord::Base
  belongs_to :user
  belongs_to :upload

  after_save :check_dup


  private

    def check_dup
      same = Tag.all.select { |tag| self.upload_id == tag.upload_id && self.user_id == tag.user_id && self.id != tag.id}
      if same.length > 0
        Tag.all.last.destroy
      end
    end
end
