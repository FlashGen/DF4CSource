package com.developingcomponents.components
{
	import mx.core.IDeferredInstance;
	import mx.core.UIComponent;
	
	import spark.components.Button;
	import spark.components.Group;
	import spark.layouts.HorizontalLayout;
	import spark.layouts.supportClasses.LayoutBase;
	
	public class DeferredInstanceTemplateExample extends UIComponent
	{
		private static const DEFAULT_WIDTH  :uint = 200;
		private static const DEFAULT_HEIGHT :uint = 30;
		
		private var _controlBar     :Group;
		private var _layout         :LayoutBase;
		
		[Bindable]
		[ArrayElementType("mx.core.IDeferredInstance")]
		public var controlBar       :Array;
		
		public function DeferredInstanceTemplateExample()
		{
			super();
			_layout = new HorizontalLayout();
		}
		
		override protected function createChildren():void
		{
			super.createChildren();
			_controlBar = new Group(); 
			_controlBar.layout = _layout;   
			addChild(_controlBar);     
		}
		
		override protected function commitProperties():void
		{
			super.commitProperties();
			createDeferredItems();
		}
		
		override protected function measure():void
		{
			super.measure()
			
			measuredWidth = measuredMinWidth = DEFAULT_WIDTH;
			measuredHeight = measuredMinHeight = DEFAULT_HEIGHT;
			_controlBar.setActualSize(DEFAULT_WIDTH, DEFAULT_HEIGHT);
		}
		
		override protected function updateDisplayList(unscaledWidth:Number, unscaledHeight:Number):void
		{
			super.updateDisplayList(unscaledWidth, unscaledHeight);
			
			width = unscaledWidth;
			height = unscaledHeight;
			_controlBar.setActualSize(width, height);
		}
		
		private function createDeferredItems():void
		{     
			for (var i :int = 0; i < controlBar.length; i++) 
			{
				_controlBar.addElement(Button(
					IDeferredInstance(
						controlBar[i]).getInstance()));
			}  
		}
		
		public function get layout():LayoutBase
		{
			return _layout;
		}
		
		public function set layout(value:LayoutBase):void
		{
			_layout = value;
			_controlBar.layout = value;
		}
	}
}
