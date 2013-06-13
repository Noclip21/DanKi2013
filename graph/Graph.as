package graph
{
	import def.*;
	import flash.geom.Point;
	import flash.display.MovieClip;
	
	
	public class Graph extends BaseMc
	{
		public static var objects :Array;
		
		public static const RED =		0xE06666;
		public static const GREEN =		0x93C47D;
		public static const BLUE =		0x6D9EEB;
		
		var _color :uint;
		
		
		var _w :Number;
		var _h :Number;
		
		static var _maxW :Number;
		static var _maxH :Number;
		static var _minW :Number;
		static var _minH :Number;
		
		
		var _points :Array;
		
		
		public function get graphW(){ return _w; }
		public function get graphH(){ return _h; }
		
		
		public function Graph(defParent :MovieClip,
							  posx		:Number,
							  posy		:Number,
							  w			:Number,
							  h			:Number,
							  defColor	:uint = RED)
		{
			super(defParent,posx,posy);
			
			if(!objects) objects = new Array();
			objects.push(this);
			
			_points = new Array();
			
			_w = w;
			_h = h;
			
			_color = defColor;
			
			BaseMc(this).destructor = Graph_destructor;
		}
		function Graph_destructor()
		{
			removePoints();
			Utils.removeObject(this,objects);
		}
		
		public function addPoint(p :Point)
		{
			if(_points.length <= 0)
			{
				_maxW = _minW = p.x;
				_maxH = _minH = p.y;
			}
				
			if(p.x > _maxW)			_maxW = p.x;
			else if(p.x < _minW)	_minW = p.x;
			if(p.y > _maxH)			_maxH = p.y;
			else if(p.y < _minH)	_minH = p.y;
			
			_points.push(p);
		}
		function removePoints()
		{
			_points = new Array();
		}
		function ajustPoint(p :Point)
		{
			return new Point(_w/(_maxW - _minW)*(p.x - _minW),_h -_h/(_maxH - _minH)*(p.y - _minH));
		}
		public function drawPoints()
		{
			graphics.clear();
			graphics.lineStyle(1,_color);
			for(var i=1; i<_points.length; ++i)
			{
				var p1 = ajustPoint(new Point(_points[i].x,_points[i].y));
				var p2 = ajustPoint(new Point(_points[i-1].x,_points[i-1].y));
				graphics.moveTo(p1.x,p1.y);
				graphics.lineTo(p2.x,p2.y);
				graphics.endFill();
			}
			removePoints();
		}
	}
}
