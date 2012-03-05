package com.developingcomponents.components
{
	import flash.display.Graphics;
	import flash.display.Sprite;
	
	import mx.core.UIComponent;
	
	/**
	 * 
	 * @author Mike Jones
	 * @url http://blog.flashgen.com
	 * @created 2010-06-22 15:29:51
	 * @version 1.0.0
	 * 
	 * This class represent the changes made to you initial component so that 
	 * you can set the background color externally via MXML. It is not referenced 
	 * directly in the book as it is nothing more than an enhancement. However, 
	 * for ease of testing I opted to create a separate class to make it easier 
	 * to compare the two classes (MyFirstComponent and MyFirstComponent_Revsion4) 
	 * side by side.
	 */	
	public class MyFirstComponent_Revision4 extends UIComponent
	{
		private static const DEFAULT_HEIGHT :Number = 200;
		private static const DEFAULT_WIDTH  :Number = 200;
		
		private var _backgroundColor    :uint = 0xff0000;
		private var _ellipseColor		:uint = 0x0000ff;
		private var _ellipse  			:Sprite;
		
		
		public function MyFirstComponent_Revision4()
		{
			super();
		}
		
		override protected function commitProperties():void
		{
			super.commitProperties();
			invalidateDisplayList();
		}
		
		override protected function createChildren():void
		{
			super.createChildren();
			_ellipse = new Sprite(); 
			addChild(_ellipse); 
		}
		
		override protected function measure():void
		{
			super.measure();
			measuredMinHeight = measuredHeight = DEFAULT_HEIGHT;
			measuredMinWidth = measuredWidth = DEFAULT_WIDTH;
		}
		
		override protected function updateDisplayList(unscaledWidth:Number,
													  unscaledHeight:Number):void
		{
			super.updateDisplayList(unscaledWidth, unscaledHeight);
			
			height = unscaledHeight;
			width = unscaledWidth;
			
			var g       :Graphics  = this.graphics;
			
			g.clear();
			g.beginFill(_backgroundColor, 1);
			g.drawRect(0, 0, unscaledWidth, unscaledHeight);
			g.endFill();
			
			var eg      :Graphics = _ellipse.graphics;
			
			eg.clear()
			eg.beginFill(_ellipseColor, 1);
			eg.drawEllipse(0, 0, unscaledWidth, unscaledHeight);
			eg.endFill()
			
		}
		
		public function set backgroundColor(val:uint):void
		{
			_backgroundColor = val;
			invalidateProperties();
		}
		
		public function get backgroundColor():uint
		{
			return _backgroundColor;
		}

		public function set ellipseColor(val:uint):void
		{
			_ellipseColor = val;
			invalidateProperties();
		}
		
		public function get ellipseColor():uint
		{
			return _ellipseColor;
		}
		
		
	}
}