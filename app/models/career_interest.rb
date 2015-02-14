class CareerInterest < ActiveRecord::Base

  # Associations
  belongs_to :candidate
  belongs_to :event

  # Validations
  validates :candidate, presence: true
  validates :event, presence: true

  def confirm!
    update_attributes(confirmed: true, confirmed_at: Time.now)
  end

end
