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
import view.HUD;
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
		
		Reg.map = new FlxTilemap();
		//Reg.map = tileMap;
		Reg.map.loadMap(FlxStringUtil.imageToCSV("assets/images/100.png", false, 1), "assets/images/black_tile.png");
		add(Reg.map);
		
		Reg.hud = new HUD();
		add(Reg.hud);
		
		// For TEst

		
		var bld:Building = new Building(50 * Reg.brickSize, 32 * Reg.brickSize);
		bld.setName("Creeps");
		add(bld);
		
		//var bld2:Building = new Building(65 * Reg.brickSize, 13 * Reg.brickSize);
		//add(bld2);
		
		//var title:Title = new Title(80 * Reg.brickSize, 15 * Reg.brickSize);
		//add(title);
		
		var title2:Title = new Title(80 * Reg.brickSize, 30 * Reg.brickSize);
		title2.setName("Prince of Arabia");
		add(title2);
		
		// LEFT
		var addBldg = new FlxButton(10, 200, "Creeps", addBldgCallback);
		add(addBldg);
		// ---
	}
	private function addBldgCallback():Void
	{
		var bld2:Building = new Building(FlxG.mouse.x, FlxG.mouse.y, true);
		add(bld2);
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