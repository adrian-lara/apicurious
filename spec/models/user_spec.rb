require 'rails_helper'

RSpec.describe User do
  context "class method" do
    context ".return_by_omniauth(auth_data)" do
      it "creates a User instance according to authorization data" do
        user = User.return_by_omniauth(OmniAuth.config.mock_auth[:github])

        expect(user).to be_a User
        expect(user.user_name).to eq("adrian-lara")
        expect(user.token).to eq(ENV["GITHUB_USER_TOKEN"])
      end
    end
  end
end
