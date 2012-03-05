package com.developingcomponents.events
{
  import flash.events.Event;
       
  public class SimpleFlashComponentEvent extends Event
  {
    public static const OPEN       :String = "open";
    public static const CLOSE      :String = "close";
    public static const OPENING    :String = "opening";
    public static const CLOSING   :String = "closing";
              
    public function SimpleFlashComponentEvent (type:String, 
                                               bubbles:Boolean=false, 
                                               cancelable:Boolean=false)
    {
      super(type, bubbles, cancelable);
    }

    override public function clone():Event
    {
      return new SimpleFlashComponentEvent(type, bubbles, cancelable); 
    }
  }
}
