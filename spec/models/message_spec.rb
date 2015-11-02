require 'rails_helper'

describe Message, :vcr => true do
  it "doesn't save the message if twilio gives a message" do
    message = Message.new(:body => 'hi', :to => '1111111', :from => '5038502078')
    message.save.should be false
  end
end

describe Message, :vcr => true do
  it 'adds an error if the to number is invalid' do
    message = Message.new(:body => 'hi', :to => '1111111', :from => '5038502078')
    message.save
    message.errors.messages[:base].should eq ["The 'To' number 1111111 is not a valid phone number."]
  end
end
