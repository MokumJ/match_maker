require 'rails_helper'

RSpec.describe Profile, type: :model do
    subject { described_class.new(first_name: "Robin", last_name: "Doe") }



      it "is not valid without a first_name" do
        subject.first_name = nil
        expect(subject).to_not be_valid
      end

      it "is not valid without a last_name" do
        subject.last_name = nil
        expect(subject).to_not be_valid
      end
    end
  
