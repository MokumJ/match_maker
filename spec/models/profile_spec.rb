require 'rails_helper'

RSpec.describe Profile, type: :model do
      describe "#full_name" do
        it "is composed of first and last name" do
          profile = build(:profile, first_name: "robin", last_name: "hood", role: 'admin')
          expect(profile.full_name).to eq "robin hood"
        end
      end
      describe "role" do
        it "has a role" do
          profile = build(:profile, first_name: "robin", last_name: "hood", role: 'admin')
          expect(profile.role).to eq "admin"
        end
      end


      it "is not valid without a first_name" do
        subject.first_name = nil
        expect(subject).to_not be_valid
      end

      it "is not valid without a last_name" do
        subject.last_name = nil
        expect(subject).to_not be_valid
      end
    end
