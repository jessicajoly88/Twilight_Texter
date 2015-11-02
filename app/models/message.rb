class Message < ActiveRecord::Base
  before_create :send_message

private

  def send_message
    response = RestClient::Request.new(
      :method => :post,
      :url => 'https://api.twilio.com/2010-04-01/Accounts/AC9bdc6a2d8af5573fc836c3fa2a7fcf34/Messages.json',
      :user => ENV['TWILIO_ACCOUNT_SID'],
      :password => ENV['TWILIO_AUTH_TOKEN'],
      :payload => { :Body => body,
                    :To => to,
                    :From => from }
    ).execute
  rescue => error
    message = JSON.parse(error.response)['message']
    errors.add(:base, message)
    false
  end
end
