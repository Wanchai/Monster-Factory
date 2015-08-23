package view;

import flixel.addons.display.shapes.FlxShapeLine;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.group.FlxSpriteGroup;
import flixel.plugin.MouseEventManager;
import flixel.util.FlxColor;
import flixel.util.FlxPoint;
import flixel.util.FlxSpriteUtil;
import flixel.util.FlxTimer;

/**
 * ...
 * @author Thomas MALICET
 */
class Link extends FlxSpriteGroup
{
	public var nodes:Array<FlxPoint> = [];
	var prevNodes:Array<FlxPoint>;
	public var title:Title;
	var dotCont:FlxSpriteGroup = new FlxSpriteGroup();
	var bld:Building;

	public function new(title:Title, bld:Building) 
	{
		super();
		
		this.bld = bld;
		this.title = title;
		
		new FlxTimer(1, everySecond, 0);
		add(dotCont);
		setNodes();
	}
	
	function everySecond(Timer:FlxTimer):Void
	{
		setNodes();
	}
	
	function setNodes():Void 
	{
		prevNodes = nodes;
		var tt:FlxSprite = title.getSprite();
		nodes = Reg.map.findPath (FlxPoint.get(bld.x +bld.icon.width / 2, bld.y + bld.icon.height + Reg.brickSize / 2), FlxPoint.get(tt.x - 2, tt.y + tt.height / 2), false);
		
		if (Std.string(prevNodes) != Std.string(nodes) && !bld.isStoping) {
			dotCont.clear();
			if (nodes != null) {
				for (i in 0...nodes.length - 1) {
					var dot:FlxSprite = new FlxSprite(nodes[i].x - Reg.brickSize / 2, nodes[i].y - Reg.brickSize / 2);
					dot.loadGraphic(AssetPaths.dot__png);
					dotCont.add(dot);
				}
			}
		}
	}
	
	function onMouseUp(sprite:FlxSprite) {
		
		//destroy();
	}	
	
	function onMouseDown(sprite:FlxSprite) {}
	function onMouseOver(sprite:FlxSprite) {}
	function onMouseOut(sprite:FlxSprite) { }
	
    override public function update():Void
    {
        super.update();
    }

    override public function destroy():Void
    {
        super.destroy();
    }	
}