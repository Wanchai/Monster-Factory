package view;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.util.FlxCollision;
import flixel.util.FlxColor;
import flixel.util.FlxPath;

/**
 * ...
 * @author Thomas MALICET
 */
class Monster extends FlxSprite
{
	public var path:FlxPath;
	public var points:Int = 0;
	
	public function new(X:Float=0, Y:Float=0) 
	{
		super(X, Y);
		
		makeGraphic(1 * Reg.brickSize, 1 * Reg.brickSize, FlxColor.SILVER);
	}
	
	override public function update():Void
    {
		super.update();
		
		if (path.finished) {
			for (tit in Reg.titles) {	
				var tt:FlxSprite = tit.getSprite();
				if (FlxG.overlap(this, tt)) {
					Reg.cash += points;
					
					tit.addLife(points);
					
					destroy();
				}
			}
		}
		/*if (path.finished) {
			Reg.cash += points;
			destroy();
		}*/
    }
	
}