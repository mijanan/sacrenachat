//
//  CustomSendButton.swift
//  SacrenaChat


import Foundation
import StreamChatUI
import UIKit


class CustomSendButton: SendButton {
    override open func setUpAppearance() {
        super.setUpAppearance()
        setImage(nil, for: .normal)
        setImage(nil, for: .disabled)
        setBackgroundImage(UIImage(systemName: "arrowshape.right.circle.fill")?.withTintColor(.white, renderingMode: .alwaysOriginal), for: .normal)
        setBackgroundImage(UIImage(systemName: "arrowshape.up.circle.fill")?.withTintColor(UIColor(red: 79.0/255.0, green: 79.0/255.0, blue: 79.0/255.0, alpha: 1.0), renderingMode: .alwaysOriginal), for: .disabled)
        
     //   self.tintColor = .white
        
    }
}

    


