require 'rails_helper'

describe GithubService do

  subject { GithubService.new('adrian-lara') }

  context "instance method" do
    context ".user_public_data" do
      it "returns hash" do
        VCR.use_cassette('base_user_info') do
          expect(subject.user_public_data).to be_a Hash
        end
      end
    end

  end

end
