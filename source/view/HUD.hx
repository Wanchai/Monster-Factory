package view;

import flixel.FlxG;
import flixel.group.FlxSpriteGroup;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.util.FlxColor;
import flixel.util.FlxSpriteUtil;

/**
 * ...
 * @author Thomas MALICET
 */
class HUD extends FlxSpriteGroup
{
	var cash:FlxText;

	public function new(X:Float=0, Y:Float=0, MaxSize:Int=0) 
	{
		super(X, Y, MaxSize);
		
		cash = new FlxText(0, 0, 100, "CA$H : 0");
		cash.setFormat(15, FlxColor.BEIGE, "left");
		add(cash);
		
		FlxSpriteUtil.screenCenter(cash, true, false);
		
		//var resetBtn:FlxButton = new FlxButton(1, 1, "reset", resetMe);
		//add(resetBtn);
	}
	
	function resetMe() 
	{
		FlxG.resetGame();
	}
	
	override public function update():Void
	{
		super.update();
		cash.text = "CA$H : " + Reg.cash;
	}
	
	override public function destroy():Void
	{
		super.destroy();
	}
	
}