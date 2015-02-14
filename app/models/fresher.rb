class Fresher < Candidate

  validates :year_of_passing, :inclusion => {:in => YEAR_OF_PASSING_LIST, :message => "%Sorry. You seems to be an experienced person. You cannot apply as a fresher." }

end
