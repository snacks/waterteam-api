class CreateTimeseries < ActiveRecord::Migration[5.1]
  def change
    create_table :timeseries do |t|
      t.integer :sensor_id
      t.datetime :timestamp
      t.decimal :data

      t.timestamps
    end
  end
end
