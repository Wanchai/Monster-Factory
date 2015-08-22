package view;

import flixel.FlxSprite;
import flixel.group.FlxSpriteGroup;
import flixel.text.FlxText;
import flixel.util.FlxColor;
import flixel.util.FlxTimer;

/**
 * ...
 * @author Thomas MALICET
 */
class Title extends FlxSpriteGroup
{
	var name:FlxText;
	var icon:FlxSprite = new FlxSprite();

    public function new(X:Float=0, Y:Float=0)
    {
        super(X, Y);
		
		new FlxTimer(1, everySecond, 0);
		
		Reg.titles.push(this);
		
		icon.makeGraphic(5 * Reg.brickSize, 3 * Reg.brickSize, FlxColor.WHITE);
		
		name = new FlxText(6 * Reg.brickSize, 0, 100);
		name.text = "World of Mycraft";
		name.setFormat(12, FlxColor.WHITE, "left");
		//name.setBorderStyle(FlxText.BORDER_OUTLINE, FlxColor.RED, 1);
		
		add(icon);
		//add(name);
    }

    override public function update():Void
    {
        super.update();
    }

    override public function destroy():Void
    {
        super.destroy();
    }
		
	function everySecond(Timer:FlxTimer):Void 	
	{
		//trace("hop");
	}
}