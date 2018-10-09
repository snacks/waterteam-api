class CreateNotes < ActiveRecord::Migration[5.1]
  def change
    create_table :notes do |t|
      t.integer :device_id
      t.datetime :timestamp
      t.string :note

      t.timestamps
    end
  end
end
