# == Schema Information
#
# Table name: consultorios
#
#  id         :integer         not null, primary key
#  name       :string(255)
#  created_at :datetime        not null
#  updated_at :datetime        not null
#

require 'spec_helper'

describe Consultorio do
  
  before { @consultorio = Consultorio.new( name: "@ElBuenConsultorio") }
  
  subject { @consultorio }
  
  describe "when consultorio is valid" do
    it { should respond_to(:name) }
    
    it { should be_valid }
  end
  
  describe "when name is not present" do
    before { @consultorio.name = " " }
    
    it { should_not be_valid }
  end
  
  describe "when name is too long" do
    before { @consultorio.name = "a" * 61 }
    
    it { should_not be_valid }
  end
  
  describe "when name is already taken" do
    before do
      consultorio_with_same_name = @consultorio.dup
      #consultorio_with_same_name.name = @consultorio.name.upcase
      # creates a consultorio with the same name in upcase
      consultorio_with_same_name.save
    end
    
    it { should_not be_valid }
  end
end
