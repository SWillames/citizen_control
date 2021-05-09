class SendNotificationWelcome
  def initialize(citizen)
    @citizen = citizen
  end

  def execute
    send_email(@citizen)
  end

  protected
  def send_email(citizen)
    CitizenMailer.welcome_email(citizen).deliver
  end

end