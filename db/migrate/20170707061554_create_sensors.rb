class CreateSensors < ActiveRecord::Migration[5.1]
  def change
    create_table :sensors do |t|
      t.integer :device_id
      t.string :type
      t.string :status

      t.timestamps
    end
  end
end
