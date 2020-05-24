# coding: utf-8

Given /^The URL form is presented in the homepage$/ do
  visit root_path
  expect(page).to have_content("Welcome to this super cool URL shortener!!")
end

When(/^The user complets the form with a valid URL$/) do
  fill_in('url_original_url', with: 'https://www.debian.org/')
  click_button 'Create Url'
end

Then(/^The successfully message should be showed$/) do
  expect(page).to have_content("URL created successfully")
end
