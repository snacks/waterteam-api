class AddCreatorToAssociations < ActiveRecord::Migration[5.1]
  def change
    add_column :associations, :creator, :boolean
  end
end
