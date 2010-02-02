class GradeScale < ActiveRecord::Base
	belongs_to :school_test
	validates_inclusion_of :five, :in => 0..100, :message => "Proszę podać liczbę od 0 do 100."
	validates_inclusion_of :four_and_half, :in => 0..100, :message => "Proszę podać liczbę od 0 do 100."
	validates_inclusion_of :four, :in => 0..100, :message => "Proszę podać liczbę od 0 do 100."
	validates_inclusion_of :three_and_half, :in => 0..100, :message => "Proszę podać liczbę od 0 do 100."
	validates_inclusion_of :three, :in => 0..100, :message => "Proszę podać liczbę od 0 do 100."
	validate :five_validator
	validate :four_and_half_validator
	validate :four_validator
	validate :three_and_half_validator
	
	def five_validator
		if (self.four_and_half > self.five)
			self.errors.add_to_base("Niepoprawna skala")
		end
	end
	
	def four_and_half_validator
		if (self.four > self.four_and_half)
			self.errors.add_to_base("Niepoprawna skala")
		end
	end
	
	def four_validator
		if (self.three_and_half > self.four)
			self.errors.add_to_base("Niepoprawna skala")
		end
	end
	
	def three_and_half_validator
		if (self.three > self.three_and_half)
			self.errors.add_to_base("Niepoprawna skala")
		end
	end
end
