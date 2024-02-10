class AddPicturePositioningToPosts < ActiveRecord::Migration[7.1]
  def change
    add_column :posts, :x_offset, :string
    add_column :posts, :y_offset, :string
    add_column :posts, :width, :string
    add_column :posts, :height, :float
  end
end
