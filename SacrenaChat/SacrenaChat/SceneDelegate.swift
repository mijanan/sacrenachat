//
//  SceneDelegate.swift
//  SacrenaChat

import UIKit
import StreamChat

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    
    let API_KEY: String = "xg6dy9xjv8jp"


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        // Use this method to optionally configure and attach the UIWindow `window` to the provided UIWindowScene `scene`.
        // If using a storyboard, the `window` property will automatically be initialized and attached to the scene.
        // This delegate does not imply the connecting scene or session are new (see `application:configurationForConnectingSceneSession` instead).
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = .init(windowScene: windowScene)
       // window?.windowScene = windowScene
     
        let config = ChatClientConfig(apiKey: .init("xg6dy9xjv8jp"))
        // Create an instance of ChatClient and share it using the singleton
        ChatClient.shared = ChatClient(config: config)
        
        let userId = "sacrena_alice"
        
        let token: Token =
 "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjoic2FjcmVuYV9hbGljZSJ9.Grb4ih17pMrOpaMoMPAAZTNdo4Qqq_R-93mzAEIshJU"
        
        Task {
            do {
                let connectedUser = try await ChatClient.shared.connectUser(
                    userInfo: .init(id: userId),
                    token: token
                )
                LogConfig.level = .info

                /// Step 3: create the ChannelList view controller
                let channelList = ViewController()

                let channelId = ChannelId(type: .messaging, id: "alice_bob_chat")
                let query = ChannelListQuery(filter: .containMembers(userIds: [userId, "sacrena_bob"]))
                                    channelList.controller = ChatClient.shared.channelListController(query: query)
                
                // Get the channel controller for this channel
                let channelController = ChatClient.shared.channelController(for: channelId)

                // Synchronize the channel to create it (if it doesn't already exist)
                channelController.synchronize { error in
                    if let error = error {
                        print("Failed to synchronize channel: \(error.localizedDescription)")
                    } else {
                        print("Channel synchronized or created successfully!")
                        
 
                    }
                }
                
                channelList.controller.delegate = channelList


                /// Step 4: similar to embedding with a navigation controller using Storyboard
                window?.rootViewController = UINavigationController(rootViewController: channelList)
                window?.rootViewController?.navigationController?.navigationBar.isHidden = true
                window?.makeKeyAndVisible()

            }
            catch {
                print("Error while connecting user...", error.localizedDescription)
            }
        }
    }
    
    func configureChatClient() async {
        
        let config = ChatClientConfig(apiKey: .init("xg6dy9xjv8jp"))
        // Create an instance of ChatClient and share it using the singleton
        ChatClient.shared = ChatClient(config: config)
        
        let userId = "sacrena_alice"
        
        let token: Token = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjoic2FjcmVuYV9hbGljZSJ9.Grb4ih17pMrOpaMoMPAAZTNdo4Qqq_R-93mzAEIshJU"
        
        Task {
            do {
                let connectedUser = try await ChatClient.shared.connectUser(
                    userInfo: .init(id: userId),
                    token: token
                )
            }
            catch {
                print("Error while connecting user...", error.localizedDescription)
            }
        }
        
 
    }

    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }

    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.

        // Save changes in the application's managed object context when the application transitions to the background.
        (UIApplication.shared.delegate as? AppDelegate)?.saveContext()
    }


}

