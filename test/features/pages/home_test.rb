require "test_helper"

feature "Pages::Home Minimal Verbiage Expectation" do
  scenario "Visit Home Page: Must Have Site Name and Links" do
    visit root_path
    page.must_have_content "Stock-Scan"
    page.must_have_content "About"
    page.must_have_content "Examples"
    page.must_have_content "Contact"
  end

  scenario 'Visti Home Page, Click on About' do
    visit root_path
    click_link 'About'
    page.must_have_content 'Market Breadth'
    page.must_have_content 'Vehicle Selection'
  end

  scenario 'Visit Home Page, Click on Contact' do
    visit root_path
    click_link 'Contact'
    page.must_have_content 'email'
    page.must_have_content 'github'
  end

  scenario 'Home Page has Tally of All Time High Stocks' do
    visit root_path
    page.must_have_content "All-Time-Highs"
    # page.must_have_content "2"
  end

  scenario 'Home Page has Tally of All Time Low' do
    visit root_path
    page.must_have_content 'All-Time-Lows'
    # page.must_have_content '3'
  end

  scenario 'Home Page has Tally of New Highs' do
    visit root_path
    page.must_have_content 'New Highs'
  end

  scenario 'Home Page has Tally of New Lows' do
    visit root_path
    page.must_have_content 'New Lows'
  end
end
