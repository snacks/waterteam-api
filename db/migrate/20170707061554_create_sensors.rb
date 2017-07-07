class CreateSensors < ActiveRecord::Migration[5.1]
  def change
    create_table :sensors do |t|
      t.device_id :integer
      t.type :string
      t.status :string

      t.timestamps
    end
  end
end
