require 'bundler/setup'
Bundler.require(:default)
Dotenv.load
require_relative 'lib/weather_cli'
#uygulamayı başlat
WeatherCLI.new.run
