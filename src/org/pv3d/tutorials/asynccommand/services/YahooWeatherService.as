package org.pv3d.tutorials.asynccommand.services
{
	import com.yahoo.webapis.weather.WeatherService;

	import com.yahoo.webapis.weather.events.WeatherErrorEvent;
	import com.yahoo.webapis.weather.events.WeatherResultEvent;

	import flight.net.IResponse;
	import flight.net.Response;

	public class YahooWeatherService
	{

		private var weatherService:WeatherService = new WeatherService();

		public function search(zipCode:String):IResponse
		{
			weatherService.getWeather(zipCode, "F");
			
			var response:Response = new Response();
			response.addCompleteEvent(weatherService, WeatherResultEvent.WEATHER_LOADED);
			response.addCancelEvent(weatherService, WeatherErrorEvent.INVALID_LOCATION);
			return response;
		}
	}
}