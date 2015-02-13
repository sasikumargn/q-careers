class CareersInterest < ActiveRecord::Base
	validates :first_name, :last_name, :email, :phone, :skills, :city, :state,  presence: true
	validates :phone,
      :format => {:with => /\A\(([0-9\(\)\/\+ \-]){3}\) ([0-9\(\)\/\+ \-]){3}-([0-9\(\)\/\+ \-]){4}\z/i},
      :if => proc {|user| user.phone.present?}
  validates :email,
      :format => {:with => /\A(|(([A-Za-z0-9]+_+)|([A-Za-z0-9]+\-+)|([A-Za-z0-9]+\.+)|([A-Za-z0-9]+\++))*[A-Za-z0-9]+@((\w+\-+)|(\w+\.))*\w{1,63}\.[a-zA-Z]{2,6})\z/i},
      :if => proc {|user| user.email.present?}
  # Associtions
  has_one :attachment, :dependent => :destroy
  accepts_nested_attributes_for :attachment, allow_destroy: true

  def name
  	"#{first_name} #{last_name}"
  end
  
end
