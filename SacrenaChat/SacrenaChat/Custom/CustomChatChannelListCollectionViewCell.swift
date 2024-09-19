//
//  CustomChatChannelListCollectionViewCell.swift
//  SacrenaChat

import Foundation
import StreamChatUI
import UIKit

class CustomChatChannelListCollectionViewCell: ChatChannelListCollectionViewCell {
    


    // Override preferredLayoutAttributesFitting to customize cell size
    override func preferredLayoutAttributesFitting(_ layoutAttributes: UICollectionViewLayoutAttributes) -> UICollectionViewLayoutAttributes {
        let attributes = super.preferredLayoutAttributesFitting(layoutAttributes)

        // Customize the height here
        let targetSize = CGSize(width: attributes.frame.width, height: 95) // Set your desired height

        // Calculate the size that fits the content
        let autoLayoutSize = contentView.systemLayoutSizeFitting(
            targetSize,
            withHorizontalFittingPriority: .required, // Ensure the width fits the collection view
            verticalFittingPriority: .fittingSizeLevel // Adjust height automatically
        )

        // Update the attributes' frame with the new size
        attributes.frame.size = autoLayoutSize
        
        
        
        return attributes
    }
    
    override open func setUpLayout() {
        super.setUpLayout()
        

    }
}
