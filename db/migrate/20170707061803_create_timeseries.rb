class CreateTimeseries < ActiveRecord::Migration[5.1]
  def change
    create_table :timeseries do |t|
      t.sensor_id :integer
      t.timestamp :datetime
      t.data :double

      t.timestamps
    end
  end
end
