require 'rails_helper'

describe "When a logged in user is on their dashboard, clicks 'Create New Repository', fills in a repo name, and submits" do
  it "they are redirected back to their dashboard and they can see the newly created repository" do
    VCR.use_cassette("create_repo_call") do
      visit github_login_path

      click_link "Create New Repository"

      expect(current_path).to eq(new_repository_path)

      fill_in "repository[name]", with: "Test_Repo_1337"
      click_on "Submit"

      expect(current_path).to eq(dashboard_path)
      expect(page).to have_content("Test_Repo_1337")
    end
  end
end
