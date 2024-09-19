//
//  CustomChatMessageContentView.swift
//  SacrenaChat


import StreamChat
import StreamChatUI
import UIKit

class CustomChatMessageContentView: ChatMessageContentView {
    
    override init(frame: CGRect) {
            super.init(frame: frame)
            
            // Add 30 points extra height to the bubble content container
            
                
            
        }
        
        required init?(coder: NSCoder) {
            super.init(coder: coder)
        }

    override func layout(options: ChatMessageLayoutOptions) {
        
        var updatedOptions = options
        updatedOptions.insert(.continuousBubble)
        updatedOptions.remove(.deliveryStatusIndicator)
        
        super.layout(options: updatedOptions)
        
        layoutOptions = updatedOptions
        
        // Add timestamp label to the bubble view
        if let bubbleView = bubbleView, let timestampLabel = timestampLabel {
            bubbleView.addSubview(timestampLabel)
            
            // Setup constraints for the timestamp label
            if content?.isSentByCurrentUser == true {
                NSLayoutConstraint.activate([
                    timestampLabel.bottomAnchor.constraint(equalTo: bubbleView.bottomAnchor, constant: -4),
                    timestampLabel.leadingAnchor.constraint(equalTo: bubbleView.leadingAnchor, constant: 8),
                    //   bubbleView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 65)
                    // Ensure the timestamp label is below the message text
                    //  timestampLabel.topAnchor.constraint(greaterThanOrEqualTo: textView?.bottomAnchor ?? bubbleView.bottomAnchor, constant: 4)
                    
                ])
            } else {
                NSLayoutConstraint.activate([
                    timestampLabel.bottomAnchor.constraint(equalTo: bubbleView.bottomAnchor, constant: -4),
                    timestampLabel.trailingAnchor.constraint(equalTo: bubbleView.trailingAnchor, constant: -8),

                ])
            }
        }
        
    }

    override func updateContent() {
        super.updateContent()
        

        // Check if the message was sent by the current user
                if content?.isSentByCurrentUser == true {
                    
                    // Align to the right for the current user
                    flipMessageBubble()
                    NSLayoutConstraint.activate([

                        bubbleView!.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 100),
                        bubbleView!.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10)
                        // Ensure the timestamp label is below the message text
                       //  timestampLabel.topAnchor.constraint(greaterThanOrEqualTo: textView?.bottomAnchor ?? bubbleView.bottomAnchor, constant: 4)
                                    
                    ])
                } else {
                    // Align to the left for other users
                    resetMessageBubble()
                    NSLayoutConstraint.activate([

                        bubbleView!.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 55),
                        bubbleView!.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -65)
                        // Ensure the timestamp label is below the message text
                       //  timestampLabel.topAnchor.constraint(greaterThanOrEqualTo: textView?.bottomAnchor ?? bubbleView.bottomAnchor, constant: 4)
                                    
                    ])
                }

        

        
    }
    
    // Flip the bubble for current user (right-aligned)
        private func flipMessageBubble() {
            // Adjust layout to align the message bubble to the right
            bubbleView?.transform = CGAffineTransform(scaleX: -1.0, y: 1.0)
            
            // Also flip the text or any other content within the bubble to stay readable
            textView?.transform = CGAffineTransform(scaleX: -1.0, y: 1.0)
            
            timestampLabel?.transform = CGAffineTransform(scaleX: -1.0, y: 1.0)

        }

        // Reset the bubble for other users (left-aligned)
        private func resetMessageBubble() {
            // Reset the transformations
            bubbleView?.transform = .identity
            textView?.transform = .identity
            
            
        }

}

