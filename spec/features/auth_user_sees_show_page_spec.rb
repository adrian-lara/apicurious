require 'rails_helper'

describe "When a user logs in" do
  it "they are redirected to their show page" do
    visit root_path
    click_link "Login"

    expect(current_path).to eq(root_path)
    expect(User.last.uid).to eq("1337")
    expect(User.last.user_name).to eq("adrian-lara")
    expect(User.last.token).to eq("1234")
    expect(page).not_to have_link("Login")
    expect(page).to have_content("adrian-lara")
    
    expect(page).to have_content("Adrian Lara")
  end
end
