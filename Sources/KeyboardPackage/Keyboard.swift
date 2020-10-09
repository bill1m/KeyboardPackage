//
//  Keyboard.swift
//  KeyboardRiptutorial
//
//  Created by Bill Morrison on 10/2/20.
//
//  derived from https://stackoverflow.com/questions/33474771/a-swift-example-of-custom-views-for-data-input-custom-in-app-keyboard/33692231#33692231

// https://riptutorial.com/ios/example/16976/create-a-custom-in-app-keyboard

#if os(iOS)
import UIKit

// The view controller will adopt this protocol (delegate)
// and thus must contain the keyWasTapped method
public protocol KeyboardDelegate: class {
    func keyWasTapped(character: String)
}

public class Keyboard: UIView {
    
    // This variable will be set as the view controller so that
    // the keyboard can send messages to the view controller.
    public weak var delegate: KeyboardDelegate?
    
    // MARK:- keyboard initialization
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    /// After this object has been init'd ... initialize the subview with the keyboard nib.
    public func loadKeyboardNib() {
        let xibFileName = "Keyboard" // xib extention not included
        guard let view = Bundle.module.loadNibNamed(xibFileName, owner: self, options: nil)![0] as? UIView else { fatalError("Unable to load Keyboard UIView") }
        self.addSubview(view)
        view.frame = self.bounds
    }
     
    // MARK:- Button actions from .xib file
    @IBAction func buttonAction(_ sender: UIButton) {
        guard let delegate = delegate else { return }
        delegate.keyWasTapped(character: sender.titleLabel!.text!)
    }
}
#endif
