class AddImageToPosts < ActiveRecord::Migration[5.1]
  def change
    add_column :posts, :image_file_name, :string
	def self.up
	  add_attachment :posts, :image
	end

	def self.down
	  remove_attachment :posts, :image
	end
  end
end
