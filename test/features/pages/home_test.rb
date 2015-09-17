require "test_helper"

feature "Pages::Home Minimal Verbiage Expectation" do
  scenario "Visit Home Page: Must Have Site Name and Links" do
    visit root_path
    page.must_have_content "Stock-Scan"
    page.must_have_content "About"
    page.must_have_content "Examples"
    page.must_have_content "Contact"
  end
end
