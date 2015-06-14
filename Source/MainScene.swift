import Foundation

class MainScene: CCNode {
    
    var limit : Float = 0.5
    var time : Float = 0.0
    var touched : Bool = false
    var startX : CGFloat = 0.0
    var endX : CGFloat = 0.0
    
    var view : CCGLView!
    var screenDimensions : CGRect = UIScreen.mainScreen().bounds
    var screenHeight : CGFloat = UIScreen.mainScreen().bounds.size.height
    var screenWidth : CGFloat = UIScreen.mainScreen().bounds.size.width
    
    func didLoadFromCCB () {
        self.userInteractionEnabled = true
    }
    
    override func update (delta: CCTime) {
        
        time = (touched) ? time + Float(delta) : 0.0
        
        if (time > limit) {
            println("too slow")
        }
    }
    
    override func touchBegan (touch: CCTouch!, withEvent event: CCTouchEvent!) {
        startX = touch.locationInView(self.view).x / screenWidth
        touched = true
    }
    
    override func touchEnded (touch: CCTouch!, withEvent event: CCTouchEvent!) {
        endX = touch.locationInView(self.view).x / screenWidth
        
        if (startX > endX) {
            println("left")
        }
        else if (startX < endX) {
            println("right")
        }
        else {
            println("no swipe")
        }
        
        touched = false
    }
}
