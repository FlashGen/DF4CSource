package com.developingcomponents.components
{
	import mx.core.DeferredInstanceFromFunction;
	import mx.states.AddItems;
	import mx.states.State;
	
	import spark.components.Button;
	import spark.components.Group;
	
	public class BasicStateComponent extends Group
	{
		private static const DEFAULT_WIDTH               :uint = 320;
		private static const DEFAULT_HEIGHT              :uint = 200;
		
		private var _stateNames	:Array = ["normal", 
										"myFirstState", 
										"mySecondState"];
		private var _count		:int;
		
		override protected function createChildren():void
		{
			super.createChildren();
			
			createStates();
		}
		
		protected function createStates():void
		{
			
			for(var i:int = 0; i < _stateNames.length; ++i)
			{
				_count = i;
				
				var _state       :State = new State();
				_state.name = _stateNames[i];
				
				var _items       :AddItems = new AddItems();
				_items.itemsFactory = new DeferredInstanceFromFunction(createButtonGroup);
				_state.overrides.push(_items);
				states.push(_state);
			}              
		}
		
		protected function createButtonGroup():Button
		{
			var _btn         :Button = new Button();
			_btn.label = _stateNames[_count];
			
			return _btn;                     
		}
	}
}
