require 'rails_helper'

describe GithubRepoService do

  context "Class Method" do
    context ".retrieve_all()" do
      it "returns a collection of hashes of github repository information" do
        VCR.use_cassette("token_repo_call") do
          user = User.new(token: ENV["GITHUB_USER_TOKEN"])
          repos_information = GithubRepoService.retrieve_all(user)

          repos_information.each do |info|
            expect(info).to be_a Hash
          end
          expect(repos_information.count).to eq(30)
          expect(repos_information.first["name"]).to eq("activerecord_exploration")
        end
      end
    end
  end
end
