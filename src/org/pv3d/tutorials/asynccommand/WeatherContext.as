package org.pv3d.tutorials.asynccommand
{
	import flash.display.DisplayObjectContainer;

	import org.osflash.signals.Signal;
	import org.pv3d.tutorials.asynccommand.controller.StartupCommand;
	import org.pv3d.tutorials.asynccommand.controller.WeatherSearchCommand;
	import org.pv3d.tutorials.asynccommand.model.WeatherModel;
	import org.pv3d.tutorials.asynccommand.services.YahooWeatherService;
	import org.pv3d.tutorials.asynccommand.signals.WeatherSearched;
	import org.pv3d.tutorials.asynccommand.view.WeatherSearchView;
	import org.pv3d.tutorials.asynccommand.view.WeatherSearchViewMediator;
	import org.robotlegs.mvcs.SignalContext;

	public class WeatherContext extends SignalContext
	{
		public function WeatherContext(contextView:DisplayObjectContainer)
		{
			super(contextView);
		}

		override public function startup():void
		{
			for each(var singletonClass:Class in [WeatherModel, YahooWeatherService])
			{
				injector.mapSingleton(singletonClass);
			}

			signalCommandMap.mapSignalClass(WeatherSearched, WeatherSearchCommand);

			mediatorMap.mapView(WeatherSearchView, WeatherSearchViewMediator);			

			var startupSignal:Signal = new Signal;
			signalCommandMap.mapSignal(startupSignal, StartupCommand, true);
			startupSignal.dispatch();
		}
	}
}