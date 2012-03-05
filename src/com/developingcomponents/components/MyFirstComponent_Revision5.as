package com.developingcomponents.components
{
	import flash.display.Graphics;
	
	import mx.core.Container;
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
	 * to compare the two classes (MyFirstComponent and MyFirstComponent_Revsion5) 
	 * side by side.
	 */	
	public class MyFirstComponent_Revision5 extends Container
	{
		private static const DEFAULT_HEIGHT :Number = 200;
		private static const DEFAULT_WIDTH  :Number = 200; 
		
		private var _ellipse        :UIComponent;
		
		public function MyFirstComponent_Revision5()
		{
			super();
			setStyle("backgroundColor", 0xff0000);
		}
		
		override protected function createChildren():void
		{
			super.createChildren();
			
			_ellipse = new UIComponent();
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
			
			var eg  :Graphics = _ellipse.graphics;
			
			eg.clear();
			eg.beginFill(0x0000ff, 1);
			eg.drawEllipse(0, 0, unscaledWidth, unscaledHeight);
			eg.endFill();
		}         
	}
}
