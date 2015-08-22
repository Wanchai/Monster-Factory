package;

import flixel.addons.display.FlxGridOverlay;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.tile.FlxTilemap;
import flixel.ui.FlxButton;
import flixel.util.FlxColor;
import flixel.util.FlxMath;
import flixel.util.FlxPath;
import flixel.util.FlxPoint;
import flixel.util.FlxSpriteUtil;
import flixel.util.FlxStringUtil;
import haxe.Timer;
import openfl.display.Graphics;
import view.Building;
import view.Monster;
import view.Title;

/**
 * A FlxState which can be used for the actual gameplay.
 */
class PlayState extends FlxState
{
	var time:Float = 0;
	var path:FlxPath;
	/**
	 * Function that is called up when to state is created to set it up.
	 */
	override public function create():Void
	{
		super.create();
		
		add(FlxGridOverlay.create(Reg.brickSize, Reg.brickSize, -1, -1, false, true, 0x11ffffff, 0x22ffffff));
		
		var tileMap:FlxTilemap = new FlxTilemap();
		Reg.map = tileMap;
		tileMap.loadMap(FlxStringUtil.imageToCSV("assets/images/100.png", false, 1), "assets/images/black_tile.png");
		add(tileMap);
		
		// For TEst
		var monster:Monster = new Monster(52 * Reg.brickSize, 36 * Reg.brickSize);
		add(monster);
		
		var bld:Building = new Building(50 * Reg.brickSize, 32 * Reg.brickSize);
		add(bld);
		
		var bld2:Building = new Building(65 * Reg.brickSize, 23 * Reg.brickSize);
		add(bld2);
		
		var title:Title = new Title(80 * Reg.brickSize, 15 * Reg.brickSize);
		add(title);
		
		// ---
		
		path = new FlxPath();
		
		var nodes:Array<FlxPoint> = tileMap.findPath (FlxPoint.get(monster.x + monster.width / 2, monster.y + monster.height / 2), FlxPoint.get(title.x + title.width / 2, title.y + title.height / 2), true);
		//var path:Array<FlxPoint> = tileMap.findPath(new FlxPoint(50, 32), new FlxPoint(80, 15));
		//path.nodes = path;
		
		if (nodes != null) path.start(monster, nodes);
		
		trace(nodes);
		
		var line:FlxSprite = new FlxSprite();
		line.makeGraphic(FlxG.width, FlxG.height, FlxColor.TRANSPARENT);
		//line.fill(FlxColor.TRANSPARENT);
		//FlxSpriteUtil.drawPolygon(line, nodes, 0x00221133, { thickness: 1, color: FlxColor.RED } );
		
		for (i in 0...nodes.length-1) {
			FlxSpriteUtil.drawLine(line, nodes[i].x, nodes[i].y, nodes[i+1].x, nodes[i+1].y, { thickness: 8, color: FlxColor.RED } );
		}
		add(line);
		
		
		//var nodes:Array<FlxPoint> = tileMap.findPath(new FlxPoint(80, 15), new FlxPoint(50, 32));
		
		
	}
	
	override public function draw():Void
	{
		super.draw();
		
		// To draw path
		if ((path != null))
		{
			path.drawDebug();
		}
	}
	
	override public function destroy():Void
	{
		super.destroy();
	}

	override public function update():Void
	{
		super.update();
		
		//time += FlxG.elapsed;
		//trace("TIME: " + Math.floor(time));
	}
	
}