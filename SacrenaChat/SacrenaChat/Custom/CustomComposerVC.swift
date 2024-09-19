//
//  CustomComposerVC.swift
//  SacrenaChat

import StreamChat
import StreamChatUI
import UIKit

class CustomComposerVC: ComposerVC {
    
    override func updatePlaceholderLabel() {
        super.updatePlaceholderLabel()
        
        composerView.inputMessageView.textView.placeholderLabel.text = "Message"
        composerView.inputMessageView.textView.textColor = .white
    }
    
    override func showAttachmentsPicker(sender: UIButton) {
        let isCameraAvailable = UIImagePickerController.isSourceTypeAvailable(.camera)

        if isCameraAvailable {
            showCamera()
        }
        else {
            showMediaPicker()
        }
    }
}
