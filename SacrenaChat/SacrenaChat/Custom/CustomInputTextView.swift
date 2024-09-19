//
//  CustomInputTextView.swift
//  SacrenaChat

import StreamChat
import StreamChatUI
import UIKit

class CustomInputTextView: InputTextView {
    
    override func handleTextChange() {
        super.handleTextChange()
        
        textColor = .white
    }
}
