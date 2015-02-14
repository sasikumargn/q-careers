class Candidate < ActiveRecord::Base

  validates :experience_in_years, :inclusion => {:in => YEARS_LIST, :message => "%{value} is not a valid no of years" }

end
