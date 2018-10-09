class AddEmailToAssociations < ActiveRecord::Migration[5.1]
  def change
    add_column :associations, :email, :string
  end
end
