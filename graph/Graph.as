package graph
{
	import def.*;
	import flash.geom.Point;
	import flash.display.MovieClip;
	
	
	public class Graph extends BaseMc
	{
		public static var objects :Array;
		
		static const color :uint = 0xFF0000;
		
		
		var _w :Number;
		var _h :Number;
		
		static var _maxW :Number;
		static var _maxH :Number;
		static var _minW :Number;
		static var _minH :Number;
		
		
		var _points :Array;
		
		
		public function set point(p :Point)
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
		
		
		public function Graph(defParent :MovieClip,
							  posx		:Number,
							  posy		:Number,
							  w			:Number,
							  h			:Number)
		{
			
			super(defParent,posx,posy);
			if(!objects) objects = new Array();
			objects.push(this);
			
			_points = new Array();
			
			_w = w;
			_h = h;
			
			BaseMc(this).destructor = Graph_destructor;
		}
		function removePoints()
		{
			_points = new Array();
		}
		function Graph_destructor()
		{
			removePoints();
			Utils.removeObject(this,objects);
		}
		function ajustPoint(p :Point)
		{
			return new Point(_w/(_maxW - _minW)*(p.x - _minW),_h -_h/(_maxH - _minH)*(p.y - _minH));
		}
		public function drawPoints()
		{
			graphics.clear();
			graphics.lineStyle(1,0xff0000);
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
