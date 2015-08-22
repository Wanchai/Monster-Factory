package view;

import flixel.FlxSprite;
import flixel.util.FlxColor;

/**
 * ...
 * @author Thomas MALICET
 */
class Monster extends FlxSprite
{

	public function new(X:Float=0, Y:Float=0) 
	{
		super(X, Y);
		
		makeGraphic(1 * Reg.brickSize, 1 * Reg.brickSize, FlxColor.SILVER);
	}
	
}