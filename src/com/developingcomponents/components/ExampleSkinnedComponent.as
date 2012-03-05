package com.developingcomponents.components
{
	import com.developingcomponents.skins.ExampleSkinnedComponentSkin;
	
	import flash.events.MouseEvent;
	
	import spark.components.Button;
	import spark.components.supportClasses.SkinnableComponent;
	
	public class ExampleSkinnedComponent extends SkinnableComponent
	{
		private var _prevBtnVisible    :Boolean = false;
		
		[SkinPart(required="true")]
		public var nextButton     :Button;
		[SkinPart(required="true")]
		public var previousButton :Button;
		
		public function ExampleSkinnedComponent()
		{
			super();
			setStyle("skinClass", ExampleSkinnedComponentSkin);
		}
		
		override protected function partAdded(partName:String, 
											  instance:Object):void
		{
			if(partName == "nextButton")
			{
				instance.addEventListener(MouseEvent.CLICK, nextBtnHandler);
			}
			
			if(partName == "previousButton")
			{                            
				instance.addEventListener(MouseEvent.CLICK, previousBtnHandler);
			}
		}
		
		override protected function partRemoved(partName:String, 
												instance:Object):void
		{
			if(partName == "nextButton")
				instance.addEventListener(MouseEvent.CLICK, nextBtnHandler);
			
			if(partName == "previousButton")
				instance.addEventListener(MouseEvent.CLICK, previousBtnHandler);
		}
		
		protected function nextBtnHandler(e:MouseEvent):void       
		{
			// handle 'nextButton' click here
		}
		
		protected function previousBtnHandler(e:MouseEvent):void       
		{
			// handle 'previousButton' click here              
		}
	}
}