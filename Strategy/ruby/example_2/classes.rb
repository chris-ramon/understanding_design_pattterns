# This is more ruby approach of the example_1

class Character
	# Weapon is the "strategy - algorithm"
	def set_weapon weapon
		@weapon = weapon
	end
end

class Knight < Character
	def fight
		# Delegates
		@weapon.call self
	end
end

class Weapon
	class << self
		def get_weapon weapon_name
			return Proc.new {|context|
				"#{context.class.name} is fighting with #{weapon_name}"			
			}
		end
	end
end
