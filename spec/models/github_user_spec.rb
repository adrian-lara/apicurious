require 'rails_helper'

describe GithubUser do

  subject { GithubUser.new('adrian-lara') }

  context "instance method" do
    context "#user_name" do
      it "has user_name" do
        expect(subject.user_name).to eq("adrian-lara")
      end
    end

    context "#full_name" do
      it "returns the full name of a Github user" do
        VCR.use_cassette('base_user_info') do
          expect(subject.full_name).to eq("Adrian Lara")
        end
      end
    end

    context "#image_url" do
      it "returns the image url of a Github user" do
        VCR.use_cassette('base_user_info') do
          expect(subject.image_url).to eq("https://avatars2.githubusercontent.com/u/30608004?v=4")
        end
      end
    end
  end

end
