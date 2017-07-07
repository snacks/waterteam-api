class CreateDeployments < ActiveRecord::Migration[5.1]
  def change
    create_table :deployments do |t|
      t.name :string

      t.timestamps
    end
  end
end
