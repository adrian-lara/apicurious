require 'rails_helper'

describe "When a user logs in" do
  it "they are redirected to their own show page and see their basic public information" do
    VCR.use_cassette('base_user_info') do
      visit root_path
      click_link "Login"

      expect(current_path).to eq(user_path(User.last.user_name))
      expect(User.last.uid).to eq("1337")
      expect(User.last.user_name).to eq("adrian-lara")
      expect(User.last.token).to eq("1234")
      expect(page).not_to have_link("Login")
      expect(page).to have_content("adrian-lara")

      expect(page).to have_content("Adrian Lara")
      expect(page).to have_css("img[src='https://avatars2.githubusercontent.com/u/30608004?v=4']")
      expect(page).to have_content("Aspiring developer at Turing School of Software & Design")
      expect(page).to have_content("Denver, CO")
      expect(page).to have_link("https://www.linkedin.com/in/a-lara/")
    end
  end
end
