require "test_helper"

class DiaryEntryRecordsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @diary_entry_record = diary_entry_records(:one)
  end

  test "should get index" do
    get diary_entry_records_url
    assert_response :success
  end

  test "should get new" do
    get new_diary_entry_record_url
    assert_response :success
  end

  test "should create diary_entry_record" do
    assert_difference('DiaryEntryRecord.count') do
      post diary_entry_records_url, params: { diary_entry_record: { datetime: @diary_entry_record.datetime, description: @diary_entry_record.description, post_time: @diary_entry_record.post_time, title: @diary_entry_record.title } }
    end

    assert_redirected_to diary_entry_record_url(DiaryEntryRecord.last)
  end

  test "should show diary_entry_record" do
    get diary_entry_record_url(@diary_entry_record)
    assert_response :success
  end

  test "should get edit" do
    get edit_diary_entry_record_url(@diary_entry_record)
    assert_response :success
  end

  test "should update diary_entry_record" do
    patch diary_entry_record_url(@diary_entry_record), params: { diary_entry_record: { datetime: @diary_entry_record.datetime, description: @diary_entry_record.description, post_time: @diary_entry_record.post_time, title: @diary_entry_record.title } }
    assert_redirected_to diary_entry_record_url(@diary_entry_record)
  end

  test "should destroy diary_entry_record" do
    assert_difference('DiaryEntryRecord.count', -1) do
      delete diary_entry_record_url(@diary_entry_record)
    end

    assert_redirected_to diary_entry_records_url
  end
end
