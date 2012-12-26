require 'test/unit'
require './classes.rb'

class Character_Test < Test::Unit::TestCase
	def setup
		weapon = Weapon::get_weapon "Axe"
		@knight = Knight.new
		@knight.set_weapon weapon
	end
	def test_fight
		assert_equal "Knight is fighting with Axe", 
		@knight.fight
	end
	def test_change_weapon_at_run_time
		@knight.set_weapon Weapon::get_weapon "Raptor"
		assert_equal "Knight is fighting with Raptor",
		@knight.fight
	end
end