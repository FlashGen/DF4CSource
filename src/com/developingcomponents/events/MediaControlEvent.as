package com.developingcomponents.events
{
	import flash.events.Event;
	
	/**
	 * 
	 * @author Mike Jones
	 * @url http://blog.flashgen.com
	 * @created 2010-02-24 20:32:51
	 * @version 1.0.0
	 * 
	 * This event is for illustrative purposes and isn't used in any of the 
	 * examples
	 * 
	 */	
	public class MediaControlEvent extends Event
	{
		public static const PAUSE      :String = "pause" 
		public static const PLAY       :String = "play"; 
		
		public static const STOP       :String = "stop"; 
		
		public static const FORWARD    :String = "forward";
		public static const REWIND     :String = "rewind"; 
		
		public static const MUTE       :String = "mute"; 
		public static const SCRUB      :String = "scrub";
		
		public var data                :Object;
		
		public function MediaControlEvent(type:String, data:Object, 
										  bubbles:Boolean=false, 
										  cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
			this.data = data;
		}
		
		override public function clone():Event
		{
			return new MediaControlEvent(type, data, bubbles, cancelable);
		}
	}
}
