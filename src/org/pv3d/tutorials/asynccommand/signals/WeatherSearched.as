package org.pv3d.tutorials.asynccommand.signals
{
	import org.osflash.signals.Signal;

	public class WeatherSearched extends Signal
	{

		public function WeatherSearched()
		{
			super(String);
		}
	}
}