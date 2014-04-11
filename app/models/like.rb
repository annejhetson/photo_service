class Like < ActiveRecord::Base

  belongs_to :user
  belongs_to :upload

  after_save :check_dup


  private

    def check_dup
      same = Like.all.select { |like| self.upload_id == like.upload_id && self.user_id == like.user_id && self.id != like.id}
      if same.length > 0
        Like.all.last.destroy
      end
    end
end
