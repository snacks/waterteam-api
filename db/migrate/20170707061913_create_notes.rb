class CreateNotes < ActiveRecord::Migration[5.1]
  def change
    create_table :notes do |t|
      t.device_id :integer
      t.timestamp :datetime
      t.note :string

      t.timestamps
    end
  end
end
