# Preview all emails at http://localhost:3000/rails/mailers/citizen_mailer
class CitizenMailerPreview < ActionMailer::Preview
  def welcome_email
    CitizenMailer.welcome_email(Citizen.last)
  end

  def update_email
    CitizenMailer.update_email(Citizen.last)
  end
end
