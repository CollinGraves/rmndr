class ReminderDeliveryService

  def self.perform_job(params, deliver_to)
    @client = Twilio::REST::Client.new

    @client.messages.create(
      from: ENV['TWILIO_NUMBER'],
      to: deliver_to,
      body: params.body
    )
  end
end
