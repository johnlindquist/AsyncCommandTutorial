package org.pv3d.tutorials.asynccommand.controller
{
	import com.yahoo.webapis.weather.WeatherService;

	import flight.domain.AsyncCommand;

	import org.pv3d.tutorials.asynccommand.model.WeatherModel;
	import org.pv3d.tutorials.asynccommand.services.YahooWeatherService;

	public class WeatherSearchCommand extends AsyncCommand
	{
		[Inject]
		public var yahooWeatherService:YahooWeatherService;

		[Inject]
		public var zipCode:String;

		[Inject]
		public var weatherModel:WeatherModel;

		override public function execute():void
		{
			response = yahooWeatherService.search(zipCode);
			
			response.addResultHandler(onWeatherServiceResult);
			response.addFaultHandler(onWeatherFaultHandler);
			
		}

		private function onWeatherFaultHandler(error:Error):void
		{
			weatherModel.result = "Invalid zip code, please try again";
		}

		private function onWeatherServiceResult(weatherService:WeatherService):void
		{
			weatherModel.result = weatherService.weather.current.description;			
		}
	}
}