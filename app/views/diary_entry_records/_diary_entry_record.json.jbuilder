json.extract! diary_entry_record, :id, :title, :description, :post_time, :datetime, :created_at, :updated_at
json.url diary_entry_record_url(diary_entry_record, format: :json)
