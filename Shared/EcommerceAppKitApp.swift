//
//  EcommerceAppKitApp.swift
//  Shared
//
//  Created by Balaji on 26/11/21.
//

import SwiftUI
import BranchSDK

@main
struct EcommerceAppKitApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    var body: some Scene {
        WindowGroup {
            ContentView()
                .onOpenURL(perform: { url in
                    Branch.getInstance().handleDeepLink(url)
                })
        }
    }
}

class AppDelegate: UIResponder, UIApplicationDelegate {
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]? = nil) -> Bool {
        
        // Branch.io - Test your Branch Integration by calling validateSDKIntegration in your AppDelegate. Check your Xcode logs to make sure all the SDK Integration tests pass. Make sure to comment out or remove validateSDKIntegration in your production build.
        // Branch.getInstance().validateSDKIntegration()
        
        // Branch.io - Function used to enable Branch logging
        Branch.getInstance().enableLogging()
        
        // Initialize Branch SDK
        Branch.getInstance().initSession(launchOptions: launchOptions) { (params, error) in
            // do stuff with deep link data (nav to page, display content, etc)
            print(params as? [String: AnyObject] ?? {})
            
        }
        return true
    }
}
