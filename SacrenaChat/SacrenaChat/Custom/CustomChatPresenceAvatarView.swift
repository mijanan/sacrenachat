//
//  CustomChatPresenceAvatarView.swift
//  SacrenaChat


import Foundation
import StreamChatUI
import UIKit

class CustomChatPresenceAvatarView: ChatPresenceAvatarView {
    
    override func setUpLayout() {
        super.setUpLayout()
        
        NSLayoutConstraint.activate([
            onlineIndicatorView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -1),
            onlineIndicatorView.leftAnchor.constraint(equalTo: leftAnchor, constant: 1),
            onlineIndicatorView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.2)
        ])
        
    }
}
