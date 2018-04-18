require 'forecast_io'

ForecastIO.configure do |config|
  config.api_key = Rails.application.config.x.forecast_io_key
end