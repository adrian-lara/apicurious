require 'rails_helper'

describe GithubUser do

  subject { GithubUser.new(User.new(user_name: 'adrian-lara', token: ENV["GITHUB_USER_TOKEN"])) }

  context "instance method" do
    context "#user_name" do
      it "returns the user name of that Github user" do
        VCR.use_cassette('token_base_call') do
          expect(subject.user_name).to eq('adrian-lara')
        end
      end
    end

    context "#full_name" do
      it "returns the full name of a Github user" do
        VCR.use_cassette('token_base_call') do
          expect(subject.full_name).to eq("Adrian Lara")
        end
      end
    end

    context "#image_url" do
      it "returns the image url of a Github user" do
        VCR.use_cassette('token_base_call') do
          expect(subject.image_url).to eq("https://avatars2.githubusercontent.com/u/30608004?v=4")
        end
      end
    end

    context "#bio" do
      it "returns the image url of a Github user" do
        VCR.use_cassette('token_base_call') do
          expect(subject.bio).to eq("Aspiring developer at Turing School of Software & Design")
        end
      end
    end

    context "#location" do
      it "returns the location of a github user" do
        VCR.use_cassette('token_base_call') do
          expect(subject.location).to eq("Denver, CO")
        end
      end
    end

    context "#blog_url" do
      it "returns the image url of a Github user" do
        VCR.use_cassette('token_base_call') do
          expect(subject.blog_url).to eq("https://www.linkedin.com/in/a-lara/")
        end
      end
    end

    context "#repos" do
      it "returns a collection of repositories of a Github user" do
        VCR.use_cassette("token_base_call") do
          subject.repos.each do |repo|
            expect(repo).to be_a GithubRepo
          end

          subject.repos.each do |repo|
            expect(repo).to be_a GithubRepo
          end

          expect(subject.repos.first.name).to eq("activerecord_exploration")
        end
      end
    end
  end

end
