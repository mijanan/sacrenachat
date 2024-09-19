//
//  CustomChatChannelListItemView.swift
//  SacrenaChat


import Foundation
import StreamChatUI
import UIKit

class CustomChatChannelListItemView: ChatChannelListItemView {
    

    override func setUpLayout() {
        super.setUpLayout()
        
        NSLayoutConstraint.activate([
            avatarView.heightAnchor.constraint(equalToConstant: 59),
            avatarView.widthAnchor.constraint(equalTo: avatarView.heightAnchor)
        ])
        
        titleLabel.textColor = .white
        
        subtitleLabel.textColor = UIColor(red: 170.0/255.0, green: 170.0/255.0, blue: 170.0/255.0, alpha: 1.0)
        
        timestampLabel.isHidden = true
        
       // subtitleImageView.isHidden = true
        //subtitleContainer.removeArrangedSubview(subtitleImageView)
        
    }
    
    override open func updateContent() {
        
        
        super.updateContent()
        
        unreadCountView.isHidden = true
        previewMessageDeliveryStatusView.isHidden = true
        
        subtitleLabel.text = subtitleText?.replacingOccurrences(of: "You: ", with: "")
        

    }
}
