class AddPostPicToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :post_pic, :string
  end
end
