class CreateDevices < ActiveRecord::Migration[5.1]
  def change
    create_table :devices do |t|
      t.string :uniqueIdentifier
      t.string :type
      t.double :latitude
      t.double :longitude

      t.timestamps
    end
  end
end
