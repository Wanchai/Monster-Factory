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
	var lnCount:Int = 0;
	var isBuilding:Bool;
	
	public var lines:Array<Link> = new Array();

    public function new(X:Float=0, Y:Float=0, BUILD:Bool = false)
    {
        super(X, Y);
		isBuilding = BUILD;
		new FlxTimer(1, everySecond, 0);
		

		
		icon.makeGraphic(10 * Reg.brickSize, 6 * Reg.brickSize, FlxColor.AZURE);
		
		name = new FlxText(0, 0, icon.width);
		name.setFormat(12, FlxColor.BLACK, "center");
		//name.setBorderStyle(FlxText.BORDER_OUTLINE, FlxColor.RED, 1);
		
		add(icon);
		add(name);
		
		if (!isBuilding) 
		{
			updateMap();
			setData(0);
			init();
		}
    }
	
	function init() 
	{
		canvas.makeGraphic(FlxG.width, FlxG.height, FlxColor.TRANSPARENT);
		canvas.setPosition( -this.x, -this.y);
		add(canvas);
		
		MouseEventManager.add(icon, onMouseDown, onMouseUp, onMouseOver, onMouseOut);
	}
	
	public function setData(id:Int) {
		ID = id;
		setName(Reg.bldData[ID][0][0]);
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
	


    override public function update():Void
    {
        super.update();
		if (!isBuilding) 
		{
			makeLink();
		}
		else
		{
			if (FlxG.mouse.justReleased) {
				if (updateMap()) {
					isBuilding = false;
					this.setPosition(Std.int(this.x / Reg.brickSize) * Reg.brickSize, Std.int(this.y / Reg.brickSize) * Reg.brickSize);
					//trace("X: " + (Std.int(this.x / Reg.brickSize) * Reg.brickSize) + " Y: " + (Std.int(this.y / Reg.brickSize) * Reg.brickSize));
					init();
				}
			}
			else
			{
				setPosition(FlxG.mouse.x - 15, FlxG.mouse.y - 15);
			}
		}
    }
	
	function makeLink() 
	{
		if (linking && FlxG.mouse.justReleased) {
			linking = false;
			FlxSpriteUtil.fill(canvas, FlxColor.TRANSPARENT);
			//FlxSpriteUtil.fill(canvas, 0x11c3c3c3);
			
			for (tit in Reg.titles) {	
				var tt:FlxSprite = tit.getSprite();
				if (FlxCollision.pixelPerfectPointCheck(Std.int(FlxG.mouse.x), Std.int(FlxG.mouse.y), tt)) {
					var chk:Bool = true;
					for (ln in lines) {
						if (ln.title == tit) {
							chk = false;
						}
					}
					if (chk) {
						// Creates a new link
						
						// Move to LINK for update
						var nodes:Array<FlxPoint> = Reg.map.findPath (FlxPoint.get(this.x + icon.width / 2, this.y + icon.height + Reg.brickSize/2), FlxPoint.get(tt.x + tt.width / 2, tt.y + tt.height / 2), true);
						var lk:Link = new Link(nodes, tit, this);
						lines.push(lk);
						add(lk);
					}
				}
			}
		}
			
		if (linking) {
			// For the line drawing
			if (canvas != null) {
				//FlxSpriteUtil.fill(canvas, 0x11c3c3c3);
				FlxSpriteUtil.fill(canvas, FlxColor.TRANSPARENT);
			}
			FlxSpriteUtil.drawLine(canvas, mouseStart.x, mouseStart.y, FlxG.mouse.x, FlxG.mouse.y, { thickness: 1, color: FlxColor.RED } );
		}		
	}
		
	function everySecond(Timer:FlxTimer):Void 	
	{
		if (lines.length > 0) {
			var monster:Monster = new Monster(0 + icon.width / 2, 0 + icon.height + Reg.brickSize/2);
			add(monster);
			
			var path:FlxPath = new FlxPath();
			if (lines[lnCount].nodes != null) {
				path.start(monster, lines[lnCount].nodes, 100, FlxPath.FORWARD, true);
			}
			monster.path = path;

			if(lnCount == lines.length - 1) {
				lnCount = 0;
			} else {
				lnCount++;
			}
		}
	}
	
    override public function destroy():Void
    {
        super.destroy();
    }
	
	public function setName(str:String):Void 
	{
		name.text = str;
	}
	
	function onMouseDown(sprite:FlxSprite) {
		mouseStart.copyFrom(FlxG.mouse);
		if(!isBuilding) linking = true;
	}
	
	function onMouseUp(sprite:FlxSprite) {}
	function onMouseOver(sprite:FlxSprite) {}
	function onMouseOut(sprite:FlxSprite) {}
}