package view;

import flixel.group.FlxSpriteGroup;
import flixel.text.FlxText;
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
	}
	
	override public function update():Void
	{
		cash.text = "CA$H : " + Reg.cash;
		super.update();
	}
	
	override public function destroy():Void
	{
		super.destroy();
	}
	
}