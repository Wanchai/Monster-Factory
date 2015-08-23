package view;

import flixel.addons.display.shapes.FlxShapeLine;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.group.FlxSpriteGroup;
import flixel.plugin.MouseEventManager;
import flixel.util.FlxColor;
import flixel.util.FlxPoint;
import flixel.util.FlxSpriteUtil;

/**
 * ...
 * @author Thomas MALICET
 */
class Link extends FlxSpriteGroup
{
	public var nodes:Array<FlxPoint>;
	public var title:Title;
	var line:FlxSprite;
	var bld:Building;

	public function new(nodes:Array<FlxPoint>, title:Title, bld:Building) 
	{
		super();
		
		this.bld = bld;
		this.title = title;
		this.nodes = nodes;
		
		line = new FlxSprite();
		line.makeGraphic(FlxG.width, FlxG.height, FlxColor.TRANSPARENT);
		
		for (i in 0...nodes.length-1) {
			//FlxSpriteUtil.drawLine(line, nodes[i].x, nodes[i].y, nodes[i + 1].x, nodes[i + 1].y, { thickness: 1, color: FlxColor.GRAY } );
			//var ln:FlxShapeLine = new FlxShapeLine(0, 0, nodes[i], nodes[i + 1], { thickness: 1, color: FlxColor.GRAY } );
		}
		
		add(line);
		
		//MouseEventManager.add(this, onMouseDown, onMouseUp, onMouseOver, onMouseOut);
		
		var test:FlxSprite = new FlxSprite();
		test.makeGraphic(50, 50);
		
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