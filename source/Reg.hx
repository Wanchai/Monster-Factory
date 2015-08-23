package;

import flixel.tile.FlxTilemap;
import flixel.util.FlxSave;
import view.HUD;
import view.Title;

/**
 * Handy, pre-built Registry class that can be used to store
 * references to objects and other things for quick-access. Feel
 * free to simply ignore it or change it in any way you like.
 */
class Reg
{
	/**
	 * Generic levels Array that can be used for cross-state stuff.
	 * Example usage: Storing the levels of a platformer.
	 */
	public static var levels:Array<Dynamic> = [];
	/**
	 * Generic level variable that can be used for cross-state stuff.
	 * Example usage: Storing the current level number.
	 */
	public static var level:Int = 0;
	/**
	 * Generic scores Array that can be used for cross-state stuff.
	 * Example usage: Storing the scores for level.
	 */
	public static var scores:Array<Dynamic> = [];
	/**
	 * Generic score variable that can be used for cross-state stuff.
	 * Example usage: Storing the current score.
	 */
	public static var score:Int = 0;
	/**
	 * Generic bucket for storing different FlxSaves.
	 * Especially useful for setting up multiple save slots.
	 */
	public static var saves:Array<FlxSave> = [];
	
	public static var titles:Array<Title> = [];
	public static var buildings:Array<Dynamic> = [];
	
	public static var tileWidth:Int = 8;
	public static var tileHeight:Int = 8;
	public static var brickSize:Int = 8;
	
	public static var map:FlxTilemap;
	
	public static var cash:Int = 0;
	
	public static var hud:HUD;
	
	
	
	public static var config:Dynamic;
	public static var bldData:Array<Dynamic> = [];
	public static var titData:Array<Dynamic> = [];
	
}