require 'rails_helper'

describe GithubService do

  subject { GithubService.new(User.new(token: ENV["GITHUB_USER_TOKEN"])) }

  context "instance method" do
    context "#user_public_data" do
      it "returns hash" do
        VCR.use_cassette('token_base_call') do
          expect(subject.user_basic_data).to be_a Hash
        end
      end
    end

    context "#full_name" do
      it "returns a user's full_name" do
        VCR.use_cassette('token_base_call') do
          expect(subject.full_name).to eq("Adrian Lara")
        end
      end
    end

    context "#image_url" do
      it "returns a user's image url" do
        VCR.use_cassette('token_base_call') do
          expect(subject.image_url).to eq("https://avatars2.githubusercontent.com/u/30608004?v=4")
        end
      end
    end

    context "#bio" do
      it "returns a user's bio" do
        VCR.use_cassette('token_base_call') do
          expect(subject.bio).to eq("Aspiring developer at Turing School of Software & Design")
        end
      end
    end

    context "#location" do
      it "returns a user's location" do
        VCR.use_cassette('token_base_call') do
          expect(subject.location).to eq("Denver, CO")
        end
      end
    end

    context "#blog_url" do
      it "returns a user's blog url" do
        VCR.use_cassette('token_base_call') do
          expect(subject.blog_url).to eq("https://www.linkedin.com/in/a-lara/")
        end
      end
    end
  end
end
