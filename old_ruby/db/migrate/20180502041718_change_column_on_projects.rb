class ChangeColumnOnProjects < ActiveRecord::Migration[5.1]
  def change
    change_column :projects, :creator_id, :integer, null: false
  end
end
