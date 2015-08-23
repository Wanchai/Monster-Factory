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
		
		icon.makeGraphic(5 * Reg.brickSize, 3 * Reg.brickSize, FlxColor.WHITE);
		
		name = new FlxText(icon.width + 10, 0, 100);
		name.setFormat(12, FlxColor.WHITE, "left");
		//name.setBorderStyle(FlxText.BORDER_OUTLINE, FlxColor.RED, 1);
		
		add(icon);
		add(name);
		
		Reg.titles.push(this);
    }
	
	public function setData(id:Int) {
		ID = id;
		setName(Reg.titData[ID][0]);
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
	
	public function getSprite():FlxSprite 
	{
		return icon;
	}
	public function setName(str:String):Void 
	{
		name.text = str;
	}
}