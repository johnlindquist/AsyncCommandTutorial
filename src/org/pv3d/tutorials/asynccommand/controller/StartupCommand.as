package org.pv3d.tutorials.asynccommand.controller
{
	import org.pv3d.tutorials.asynccommand.view.WeatherSearchView;
	import org.robotlegs.mvcs.Command;

	public class StartupCommand extends Command
	{

		override public function execute():void
		{
			contextView.addChild(new WeatherSearchView());
		}
	}
}