class SendNotificationUpdate
  def initialize(citizen)
    @citizen = citizen
  end

  def execute!
    if status_changed
      return CitizenMailer.update_status(@citizen).deliver
    end

    CitizenMailer.update_email(@citizen).deliver

  end

  def status_changed
    if @citizen.status_before_last_save.present? && @citizen.status != @citizen.status_before_last_save
      status_changed = true
    else
      status_changed = false
    end
    return  status_changed
  end
end