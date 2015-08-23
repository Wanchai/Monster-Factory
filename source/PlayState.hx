package;

import flixel.addons.display.FlxGridOverlay;
import flixel.effects.FlxFlicker;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.group.FlxSpriteGroup;
import flixel.text.FlxText;
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
		
		titTimer = new FlxTimer(15, addTitle, 0);
		
		var bk:FlxSprite = new FlxSprite(0, 0, AssetPaths.bk__png);
		add(bk);
		//add(FlxGridOverlay.create(Reg.brickSize, Reg.brickSize, -1, -1, false, true, 0x11ffffff, 0x22ffffff));
		
		Reg.cash = 0;
		Reg.map = new FlxTilemap();
		Reg.map.loadMap(FlxStringUtil.imageToCSV("assets/images/100.png", false, 1), "assets/images/black_tile.png");
		add(Reg.map);
		
		var txt:FlxText = new FlxText(20, 160, 120, "Build", 14);
		add(txt);
		btnCont = new FlxSpriteGroup(20, 200);
		add(btnCont);
		
		var bld:Building = new Building(45 * Reg.brickSize, 31 * Reg.brickSize);
		add(bld);
		
		var title2:Title = new Title(80 * Reg.brickSize, 6 * Reg.brickSize);
		title2.setData(0);
		add(title2);
		
		Reg.hud = new HUD();
		add(Reg.hud);
		
		new FlxTimer(1, everySecond, 0);

	}
	
	function addTitle(Timer:FlxTimer):Void
	{
		var title2:Title = new Title(80 * Reg.brickSize, 12 * Reg.brickSize + 56 * titleCount);
		title2.setData(++titleCount);
		add(title2);
		
		if (titleCount == Reg.titData.length-1) titTimer.cancel();
	}
	
	function everySecond(Timer:FlxTimer):Void
	{
		var i:Int = 0;
		btnCont.clear();
		for (bldg in Reg.bldData) {
			if (bldg[0][1] <= Reg.cash) {
				var bldBtn = new FlxButton(0, 30 * i, bldg[0][0] + " " + bldg[0][1] + "$");
				bldBtn.ID = i;
				bldBtn.onUp.callback = bldBtnCallback.bind(i);
				btnCont.add(bldBtn);
			}
			i++;
		}
		if (Reg.titles.length == 0 || (Reg.buildings.length == 0 && Reg.cash < Reg.bldData[0][0][1]) || Reg.cash < -5) {
			gameOver();
		}
	}
	
	function gameOver() 
	{
		FlxG.switchState(new GameOver());
	}
	private function bldBtnCallback(val:Int):Void
	{
		if (Reg.cash >= Std.int(Reg.bldData[val][0][1]))
		{
			var bld:Building = new Building(FlxG.mouse.x - 40, FlxG.mouse.y - 20, true);
			bld.setData(val);
			add(bld);
			Reg.cash -= Std.int(bld.data[0][1]);
		}
	}
	
	override public function destroy():Void
	{
		super.destroy();
		titTimer.cancel();
	}

	override public function update():Void
	{
		super.update();
	}
	
}