require 'rails_helper'

describe GithubUser do

  subject { GithubUser.new('adrian-lara') }

  context "instance method" do
    context "user_name" do
      it "has user_name" do
        expect(subject.user_name).to eq("adrian-lara")
      end
    end

    context "#full_name" do
      it "returns the full name of a Github user" do
        expect(subject.full_name). to eq("Adrian Lara")
      end
    end
  end
end
