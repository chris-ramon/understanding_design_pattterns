# There are 3 devices (Current_Condition, Statistics, Forecast) 
# which should update weather information according 3 variables 
# (temperature, humidity, pressure).

# Basic approach of observer pattern.

# << interfaces >>
module Publisher
	def add_subscriber observer
		raise "Called abstract method"
	end
	def unsubscribe observer
		raise "Called abstract method"
	end
	def notify_subscribers
		raise "Called abstract method"
	end
	def count_subscribers
		raise "Called abstract method"
	end
end	

module Device
	def update
		raise "Called abstract method"
	end
end

# :classes:

class WeatherData
	include Publisher
	attr_accessor :temperature, :humidity, :pressure, :log
	def initialize
		@subscribers = []
		@log = []
	end
	def add_subscriber observer
		@subscribers << observer
	end
	def unsubscribe observer
		@subscribers.delete observer
	end
	def notify_subscribers
		if @measurements_changed
			@subscribers.each do |subscriber|
				# using log, just for testing purpose
				result = subscriber.update self
				@log << result
			end
		end
		@measurements_changed = false
	end
	def count_subscribers
		@subscribers.size
	end
	def measurements_changed
		@measurements_changed = true
	end
end

class CurrentConditionDevice
	include Device
	def initialize weather
		weather.add_subscriber(self)
	end
	def update weather_data_context
		"Updating current condition weather"
	end
end

class StatisticsDevice
	include Device
	def update weather_data_context
		"Updating statistics weather"
	end
end

class ForecastDevice
	include Device
	def update weather_data_context
		"Updating forecast weather"
	end
end

