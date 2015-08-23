package;
import flixel.FlxG;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.ui.FlxButton;

/**
 * ...
 * @author Thomas MALICET
 */
class GameOver extends FlxState
{

	override public function create():Void
	{
		super.create();
		
		add(new FlxText(100, 100, 550, "YOU LOST ALL YOUR CONTRACTS!!", 22));
		add(new FlxText(100, 150, 250, "SCORE: " + Reg.cash, 22));
		
		var startBtn:FlxButton = new FlxButton(100, 200, 'Restart', reset);
		//startBtn.loadGraphic("assets/images/btn1.png", false, 120, 28);
		//startBtn.label.size = 16;
		//startBtn.label.color = FlxColor.WHITE;
		add(startBtn);
	}

	override public function update():Void
	{
		super.update();
	}

	override public function destroy():Void
	{
		super.destroy();
	}
	function reset():Void
	{
		FlxG.resetGame();
	}
}