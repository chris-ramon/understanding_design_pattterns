require 'test/unit'
require './classes.rb'

class Character_Test < Test::Unit::TestCase
	def setup
		@knight = Knight.new Axe.new
	end
	def test_get_current_weapon
		assert_equal @knight.get_current_weapon.class, Axe
		assert_equal @knight.fight, 
		"Knight is fighting with Axe."
	end
	def test_set_weapon
		# Strategy pattern allow us to
		# change the "algorithm" (strategy) at runtime.
		@knight.set_weapon Sword.new
		assert_equal @knight.get_current_weapon.class, Sword
	end
end