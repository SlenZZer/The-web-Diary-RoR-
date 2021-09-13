class AddUserIdToDiaryEntryRecords < ActiveRecord::Migration[6.1]
  def change
    add_column :diary_entry_records, :user_id, :integer
    add_index :diary_entry_records, :user_id
  end
end
