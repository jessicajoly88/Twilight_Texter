require 'rails_helper'

describe Message, :vcr => true do
  it "doesn't save the message if twilio gives a message" do
    message = Message.new(:body => 'hi', :to => '345234523452', :from => '342342342342')
    message.save.should be false
  end
end
