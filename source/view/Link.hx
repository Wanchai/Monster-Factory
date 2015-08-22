package view;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.group.FlxSpriteGroup;
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
	var line:FlxSprite = new FlxSprite();

	public function new(nodes:Array<FlxPoint>, title:Title) 
	{
		super();
		
		this.title = title;
		this.nodes = nodes;
		
		line.makeGraphic(FlxG.width, FlxG.height, FlxColor.TRANSPARENT);
		var test:FlxSprite = new FlxSprite(10, 10);
		test.makeGraphic(30, 30, FlxColor.WHITE);
		
		for (i in 0...nodes.length-1) {
			FlxSpriteUtil.drawLine(line, nodes[i].x, nodes[i].y, nodes[i + 1].x, nodes[i + 1].y, { thickness: 1, color: FlxColor.GRAY } );
		}
		
		add(line);
	}
}