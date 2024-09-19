//
//  CustomAttachmentButton.swift
//  SacrenaChat


import Foundation
import StreamChatUI
import UIKit


class CustomAttachmentButton: AttachmentButton {
    override open func setUpAppearance() {
        super.setUpAppearance()
        setImage(nil, for: .normal)
        setBackgroundImage(UIImage(systemName: "camera")?.withTintColor(.white, renderingMode: .alwaysOriginal), for: .normal)
        
       // self.tintColor = .white
        
        
    }
}

    

