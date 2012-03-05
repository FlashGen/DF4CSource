package com.developingcomponents.components
{
	import flash.text.TextField;
	
	import mx.core.UIComponent;
	
	[DefaultProperty("text")]
	public class DefaultPropertyComponent extends UIComponent
	{
		
		private static const DEFAULT_WIDTH    :uint = 320;
		private static const DEFAULT_HEIGHT   :uint = 200;
		
		private var _defaultText    :String;
		private var _textField	     :TextField;
		
		public function DefaultPropertyComponent()
		{
			super();
		}
		
		override protected function createChildren():void
		{
			super.createChildren();
			_textField = new TextField();
			addChild(_textField);
		}
		
		override protected function measure():void
		{
			super.measure();
			
			this.measuredWidth = this.measuredMinWidth = DEFAULT_WIDTH;
			this.measuredHeight = this.measuredMinHeight = DEFAULT_HEIGHT;
		}
		
		override protected function updateDisplayList(unscaledWidth:Number,
													  unscaledHeight:Number):void
		{
			super.updateDisplayList(unscaledWidth, unscaledHeight);
			
			this.setActualSize(unscaledWidth, unscaledHeight);
			_textField.text = _defaultText;
		}
		
		public function get text():String
		{
			return _defaultText;
		}
		
		public function set text(value:String):void
		{
			if(value)
				_defaultText = value;
		}
	}
}