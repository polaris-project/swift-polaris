import Foundation
import Cocoa

public class DemoView: NSTextView {
    /**
     Draws the DemoView.
    */
    override public func draw(_ dirtyRect: NSRect) {
        super.draw(dirtyRect)

        NSColor.white.setFill() // Fil
        dirtyRect.fill() // Set background color
    }
    
    /**
     Adds a label to the working DemoView saying a particular thing, s.
    */
    public func Say(s: String) {
        self.textStorage?.append(NSAttributedString(string: "Hello World"))
    }
}
