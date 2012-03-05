package com.developingcomponents.components
{
	import com.developingcomponents.events.ExampleEvent;
	
	import flash.events.MouseEvent;
	
	import mx.core.UIComponent;
	
	import spark.components.Button;
	
	[Event(name="defaultEvent", type="com.developingcomponents.events.ExampleEvent")]
	public class EventDispatchingComponent extends UIComponent
	{
		private var _submitBtn    :Button;
		private var _data         :Object;
		
		override protected function createChildren():void
		{
			super.createChildren();
			_submitBtn = new Button();
			_submitBtn.label = "Submit";
			_submitBtn.setActualSize(100, 50);
			_submitBtn.addEventListener(MouseEvent.CLICK, createPayload);
			addChild(_submitBtn);
		}
		
		protected function createPayload(e:MouseEvent):void
		{
			_data = {name:"Event Component", typed:false, id:1};
			dispatchEvent(new ExampleEvent(ExampleEvent.DEFAULT_EVENT, _data));
		}
	}
}
