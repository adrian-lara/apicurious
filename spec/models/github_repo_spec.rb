require 'rails_helper'

describe GithubRepo do

  subject { GithubRepo.new(User.new(token: ENV["GITHUB_USER_TOKEN"])) }

  context "Class Method" do
    it ".retrieve_all()" do
      VCR.use_cassette("token_repo_call") do
        user = User.new(token: ENV["GITHUB_USER_TOKEN"])
        repos = GithubRepo.retrieve_all(user)

        repos.each do |repo|
          expect(repo).to be_a GithubRepo
        end

        expect(repos.first.name).to eq("activerecord_exploration")
      end
    end
  end
end
