class AddGazoToPicture < ActiveRecord::Migration
  def change
    add_column :pictures, :gazo, :string
  end
end
