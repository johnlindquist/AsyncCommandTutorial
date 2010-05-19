package org.pv3d.tutorials.asynccommand.view
{
	import com.bit101.components.InputText;
	import com.bit101.components.PushButton;
	import com.bit101.components.TextArea;
	import com.bit101.components.VBox;

	import flash.display.Sprite;
	import flash.events.MouseEvent;

	import org.osflash.signals.natives.NativeSignal;

	public class WeatherSearchView extends Sprite
	{
		private var pushButton:PushButton;
		private var vbox:VBox;

		public var inputText:InputText;
		public var outputText:TextArea;
		
		public var submitClicked:NativeSignal;

		public function WeatherSearchView()
		{
			inputText = new InputText();
			inputText.text = "Enter zip code";

			pushButton = new PushButton();
			pushButton.label = "Click to Search";

			outputText = new TextArea();
			outputText.text = "Enter your zip code then click to search";

			vbox = new VBox();
			vbox.addChild(inputText);
			vbox.addChild(pushButton);
			vbox.addChild(outputText);

			addChild(vbox);

			submitClicked = new NativeSignal(pushButton, MouseEvent.CLICK);
		}
	}
}