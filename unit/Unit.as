package unit
{
	import def.*;
	import flash.geom.Point;
	
	
	public class Unit extends BaseMc
	{
		public static var objects :Array;
		
		
		var _speed :Number;
		
		
		public function get speed(){ return _speed; }
		
		public function set speed(n){ _speed = n; }
		
		
		public function Unit(origin :Point)
		{
			super(Main.game,origin.x,origin.y);
			
			if(!objects) objects = new Array();
			objects.push(this);
			
			BaseMc(this).destructor = Unit_destructor;
		}
		function Unit_destructor()
		{
			Utils.removeObject(this,objects);
		}
		
		public function movePoint(target :Point)
		{
			if(Utils.dist(pos,target) <= _speed)
			{
				pos = target;
				return true;
			}
			
			var ang = Utils.ang(this,target);
				avelx = Math.cos(ang)*_speed;
				avely = Math.sin(ang)*_speed;
				
			if(avelx > 0) scaleX = Math.abs(scaleX);
			if(avelx < 0) scaleX = -Math.abs(scaleX);
			
			return false;
		}
	}
	
}
