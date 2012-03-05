package com.developingcomponents.components
{
	import com.developingcomponents.skins.MyFirstComponentSkin;
	
	import spark.components.supportClasses.SkinnableComponent;
	
	public class MyFirstComponent_Revision7 extends SkinnableComponent
	{
		private static const DEFAULT_HEIGHT :Number = 200;
		private static const DEFAULT_WIDTH  :Number = 200; 
		
		public function MyFirstComponent_Revision7()
		{
			super();
			setStyle("skinClass",
				com.developingcomponents.skins.MyFirstComponentSkin);
		}
		
		override protected function measure():void
		{
			super.measure();
			measuredMinHeight = measuredHeight = DEFAULT_HEIGHT;
			measuredMinWidth = measuredWidth = DEFAULT_WIDTH;    
		}
	}
}
