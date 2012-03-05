package com.developingcomponents.components
{
	import mx.core.UIComponent;
	
	[DefaultProperty("MyDefaultProperty")]
	/**
	 * This is the class description. Use this to give an overview
	 * of your class and provide any example code if need be. 
	 * 
	 * <p>If you want to apply formatting you can do that via <strong>HTML tags</strong></p>
	 * 
	 * @author FlashGen
	 * 
	 * @mxml
	 *  <pre>
	 *  &lt;fgc:ASDocExample 
	 *    id="someValue"
	 *    source="someOtherValue"
	 *  /&gt;
	 *  </pre>
	 * 
	 * @see com.developingcomponents.components.ch14.ASDocSupportClass
	 * @see http://developer.flashgen.com
	 * 
	 * @includeExample ExampleOfASDocExample.mxml
	 */
	public class ASDocExample extends UIComponent
	{
		/**
		 * Event though I have comments for this variable, it won't
		 * be exported the variable itself is private. 
		 */ 
		private var _myPrivateVar    :String;
		
		public var addedByASDoc      :Boolean;
		
		/**
		 * This entry is added as it is not private or marked 
		 * &#64;private or uses the [Exclude] metadata tag.
		 */ 
		protected var myProtectedVar    :String = "myProtectedVar";
		
		/** 
		 * @private
		 * This entry is excluded as it is marked private.
		 */
		protected var myHiddenProtectedVar   :String = "myHiddenProtectedVar";
		
		
		/**
		 * This is the constructor, again you can add information 
		 * here about any parameters it may require and what they
		 * are used for. 
		 */ 
		public function ASDocExample()
		{
			super();
		}
		
		/**
		 * These are the only comments that are hand inserted. The 
		 * additional comments 
		 * about Binding are inserted because there is a [Bindable] 
		 * tag on this.
		 * 
		 * <p>Below is an example of the &lt;Listing&gt; tag</p>
		 * 
		 * 
		 * @example
		 * <listing>
		 * 
		 * public function get myValue():String
		 * {
		 *   _myPrivateVar;
		 * }
		 * 
		 * public function set myValue(val:String):void
		 * {
		 *   _myPrivateVar = val;
		 * }       
		 * </listing> 
		 * 
		 */
		[Bindable] 
		public function get myValue():String
		{
			return _myPrivateVar;
		}
		
		public function set myValue(val:String):void
		{
			_myPrivateVar = val; 
		}
		
		/**
		 * This is an example method with a return type and 
		 * parameter.
		 * 
		 * @param bool A Boolean value to be returned
		 * 
		 * @return Returns a boolean value
		 * 
		 * 
		 */ 
		public function MyMethod(bool:Boolean):Boolean
		{
			return true;
		} 
		
		/**
		 * @copy ASDocSupportClass#dummyMethod()
		 * 
		 */ 
		public function myDummyMethod(someValue:String):Array
		{
			return new Array();
		} 
	}
}