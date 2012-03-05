package com.developingcomponents.components
{
	import mx.graphics.SolidColor;
	import mx.states.AddItems;
	import mx.states.SetProperty;
	import mx.states.State;
	import mx.states.Transition;
	
	import spark.components.BorderContainer;
	import spark.components.Group;
	import spark.effects.Move;
	import spark.primitives.Rect;
	
	public class ActionScriptTransitionComponent extends BorderContainer
	{
		private static const DEFAULT_WIDTH  :uint = 320;
		private static const DEFAULT_HEIGHT :uint = 200;
		private var _move                :Move;
		private var _defaultTransition   :Transition;
		
		private var _defaultState        :State;
		private var _panelState          :State;       
		
		private var _defaultItems        :AddItems;
		private var _updatePanel         :SetProperty;
		private var _panel               :BorderContainer;
		
		private var _panelHeight         :int = 100;
		
		private var _mask                :Group;
		
		public function ActionScriptTransitionComponent()
		{
			super();
		}
		
		override protected function createChildren():void
		{
			super.createChildren();
			
			createMask();
			createPanel();
			createEffects();
			createStates();
			createTransitions();
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
		}
		
		protected function createPanel():void
		{
			_panel = new BorderContainer();
			_panel.setStyle("backgroundColor", 0x333333);
			_panel.percentWidth = 100;
			_panel.height = _panelHeight;
			_panel.y = this.height + _panelHeight*2;
			addElement(_panel);
		}
		
		protected function createMask():void
		{
			var _rect    :Rect = new Rect();
			_rect.fill = new SolidColor(0xff0000);
			_rect.width = DEFAULT_WIDTH;
			_rect.height = DEFAULT_HEIGHT;
			
			_mask = new Group();
			_mask.addElement(_rect);
			_mask.width = DEFAULT_WIDTH;
			_mask.height = DEFAULT_HEIGHT;
			addElement(_mask);
			this.mask = _mask;
		}
		
		protected function createEffects():void
		{
			_move = new Move();
			_move.yBy = -_panelHeight;
			_move.target = _panel;                     
		}
		
		protected function createStates():void
		{
			_defaultState = new State();
			_defaultState.name = "normal";
			_defaultItems = new AddItems();
			_defaultState.overrides.push(_defaultItems);
			
			_panelState = new State();
			_panelState.name = "panelView"
			_panelState.basedOn = "normal"
			
			_updatePanel = new SetProperty();
			_updatePanel.target = _panel;
			_updatePanel.name = "y";
			_updatePanel.value = this.height + _panelHeight;
			
			_panelState.overrides.push(_updatePanel);
			
			states.push(_defaultState, _panelState);
		}
		
		protected function createTransitions():void
		{
			_defaultTransition = new Transition();
			_defaultTransition.fromState = "*";
			_defaultTransition.toState = "panelView";
			_defaultTransition.effect = _move;
			transitions.push(_defaultTransition);
		}
	}
}