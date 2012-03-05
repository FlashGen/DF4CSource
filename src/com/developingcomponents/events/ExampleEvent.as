package com.developingcomponents.events
{
	import flash.events.Event;
	
	public class ExampleEvent extends Event
	{
		public static const DEFAULT_EVENT		:String = "defaultEvent";
		
		public var data			:Object;
		
		public function ExampleEvent(type:String, data:Object, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
			this.data = data;
		}
		
		override public function clone():Event
		{
			return new ExampleEvent(type, data, bubbles, cancelable);
		}
	}
}