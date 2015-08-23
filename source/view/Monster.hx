package view;

import flixel.FlxSprite;
import flixel.util.FlxColor;
import flixel.util.FlxPath;

/**
 * ...
 * @author Thomas MALICET
 */
class Monster extends FlxSprite
{
	public var path:FlxPath;
	public var points:Int = 1;
	
	public function new(X:Float=0, Y:Float=0) 
	{
		super(X, Y);
		
		makeGraphic(1 * Reg.brickSize, 1 * Reg.brickSize, FlxColor.SILVER);
	}
	
	override public function update():Void
    {
		super.update();
		
		if (path.finished) {
			Reg.cash += points;
			destroy();
		}
    }
	
}