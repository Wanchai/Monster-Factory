package view;

import flixel.FlxSprite;
import flixel.group.FlxSpriteGroup;
import flixel.text.FlxText;
import flixel.tweens.FlxTween;
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
	var data:Array<Dynamic>;
	var timer:FlxTimer;

    public function new(X:Float=0, Y:Float=0)
    {
        super(X, Y);
		
		timer = new FlxTimer(1, everySecond, 0);
		
		icon.makeGraphic(5 * Reg.brickSize, 3 * Reg.brickSize, FlxColor.WHITE);
		
		name = new FlxText(icon.width + 10, 0, 100);
		name.setFormat(12, FlxColor.WHITE, "left");
		//name.setBorderStyle(FlxText.BORDER_OUTLINE, FlxColor.RED, 1);
		
		add(icon);
		add(name);
		
		updateMap(true);
		
		Reg.titles.push(this);
    }
	
	public function addLife(i:Int) 
	{
		var str:String = (i > 0) ? "+" + i : "" + i;
		var txt:FlxText = new FlxText(0, -5, 50, str);
		add(txt);
		
		FlxTween.tween(txt, { alpha: 0, y: icon.y-20 }, 1 );
		
		if(icon.health < data[1]) icon.health += i;
		//trace(i);
	}
		
	function updateMap(make:Bool = false): Bool
	{
		var icW:Int = Std.int(icon.width / Reg.brickSize);
		var icH:Int = Std.int(icon.height / Reg.brickSize);
		var chk:Bool = true;
		
		for (i in 0...icW) {
			for (j in 0...icH) {
				var ind:Int = Std.int(this.y / Reg.brickSize + j) * 100  + Std.int(this.x / Reg.brickSize) + i;
				
				if (make) 
				{
					Reg.map.setTileByIndex(ind, 1);
				}
				else 
				{
					if (Reg.map.getTileByIndex(ind) == 1) chk = false;
				}
			}
		}
		if (chk && !make) updateMap(true);
		
		return chk;
	}
	
	function removeMap(): Void
	{
		var icW:Int = Std.int(icon.width / Reg.brickSize);
		var icH:Int = Std.int(icon.height / Reg.brickSize);
		
		for (i in 0...icW) {
			for (j in 0...icH) {
				var ind:Int = Std.int(this.y / Reg.brickSize + j) * 100  + Std.int(this.x / Reg.brickSize) + i;
				Reg.map.setTileByIndex(ind, 0);
			}
		}
	}
	
	public function setData(id:Int) 
	{
		ID = id;
		data = Reg.titData[ID];
		icon.health = Std.parseFloat(data[1]);
		setName(data[0]);
	}

    override public function update():Void
    {
        super.update();
    }

		
	function everySecond(Timer:FlxTimer):Void 	
	{
		icon.health -= 1;
		
		if (icon.health < 1) {
			timer.cancel();
			removeMap();
			destroy();
		}
		//trace("hop");
	}
	
	override public function destroy():Void
	{
		Reg.titles.remove(this);

		super.destroy();
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