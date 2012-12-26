# This basic example obviously breaks some ruby principles
# like, ducktyping.
class Character
	# Prefering composition over inheritance
	def initialize weapon
		@weapon = weapon
	end
	def get_current_weapon
		@weapon
	end
	def set_weapon weapon
		@weapon = weapon
	end
	def fight
		raise "Called abstract method"
	end
end

class Knight < Character
	# Method that perform the call
	# to the strategy "algorithm" and sends
	# the current instance as context.
	def fight
		@weapon.use_weapon self
	end
end

# <<interface>>
class WeaponBehavior
	def use_weapon
		raise "called abstract method"
	end
end

# Bunch of "Algorithms" (Strategies)
class Axe < WeaponBehavior
	def use_weapon context
		"#{context.class.name} is fighting with #{self.class.name}."
	end
end

class Sword < WeaponBehavior
	def use_weapon context
		"#{context.class.name} is fighting with #{self.class.name}."
	end
end		

