class Person < ActiveRecord::Base
  attr_accessible :first_name, :last_name, :comapny_name, :email
  
  has_many :notes

  def self.merge(winner, loser)  	 	
 		result = winner
 		result.notes << loser.notes 		
 		result.email = loser.email if winner.email.blank?
 		loser.destroy
 		result
  end

  def duplicates?(dupe)
  	if dupe
	  	if self.first_name == dupe.first_name &&
	  		 self.last_name == dupe.last_name &&
	  		 self.email == dupe.email &&
	  		 self.company_name == dupe.company_name
	  	  return true
	  	end
	  else
  		false	
	  end
  end

end