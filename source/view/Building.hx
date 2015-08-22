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
class Building extends FlxSpriteGroup
{
	var icon:FlxSprite = new FlxSprite();
	var name:FlxText;

    public function new(X:Float=0, Y:Float=0)
    {
        super(X, Y);
		
		new FlxTimer(1, everySecond, 0);
		
		icon.makeGraphic(5 * Reg.brickSize, 3 * Reg.brickSize, FlxColor.AZURE);
		
		name = new FlxText(6 * Reg.brickSize, 0, 100);
		name.setFormat(12, FlxColor.AZURE, "left");
		//name.setBorderStyle(FlxText.BORDER_OUTLINE, FlxColor.RED, 1);
		
		add(icon);
		//add(name);
		
		// Update Map
		var icW:Int = Std.int(icon.width / Reg.brickSize);
		var icH:Int = Std.int(icon.height / Reg.brickSize);
		
		var j:Int = 0;
		for (i in 0...icW) {
			for (j in 0...icH) {
				Reg.map.setTileByIndex(Std.int(Y / Reg.brickSize + j) * 100  + Std.int(X / Reg.brickSize) + i, 1);
			}
			
			///if(j > icW) j++;
		}
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
	
	public function setName(str:String):Void 
	{
		name.text = str;
	}
	
}