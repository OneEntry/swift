//
//  AppDelegate.swift
//  OneEntry Sdk Sample
//
//  Created by Archibbald on 22.01.2024.
//  Copyright © 2024 OneEntry. All rights reserved.
//

import UIKit
import OneEntry
import SwiftyBeaver

final class AppDelegate: NSObject, UIApplicationDelegate {    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        // MARK: - OneEntry init
        let domain = "https://sdk-sample.oneentry.cloud"
        let credential = OneEntryCertificateCredential(name: "certificate")
        
        OneEntryCore.initializeApp(domain, credentials: credential)
        
        // MARK: - Logging init
        let log = SwiftyBeaver.self
        let console = ConsoleDestination()
        let file = FileDestination()
        
        console.format = "$DHH:mm:ss$d $L $M"
        
        log.addDestination(console)
        log.addDestination(file)
        
        return true
    }
}
