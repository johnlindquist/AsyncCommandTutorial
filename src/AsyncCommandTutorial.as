package
{

	import flash.display.Sprite;

	import org.pv3d.tutorials.asynccommand.WeatherContext;

	public class AsyncCommandTutorial extends Sprite
	{
		private var weatherContext:WeatherContext;

		public function AsyncCommandTutorial()
		{
			weatherContext = new WeatherContext(this);
		}
	}
}
