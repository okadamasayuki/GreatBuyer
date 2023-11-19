class AddShopToPosts < ActiveRecord::Migration[6.0]
  def change
    add_column :posts, :shop, :string
  end
end
