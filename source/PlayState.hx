package;

import flixel.addons.display.FlxGridOverlay;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.group.FlxSpriteGroup;
import flixel.tile.FlxTilemap;
import flixel.ui.FlxButton;
import flixel.util.FlxPath;
import flixel.util.FlxStringUtil;
import flixel.util.FlxTimer;
import view.Building;
import view.HUD;
import view.Title;

/**
 * A FlxState which can be used for the actual gameplay.
 */
class PlayState extends FlxState
{
	var time:Float = 0;
	var path:FlxPath;
	var btnCont:FlxSpriteGroup;
	var titleCount:Int = 0;
	var titTimer:FlxTimer;
	/**
	 * Function that is called up when to state is created to set it up.
	 */
	override public function create():Void
	{
		super.create();
		
		new FlxTimer(1, everySecond, 0);
		
		titTimer = new FlxTimer(10, addTitle, 0);
		
		add(FlxGridOverlay.create(Reg.brickSize, Reg.brickSize, -1, -1, false, true, 0x11ffffff, 0x22ffffff));
		
		Reg.map = new FlxTilemap();
		//Reg.map = tileMap;
		Reg.map.loadMap(FlxStringUtil.imageToCSV("assets/images/100.png", false, 1), "assets/images/black_tile.png");
		add(Reg.map);
		
		
		btnCont = new FlxSpriteGroup(10, 200);
		add(btnCont);
		
		var bld:Building = new Building(50 * Reg.brickSize, 32 * Reg.brickSize);
		bld.setName("Creeps");
		add(bld);
		
		var title2:Title = new Title(80 * Reg.brickSize, 6 * Reg.brickSize);
		title2.setName("Prince of Arabia");
		add(title2);
		
		// LEFT
		//var addCreeps = new FlxButton2(10, 200, "Creeps 15$", addCreepsCallback);
		//add(addCreeps);
		// ---
		Reg.hud = new HUD();
		add(Reg.hud);
	}
	
	function addTitle(Timer:FlxTimer):Void
	{
		var title2:Title = new Title(80 * Reg.brickSize, 12 * Reg.brickSize + 56 * titleCount);
		title2.setData(++titleCount);
		add(title2);
		
		if (titleCount == Reg.titData.length-1) titTimer.cancel();
	}
	
	function everySecond(Timer:FlxTimer) :Void
	{
		var i:Int = 0;
		btnCont.clear();
		for (bldg in Reg.bldData) {
			if (bldg[0][1] < Reg.cash) {
				var bldBtn = new FlxButton(0, 30 * i, bldg[0][0] + " " + bldg[0][1] + "$");
				bldBtn.ID = i;
				bldBtn.onDown.callback = bldBtnCallback.bind(i);
				btnCont.add(bldBtn);
			}
			i++;
		}
	}
	private function bldBtnCallback(val:Int):Void
	{
		var bld:Building = new Building(FlxG.mouse.x, FlxG.mouse.y, true);
		bld.setData(val);
		add(bld);
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