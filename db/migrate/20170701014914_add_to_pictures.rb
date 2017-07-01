class AddToPictures < ActiveRecord::Migration
  def change
    add_column :pictures,:user_name,:string

  end
end
