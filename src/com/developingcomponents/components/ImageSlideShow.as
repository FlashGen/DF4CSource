package com.developingcomponents.components
{
	import com.developingcomponents.renderers.ImageSlideShowDefaultRenderer;
	import com.developingcomponents.skins.ImageSlideShowSkin;
	
	import flash.events.MouseEvent;
	
	import mx.core.ClassFactory;
	import mx.graphics.SolidColor;
	
	import spark.components.Button;
	import spark.components.Group;
	import spark.components.SkinnableDataContainer;
	import spark.primitives.Rect;
	
	[skinState("normal")]
	[skinState("disabled")]
	public class ImageSlideShow extends SkinnableDataContainer
	{
		
		private var _prevBtnVisible		:Boolean = false;
		private var _nextBtnVisible		:Boolean = true;
		
		[SkinPart(required="false")]
		public var nextButton		:Button;
		[SkinPart(required="false")]
		public var previousButton	:Button;
		
		public function ImageSlideShow()
		{
			super();
			setStyle("skinClass", ImageSlideShowSkin);
		}
		
		override protected function createChildren():void
		{
			super.createChildren();
		}
		
		override protected function commitProperties():void
		{
			super.commitProperties();
			
			if(itemRenderer == null)
				itemRenderer = new ClassFactory(com.developingcomponents.renderers.ImageSlideShowDefaultRenderer);
			autoLayout = true;
		}
		
		override protected function measure():void
		{
			super.measure();
		}
		
		override protected function updateDisplayList(unscaledWidth:Number, unscaledHeight:Number):void
		{
			super.updateDisplayList(unscaledWidth, unscaledHeight);
			this.setActualSize(unscaledWidth, unscaledHeight);
			
		}
		
		override protected function partAdded(partName:String, instance:Object):void
		{
			super.partAdded(partName, instance);
			
			if(partName == "nextButton")
			{
				instance.enabled = true;
				instance.addEventListener(MouseEvent.CLICK, nextBtnHandler);
			}
			
			if(partName == "previousButton")
			{
				instance.enabled = true;
				instance.visible = false;
				instance.addEventListener(MouseEvent.CLICK, previousBtnHandler);
			}
		}
		
		override protected function partRemoved(partName:String, instance:Object):void
		{
			super.partAdded(partName, instance);
			
			if(instance == nextButton)
				nextButton.removeEventListener(MouseEvent.CLICK, nextBtnHandler);
			
			if(instance == previousButton)
				previousButton.removeEventListener(MouseEvent.CLICK, previousBtnHandler);
			
		}
		
		/*
		The calculation in these button handlers are relatively simple  - if you wanted to use content 
		with arbitrary widths this will require a more granular calculation to take that in to consideration.
		
		Also they don't take in to consideration the actual layout of the items.
		*/
		protected function nextBtnHandler(e:MouseEvent):void
		{
			// T
			dataGroup.x -= (dataGroup.width / dataProvider.length);
			
			if(dataGroup.x == -(dataGroup.width - (dataGroup.width / dataProvider.length)) && _nextBtnVisible)
				nextButton.visible = _nextBtnVisible = false;
			
			if(!_prevBtnVisible)
				previousButton.visible = _prevBtnVisible = true;
		}
		
		protected function previousBtnHandler(e:MouseEvent):void
		{
			dataGroup.x += (dataGroup.width / dataProvider.length);
			
			if(dataGroup.x == 0 && _prevBtnVisible)
				previousButton.visible = _prevBtnVisible = false;
			
			if(!_nextBtnVisible)
				nextButton.visible = _nextBtnVisible = true;
		}
	}
}