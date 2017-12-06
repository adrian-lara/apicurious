require 'rails_helper'

describe "When a user logs in" do
  it "they are redirected to their show page" do
    visit root_path
    click_link "Login"

    expect(current_path).to eq(root_path)
    expect(page).not_to have_link("Login")
    expect(page).to have_content("Adrian Lara")
    expect(page).to have_content("adrian-lara")
  end
end
