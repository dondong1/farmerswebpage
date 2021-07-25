class Elevator < ApplicationRecord
  enum elevator_status: [:Active, :Inactive, :Intervention]
  has_many :interventions
  before_update :twilio_notifier
  belongs_to :column
  
  def twilio_notifier
    if self.status_changed?
      account_sid = "#{ENV["ACCOUNT_SID"]}"
      auth_token = "#{ENV["AUTH_TOKEN"]}"
      @client = Twilio::REST::Client.new account_sid, auth_token

      if self.status_changed?
        @client.api.account.messages.create(
          from: "+18317041565",
          to: "9164725749", #For demonstration
          # to: self.column.battery.building.technical_contact_phone_for_the_building,
          body: "Elevator #{self.id} with Serial Number #{self.serial_number} require maintenance.")
      end
    end   
  end
  

  def e_format_form
    "#{id} - #{certificate_of_operations}"
  end
  
end