package graph
{
	import def.*;
	import flash.display.MovieClip;
	import flash.geom.Point;
	
	
	public class Histogram extends Graph
	{
		public static var objects :Array;
		
		var _buffer :Array;
		
		
		public function Histogram(defParent		:MovieClip,
								  defBufferSize :Number,
								  posx			:Number,
								  posy			:Number,
								  w				:Number,
								  h				:Number,
								  color			:uint = Graph.RED)
		{
			super(defParent,posx,posy,w,h,color);
			
			if(!objects) objects = new Array();
			objects.push(this);
			
			_buffer = new Array();
			for(var i=0; i<defBufferSize; ++i)
				_buffer.push(0);
			
			BaseMc(this).destructor = Histogram_destructor;
		}
		function Histogram_destructor()
		{
			Utils.removeObject(this,objects);
		}
		
		public function addNumber(n :Number)
		{
			_buffer.push(n);
			_buffer.splice(0,1);
		}
		public function drawHistogram()
		{
			for(var i=0; i<_buffer.length; ++i)
				addPoint(new Point(i*10,_buffer[i]));
			drawPoints();
		}
	}
}
