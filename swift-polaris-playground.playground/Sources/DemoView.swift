import Foundation
import UIKit

public class DemoView: UIView {
    public static var workingAPI: API? // Init API buffer
    public var lastTag = 0 // Init tag buffer

    /**
     Draws the DemoView.
    */
    override public init(frame: CGRect) {
        super.init(frame: frame) // Init with frame
        
        self.backgroundColor = UIColor.white // Set background color
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    /**
     Adds a label to the working DemoView saying a particular thing, s.
    */
    public func Say(s: String) {
        if lastTag != 0 { // Check has last tag
            self.viewWithTag(lastTag)!.removeFromSuperview() // Remove last view with tag
        }

        let label = UILabel(frame: CGRect(x: 0, y: 0, width: self.bounds.width, height: self.bounds.height)) // Init label
        label.center = CGPoint(x: self.bounds.width/2, y: self.bounds.height/2) // Set center

        label.textAlignment = NSTextAlignment.center // Set text alignment
        label.text = s // Set text
        label.font = UIFont.systemFont(ofSize: 18, weight: UIFont.Weight.medium) // Set font
        
        label.tag = 1 // Set tag
        self.lastTag = 1 // Set last tag

        self.addSubview(label) // Add label
    }
    
    /**
     Prompts the user with an input field, with the placeholder p.
    */
    public func Ask(p: String) {
        let textField = UITextField(frame: CGRect(x: 0, y: 0, width: self.bounds.width*0.75, height: 35)) // Init field
        
        textField.center = CGPoint(x: self.bounds.width/2, y: self.bounds.height/2) // Set center
        textField.textAlignment = NSTextAlignment.left // Set text alignment
        textField.placeholder = p // Set placeholder
        textField.font = UIFont.systemFont(ofSize: 18, weight: UIFont.Weight.medium) // Set font
        textField.borderStyle = UITextField.BorderStyle.roundedRect // Set border style
        
        textField.tag = 1 // Set tag
        self.lastTag = 1 // Set last tag
        
        self.addSubview(textField) // Add field
    }
    
    /**
     Prompts the user with an action.
    */
    public func Prompt(p: String) {
        let button = UIButton(type: .roundedRect) // Init button
        
        button.frame = CGRect(x: 0, y: 0, width: self.bounds.width*0.75, height: 35) // Set frame
        button.center = CGPoint(x: self.bounds.width/2, y: self.bounds.height/2) // Set center
        button.titleLabel?.textAlignment = NSTextAlignment.left // Set text alignment
        button.setTitle(p, for: .normal) // Set text
        button.titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: UIFont.Weight.medium) // Set font
        
        button.tag = 1 // Set tag
        self.lastTag = 1 // Set last tag
        
        self.addSubview(button) // Add field
    }
    
    /**
     Prompts the user with an action.
     */
    public func PromptExtensible(p: String) -> UIButton {
        let button = UIButton(type: .roundedRect) // Init button
        
        button.frame = CGRect(x: 0, y: 0, width: self.bounds.width*0.75, height: 35) // Set frame
        button.center = CGPoint(x: self.bounds.width/2, y: self.bounds.height/2) // Set center
        button.titleLabel?.textAlignment = NSTextAlignment.left // Set text alignment
        button.setTitle(p, for: .normal) // Set text
        button.titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: UIFont.Weight.medium) // Set font
        
        button.tag = 1 // Set tag
        self.lastTag = 1 // Set last tag
        
        return button // Return button
    }
}
