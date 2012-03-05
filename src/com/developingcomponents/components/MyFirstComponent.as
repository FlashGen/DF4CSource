package com.developingcomponents.components
{
	import flash.display.Graphics;
	
	import mx.core.UIComponent;
	
	public class MyFirstComponent extends UIComponent
	{
		private static const DEFAULT_HEIGHT :Number = 200;
		private static const DEFAULT_WIDTH  :Number = 200;
		
		public function MyFirstComponent()
		{
			super();
		}
		
		override protected function createChildren():void
		{
			super.createChildren();
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
			g.beginFill(0xff0000, 1);
			g.drawRect(0, 0, unscaledWidth, unscaledHeight);
			g.endFill();
		}

	}
}