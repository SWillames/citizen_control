class SendNotificationWelcome
  def initialize(citizen)
    @citizen = citizen
  end

  def execute
    send_email(@citizen)
  end

  def send_email(citizen)
    CitizenMailer.welcome_email(citizen).deliver
  end

  #def send_sms(@citizen)

  #end
end