//
//  CustomComposerView.swift
//  SacrenaChat

import Foundation
import StreamChatUI
import UIKit

class CustomComposerView: ComposerView {
    override open func setUpLayout() {
        super.setUpLayout()
        leadingContainer.removeArrangedSubview(commandsButton)
        NSLayoutConstraint.activate([
            attachmentButton.leadingAnchor.constraint(equalTo: leadingContainer.leadingAnchor, constant: 10),
            attachmentButton.trailingAnchor.constraint(equalTo: leadingContainer.trailingAnchor, constant: -10),
            attachmentButton.widthAnchor.constraint(equalToConstant: 30),
            attachmentButton.heightAnchor.constraint(equalToConstant: 27),
            attachmentButton.centerYAnchor.constraint(equalTo: inputMessageView.container.centerYAnchor),
            inputMessageView.container.topAnchor.constraint(equalTo:centerContainer.topAnchor, constant: 15),
            inputMessageView.container.heightAnchor.constraint(equalToConstant: 32),
            sendButton.centerYAnchor.constraint(equalTo: inputMessageView.container.centerYAnchor),
            sendButton.leadingAnchor.constraint(equalTo: trailingContainer.leadingAnchor, constant: 10),
            sendButton.trailingAnchor.constraint(equalTo: trailingContainer.trailingAnchor, constant: -10),
            sendButton.widthAnchor.constraint(equalToConstant: 27),
            sendButton.heightAnchor.constraint(equalToConstant: 27),
        ])
        inputMessageView.container.layer.cornerRadius = 16
        inputMessageView.container.layer.borderColor = UIColor(red: 137.0/255.0, green: 137.0/255.0, blue: 137.0/255.0, alpha: 1.0).cgColor
        
        inputMessageView.textView.textColor = .white

    }
}

    
