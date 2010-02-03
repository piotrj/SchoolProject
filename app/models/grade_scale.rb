class GradeScale < ActiveRecord::Base
	belongs_to :school_test
	validates_inclusion_of :five, :in => 0..100, :message => "Proszę podać liczbę od 0 do 100."
	validates_inclusion_of :four_and_half, :in => 0..100, :message => "Proszę podać liczbę od 0 do 100."
	validates_inclusion_of :four, :in => 0..100, :message => "Proszę podać liczbę od 0 do 100."
	validates_inclusion_of :three_and_half, :in => 0..100, :message => "Proszę podać liczbę od 0 do 100."
	validates_inclusion_of :three, :in => 0..100, :message => "Proszę podać liczbę od 0 do 100."
	validate :grade_validator
	
	def grade_validator
		if self.five && self.four_and_half && self.four && self.three_and_half && self.three
			if (self.four_and_half > self.five)
				self.errors.add_to_base("Niepoprawna skala")
			end	
			if (self.four > self.four_and_half)
				self.errors.add_to_base("Niepoprawna skala")
			end	
			if (self.three_and_half > self.four)
				self.errors.add_to_base("Niepoprawna skala")
			end
			if (self.three > self.three_and_half)
				self.errors.add_to_base("Niepoprawna skala")
			end
		else
			self.errors.add_to_base("Niepoprawna skala")
		end
	end
end
