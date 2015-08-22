package view;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.group.FlxSpriteGroup;
import flixel.plugin.MouseEventManager;
import flixel.text.FlxText;
import flixel.util.FlxCollision;
import flixel.util.FlxColor;
import flixel.util.FlxPath;
import flixel.util.FlxPoint;
import flixel.util.FlxSpriteUtil;
import flixel.util.FlxTimer;

/**
 * ...
 * @author Thomas MALICET
 */
class Building extends FlxSpriteGroup
{
	var icon:FlxSprite = new FlxSprite();
	var mouseStart:FlxPoint = new FlxPoint();
	var name:FlxText;
	var linking:Bool;
	var canvas:FlxSprite = new FlxSprite();
	
	public var lines:Array<Link> = new Array();

    public function new(X:Float=0, Y:Float=0)
    {
        super(X, Y);
		
		new FlxTimer(1, everySecond, 0);
		
		icon.makeGraphic(5 * Reg.brickSize, 3 * Reg.brickSize, FlxColor.AZURE);
		canvas.makeGraphic(FlxG.width, FlxG.height, FlxColor.TRANSPARENT);
		canvas.setPosition( -this.x, -this.y);
		add(canvas);
		
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
		}
		MouseEventManager.add(this, onMouseDown, onMouseUp, onMouseOver, onMouseOut);
    }
	
	function onMouseDown(sprite:FlxSprite) {
		mouseStart.copyFrom(FlxG.mouse);
		linking = true;
	}
	
	function onMouseUp(sprite:FlxSprite) {}
	function onMouseOver(sprite:FlxSprite) {}
	function onMouseOut(sprite:FlxSprite) {}

    override public function update():Void
    {
        super.update();
		
		if (linking && FlxG.mouse.justReleased) {
			linking = false;
			canvas.fill(FlxColor.TRANSPARENT);
			//canvas = new FlxSprite();
			FlxSpriteUtil.
			
			for (tit in Reg.titles) {	
				var tt:FlxSprite = tit.getSprite();
				if (FlxCollision.pixelPerfectPointCheck(Std.int(FlxG.mouse.x), Std.int(FlxG.mouse.y), tt)) {
					// Creates a new link
					var nodes:Array<FlxPoint> = Reg.map.findPath (FlxPoint.get(this.x + icon.width / 2, this.y + icon.height + Reg.brickSize/2), FlxPoint.get(tt.x + tt.width / 2, tt.y + tt.height / 2), true);
					var lk:Link = new Link(nodes, tit);
					//lines.push(lk);
					//this.add(lk);
				}
			}
		}
			
		if (linking) {
			// For the line drawing
			if (canvas != null) {
				canvas.fill(FlxColor.TRANSPARENT);
				//canvas = new FlxSprite();
			}
			
			
			
			
			FlxSpriteUtil.drawLine(canvas, mouseStart.x, mouseStart.y, FlxG.mouse.x, FlxG.mouse.y, { thickness: 1, color: FlxColor.RED } );
		}
    }

    override public function destroy():Void
    {
        super.destroy();
    }
		
	function everySecond(Timer:FlxTimer):Void 	
	{
		//trace("hop");
		if (lines.length > 0) {
			var monster:Monster = new Monster(0 + icon.width / 2, 0 + icon.height + Reg.brickSize/2);
			add(monster);

			var path:FlxPath = new FlxPath();
			if (lines[0].nodes != null) path.start(monster, lines[0].nodes, 100, FlxPath.FORWARD, true);
		}
	}
	
	public function setName(str:String):Void 
	{
		name.text = str;
	}
	
}