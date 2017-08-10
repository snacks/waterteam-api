class CreateDevices < ActiveRecord::Migration[5.1]
  def change
    create_table :devices do |t|
      t.string :uniqueIdentifier
      t.string :type
      t.decimal :latitude
      t.decimal :longitude

      t.timestamps
    end
  end
end
