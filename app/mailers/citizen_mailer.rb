class CitizenMailer < ApplicationMailer
  def welcome_email(citizen)
    @citizen = citizen
    mail(
      to: @citizen.email,
      subject: "Seja bem-vindo a OM30!"
    )
  end

  def update_email(citizen)
    @citizen = citizen
    mail(
      to: @citizen.email,
      subject: "Seus dados foram atualizados."
    )
  end

  def update_status(citizen)
    @citizen = citizen
    mail(
      to: @citizen.email,
      subject: "Seu status foi alterado."
    )
  end
end
