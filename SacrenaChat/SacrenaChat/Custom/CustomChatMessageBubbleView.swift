//
//  CustomChatMessageBubbleView.swift
//  SacrenaChat


import StreamChat
import StreamChatUI
import UIKit

class CustomChatMessageBubbleView: ChatMessageBubbleView {

    override func setUpAppearance() {
        
    }
    
    override func layoutSubviews() {
           super.layoutSubviews()
           
           // Set a general corner radius
           layer.cornerRadius = 22
           
           // Specify which corners to mask
           layer.maskedCorners = [
               .layerMinXMinYCorner,  // Top-left
               .layerMaxXMinYCorner,  // Top-right
               .layerMaxXMaxYCorner   // Bottom-right
           ]
           
           // Set a different radius for the bottom-left corner
           let smallRadius: CGFloat = 8
           applySmallCornerRadius(to: [.layerMinXMaxYCorner], radius: smallRadius)
       }
       
       private func applySmallCornerRadius(to corners: CACornerMask, radius: CGFloat) {
           // Create a separate shape layer for the bottom-left corner
           let path = UIBezierPath(roundedRect: bounds,
                                   byRoundingCorners: [.bottomLeft],
                                   cornerRadii: CGSize(width: radius, height: radius))
           
           let maskLayer = CAShapeLayer()
           maskLayer.path = path.cgPath
           layer.mask = maskLayer
       }

    override func updateContent() {
        super.updateContent()

       // layer.cornerRadius = 15
    }
    

}


