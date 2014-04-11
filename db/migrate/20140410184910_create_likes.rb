class CreateLikes < ActiveRecord::Migration
  def change
    create_table :likes do |t|
      t.column :user_id, :int
      t.column :upload_id, :int
    end
  end
end
