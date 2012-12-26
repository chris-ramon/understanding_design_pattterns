require 'test/unit'
require './definitions'

class CurrentConditionDevice_Test < Test::Unit::TestCase 
	def setup
		@weather_data = WeatherData.new
		@weather_data.temperature = 30
		@weather_data.humidity = 12
		@weather_data.pressure = 29
		@weather_data.measurements_changed
		@current_condition_device = CurrentConditionDevice.new @weather_data
		@statistics_device = StatisticsDevice.new @weather_data
	end
	def test_add_subscriber
		@weather_data.add_subscriber @statistics_device 
		assert_equal 2, @weather_data.count_subscribers
	end
	def test_unsubscribe
		@weather_data.unsubscribe @current_condition_device
		assert_equal 0, @weather_data.count_subscribers
	end
	def test_notifiy_subscribers
		@weather_data.add_subscriber @statistics_device 
		@weather_data.notify_subscribers
		assert_equal ["Updating current condition weather", 
		"Updating statistics weather"], @weather_data.log 
	end
	def test_number_of_observers
		assert_equal 1, @weather_data.count_subscribers
	end
end