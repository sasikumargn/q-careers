require 'rails_helper'

RSpec.describe Candidate, :type => :model do

  let(:candidate1) {FactoryGirl.create(:candidate, name: "Ram word", email: "ram@domain.com", candidatename: "ram1234", city: "Bangalore", state: "Karnataka")}
  let(:candidate2) {FactoryGirl.create(:candidate, name: "Lakshman", email: "lakshmanword@domain.com", candidatename: "lakshman1234", city: "Calicut", state: "Kerala")}
  let(:candidate3) {FactoryGirl.create(:candidate, name: "Sita", email: "sita@domain.com", candidatename: "sita1234word", city: "Mysore", state: "Karnataka")}

  context "Factory" do
    it "should validate all the candidate factories" do
      expect(FactoryGirl.build(:candidate).valid?).to be true
      expect(FactoryGirl.build(:inactive_candidate).valid?).to be true
      expect(FactoryGirl.build(:active_candidate).valid?).to be true
      expect(FactoryGirl.build(:suspended_candidate).valid?).to be true
      expect(FactoryGirl.build(:admin_candidate).valid?).to be true
      expect(FactoryGirl.build(:super_admin_candidate).valid?).to be true
    end
  end

  context "Validations" do
    it { should validate_presence_of :name }
    it { should allow_value('Krishnaprasad Varma').for(:name )}
    it { should_not allow_value('KP').for(:name )}
    it { should_not allow_value("x"*257).for(:name )}

    it { should validate_presence_of :email }
    it { should allow_value('something@domain.com').for(:email )}
    it { should_not allow_value('something domain.com').for(:email )}
    it { should_not allow_value('something.domain.com').for(:email )}
    it { should_not allow_value('ED').for(:email )}
    it { should_not allow_value("x"*257).for(:email )}

    it { should validate_presence_of :password }
    it { should allow_value('Password@1').for(:password )}
    it { should_not allow_value('password').for(:password )}
    it { should_not allow_value('password1').for(:password )}
    it { should_not allow_value('password@1').for(:password )}
    it { should_not allow_value('ED').for(:password )}
    it { should_not allow_value("a"*257).for(:password )}

    it { should validate_inclusion_of(:status).in_array(ConfigCenter::Candidate::STATUS_LIST)  }
  end

  context "Associations" do
    it { should belong_to(:designation) }
    it { should belong_to(:department) }
    it { should have_one(:profile_picture) }
  end

  context "Class Methods" do
    it "search" do
      arr = [candidate1, candidate2, candidate3]
      expect(Candidate.search("Ram")).to match_array([candidate1])
      expect(Candidate.search("Lakshman")).to match_array([candidate2])
      expect(Candidate.search("Sita")).to match_array([candidate3])
      expect(Candidate.search("word")).to match_array([candidate1, candidate2, candidate3])
      expect(Candidate.search("Karnataka")).to match_array([candidate1, candidate3])
    end

    it "find_by_email_or_candidatename" do
      arr = [candidate1, candidate2, candidate3]
      expect(Candidate.find_by_email_or_candidatename("ram@domain.com")).to eq(candidate1)
      expect(Candidate.find_by_email_or_candidatename("ram1234")).to eq(candidate1)
    end
  end

  context "Instance Methods" do
    it "display_designation" do
      u = FactoryGirl.build(:candidate, designation: FactoryGirl.build(:designation, title: "Some Designation"))
      expect(u.display_designation).to eq("Some Designation")

      u = FactoryGirl.build(:candidate, designation: FactoryGirl.build(:designation), designation_overridden: "Overidden Designation")
      expect(u.display_designation).to eq("Overidden Designation")
    end

    it "display_address" do
      u = FactoryGirl.build(:candidate, city: "Mysore", state: nil, country: nil)
      expect(u.display_address).to eq("Mysore")

      u = FactoryGirl.build(:candidate, city: "Mysore", state: "Karnataka", country: nil)
      expect(u.display_address).to eq("Mysore, Karnataka")

      u = FactoryGirl.build(:candidate, city: "Mysore", state: "Karnataka", country: "India")
      expect(u.display_address).to eq("Mysore, Karnataka, India")

      u = FactoryGirl.build(:candidate, city: nil, state: "Karnataka", country: nil)
      expect(u.display_address).to eq("Karnataka")
    end

    it "is_admin?" do
      u = FactoryGirl.build(:normal_candidate)
      expect(u.is_admin?).to be_falsy

      u = FactoryGirl.build(:admin_candidate)
      expect(u.is_admin?).to be_truthy

      u = FactoryGirl.build(:super_admin_candidate)
      expect(u.is_admin?).to be_truthy
    end

    it "is_super_admin?" do
      u = FactoryGirl.build(:normal_candidate)
      expect(u.is_super_admin?).to be_falsy

      u = FactoryGirl.build(:admin_candidate)
      expect(u.is_super_admin?).to be_falsy

      u = FactoryGirl.build(:super_admin_candidate)
      expect(u.is_super_admin?).to be_truthy
    end

    it "token_expired?" do
      token_created_at = Time.now - 30.minute
      u = FactoryGirl.build(:normal_candidate, token_created_at: token_created_at)
      expect(u.token_expired?).to be_truthy

      token_created_at = Time.now - 29.minute
      u = FactoryGirl.build(:normal_candidate, token_created_at: token_created_at)
      expect(u.token_expired?).to be_falsy
    end
  end

end