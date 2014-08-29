require 'rails_helper'



RSpec.describe Users, :type => :model do
  it 'is invalid without a first name' do
    unamed = Users.new(last_name: "Wizard")
    expect(unamed).to be_invalid  
  end
end