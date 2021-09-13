require "application_system_test_case"

class DiaryEntryRecordsTest < ApplicationSystemTestCase
  setup do
    @diary_entry_record = diary_entry_records(:one)
  end

  test "visiting the index" do
    visit diary_entry_records_url
    assert_selector "h1", text: "Diary Entry Records"
  end

  test "creating a Diary entry record" do
    visit diary_entry_records_url
    click_on "New Diary Entry Record"

    fill_in "Datetime", with: @diary_entry_record.datetime
    fill_in "Description", with: @diary_entry_record.description
    fill_in "Post time", with: @diary_entry_record.post_time
    fill_in "Title", with: @diary_entry_record.title
    click_on "Create Diary entry record"

    assert_text "Diary entry record was successfully created"
    click_on "Back"
  end

  test "updating a Diary entry record" do
    visit diary_entry_records_url
    click_on "Edit", match: :first

    fill_in "Datetime", with: @diary_entry_record.datetime
    fill_in "Description", with: @diary_entry_record.description
    fill_in "Post time", with: @diary_entry_record.post_time
    fill_in "Title", with: @diary_entry_record.title
    click_on "Update Diary entry record"

    assert_text "Diary entry record was successfully updated"
    click_on "Back"
  end

  test "destroying a Diary entry record" do
    visit diary_entry_records_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Diary entry record was successfully destroyed"
  end
end
