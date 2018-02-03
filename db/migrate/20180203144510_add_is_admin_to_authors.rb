class AddIsAdminToAuthors < ActiveRecord::Migration[5.1]
  def change
    add_column :authors, :is_admin, :boolean
  end
end
