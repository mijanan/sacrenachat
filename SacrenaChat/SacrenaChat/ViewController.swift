//
//  ViewController.swift
//  SacrenaChat


import UIKit
import StreamChat
import StreamChatUI

class ViewController: ChatChannelListVC, ChatChannelControllerDelegate, UICollectionViewDelegateFlowLayout {
    
    var tableView: UITableView?
    
    let headerLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Courier-Bold", size: 18.0)
        label.text = "Connections"
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
      //  label.backgroundColor = .red
        return label
    }()
    
    
    override func setUpAppearance() {
        super.setUpAppearance()
       
        navigationController?.navigationBar.isHidden = true
        
        for channel in channels {
            
        }
        
    }
    
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.isHidden = true

    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.navigationBar.isHidden = false

    }
    
    
    override func setUpLayout() {
        self.view.backgroundColor =  UIColor(red: 39.0/255.0, green: 39.0/255.0, blue: 39.0/255.0, alpha: 1.0)
        super.setUpLayout()
        
        // Add the header label above the collection view
        super.view.addSubview(headerLabel)
        
        // Add constraints to position the label at the top
        NSLayoutConstraint.activate([
            headerLabel.topAnchor.constraint(equalTo: super.view.safeAreaLayoutGuide.topAnchor, constant: 15),
            headerLabel.leadingAnchor.constraint(equalTo: super.view.leadingAnchor, constant: 25),
            headerLabel.heightAnchor.constraint(equalToConstant: 30)
        ])
        
        // Modify the cell appearance for the selected state
                let appearance = ChatChannelListCollectionViewCell.appearance()
                
                // Set the background color for selected state
                appearance.selectedBackgroundView = UIView()
                appearance.selectedBackgroundView?.backgroundColor = .red // Your custom selection color
        
        
        // Adjust the collection view constraints to be below the label
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: headerLabel.bottomAnchor, constant: 0),
            collectionView.leadingAnchor.constraint(equalTo: super.view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: super.view.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: super.view.bottomAnchor)
        ])
        
        Appearance.default.colorPalette.background =  UIColor(red: 39.0/255.0, green: 39.0/255.0, blue: 39.0/255.0, alpha: 1.0)
        
        Appearance.default.colorPalette.highlightedBackground =  .clear
        
        Appearance.default.colorPalette.subtitleText = UIColor(red: 170.0/255.0, green: 170.0/255.0, blue: 170.0/255.0, alpha: 1.0)
        
        Appearance.default.colorPalette.background6 = UIColor(red: 215.0/255.0, green: 254.0/255.0, blue: 98.0/255.0, alpha: 1.0)
        
        Appearance.default.colorPalette.background7 = .clear
        
        Appearance.default.colorPalette.border = UIColor(red: 79.0/255.0, green: 79.0/255.0, blue: 79.0/255.0, alpha: 1.0)
        
         
         
        Appearance.default.images.sendArrow = UIImage(systemName: "arrowshape.up.circle.fill")!
        
        Appearance.default.colorPalette.alternativeActiveTint = UIColor(red: 215.0/255.0, green: 254.0/255.0, blue: 98.0/255.0, alpha: 1.0)
    }
    
    override func setUp() {
        super.setUp()
        
        // Set the delegate for the collection view
        collectionView.delegate = self
        
        //collectionView.isHidden = true
        
        
        // Customizing the navigation bar for this specific view controller
//                let appearance = UINavigationBarAppearance()
//                appearance.configureWithOpaqueBackground()
//                appearance.backgroundColor = .clear // Set a custom background color for the nav bar
//        
        for view in navigationController!.navigationBar.subviews {
            print("Nav...", view)
            if view.subviews.count > 0 {
                for v in view.subviews {
                    if let label = v as? UILabel {
                        label.isHidden = true
                    }
                }
            }
        }
        
        navigationItem.backBarButtonItem?.tintColor = .white


       }
    
  
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (self.view.frame.size.width - 50) // / 3 //some width
        let height = 150.0// width * 1.5 //ratio
        return CGSize(width: width, height: height)
    }
    
    
    
    func channelController(
            _ channelController: ChatChannelController,
            didUpdateMessages changes: [ListChange<ChatMessage>]
        ) {
            // animate the changes to the message list
        }
    func setupView() {
        let title = UILabel()
        title.font = UIFont(name: "Courier-Bold", size: 18.0)
        title.text = "Connections"
        title.textColor = .white
        title.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(title)
        
        tableView = UITableView()
        tableView?.backgroundColor = .clear
        tableView?.rowHeight = 95
        view.addSubview(tableView!)
        
        
        NSLayoutConstraint.activate([
 
            title.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 80),
            title.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 25),
            
            tableView!.topAnchor.constraint(equalTo: title.bottomAnchor, constant: 25),
            tableView!.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: 25),
            tableView!.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 25),
            tableView!.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: 25),
            
        ])
    }
    
    
    
}


extension ChatChannelListVC {
    
}


