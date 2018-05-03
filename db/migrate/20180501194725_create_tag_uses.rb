class CreateTagUses < ActiveRecord::Migration[5.1]
  def change
    create_table :tag_uses do |t|

      t.timestamps
    end
  end
end
