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
import openfl.display.CapsStyle;
import openfl.display.Graphics;
import openfl.display.JointStyle;
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

		
		var bld:Building = new Building(50 * Reg.brickSize, 32 * Reg.brickSize);
		add(bld);
		
		var bld2:Building = new Building(65 * Reg.brickSize, 23 * Reg.brickSize);
		add(bld2);
		
		var title:Title = new Title(80 * Reg.brickSize, 15 * Reg.brickSize);
		add(title);
		
		var title2:Title = new Title(80 * Reg.brickSize, 30 * Reg.brickSize);
		add(title2);
		
		// ---
	}
	
	override public function draw():Void
	{
		super.draw();
	}
	
	override public function destroy():Void
	{
		super.destroy();
	}

	override public function update():Void
	{
		super.update();
	}
	
}