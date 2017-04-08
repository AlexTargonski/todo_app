require 'rails_helper'

describe User  do
  it 'validations' do
    user = FactoryGirl.create(:user) 
    user.full_name.should == "Example User" 
  end
end