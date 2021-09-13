class CreateDiaryEntryRecords < ActiveRecord::Migration[6.1]
  def change
    create_table :diary_entry_records do |t|
      t.string :title
      t.text :description
      t.string :post_time
      t.string :datetime

      t.timestamps
    end
  end
end
