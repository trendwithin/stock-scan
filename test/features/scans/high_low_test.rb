require "test_helper"

feature "Scans::HighLow" do
  scenario "Page Displays Proper Heading" do
    visit scans_high_low_path
    page.must_have_content "Current New Highs/NewLows"
  end

  scenario "Scans Displays Titles" do
    visit scans_high_low_path
    page.must_have_content 'One Month High'
    page.must_have_content 'One Month Low'
    page.must_have_content 'Three Month High'
    page.must_have_content 'Three Month Low'
    page.must_have_content 'Six Month High'
    page.must_have_content 'Six Month Low'
    page.must_have_content 'Twelve Month High'
    page.must_have_content 'Twelve Month Low'
    page.must_have_content 'YTD High'
    page.must_have_content 'YTD Low'
  end

  scenario "Scans Displays Expected Values for New Highs and Lows" do
    visit scans_high_low_path
    page.must_have_content "150"
    page.must_have_content "45"
    page.must_have_content "300"
    page.must_have_content "90"
    page.must_have_content "600"
    page.must_have_content "180"
    page.must_have_content "1200"
    page.must_have_content "360"
    page.must_have_content "100"
    page.must_have_content "50"
    save_and_open_page
  end
end
