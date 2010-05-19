package org.pv3d.tutorials.asynccommand.view
{
	import flash.events.MouseEvent;

	import flight.binding.Bind;

	import org.pv3d.tutorials.asynccommand.model.WeatherModel;
	import org.pv3d.tutorials.asynccommand.signals.WeatherSearched;
	import org.robotlegs.mvcs.Mediator;

	public class WeatherSearchViewMediator extends Mediator
	{
		[Inject]
		public var weatherSearchView:WeatherSearchView;

		[Inject]
		public var weatherSearched:WeatherSearched;

		[Inject]
		public var weatherModel:WeatherModel;

		override public function onRegister():void
		{
			weatherSearchView.submitClicked.add(onWeatherSubmitClicked)
			Bind.addBinding(weatherSearchView, "outputText.text", weatherModel, "result");
		}

		private function onWeatherSubmitClicked(event:MouseEvent):void
		{
			weatherSearched.dispatch(weatherSearchView.inputText.text);
		}
	}
}