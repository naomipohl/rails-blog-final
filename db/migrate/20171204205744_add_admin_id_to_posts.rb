class AddAdminIdToPosts < ActiveRecord::Migration[5.1]
  def change
    add_column :posts, :admin_id, :integer
  end
end
