# Add OneEntry SDK to your Swift project

It describes how to properly configure OneEntry Swift sdk

## Step 1: Create OneEntry project:
In order to create a OneEntry project, you need to create an account on our [site](https://account.oneentry.cloud/).

After that, go to the [projects](https://account.oneentry.cloud/projects) tab and create a new project.

## Step 2: Add OneEntry SDK to your app

@TabNavigator {
    @Tab("Swift Package Manager") {
        The [Swift Package Manager](https://www.swift.org/package-manager/) is a tool for automating the distribution of Swift code and is integrated into the swift compiler.

        Once you have your Swift package set up, adding OneEntry as a dependency is as easy as adding it to the dependencies value of your Package.swift.

        ```swift
        dependencies: [
            .package(url: "https://github.com/OneEntry/oneentry-ios-sdk", .upToNextMajor(from: "1.0.4"))
        ]
        ```
    }

    @Tab("CocoaPods") {
        [CocoaPods](https://cocoapods.org) is a dependency manager for Cocoa projects. For usage and installation instructions, visit their website. To integrate OneEntry into your Xcode project using CocoaPods, specify it in your `Podfile`:

        ```ruby
        pod 'OneEntry'
        ```

        > Note: 
        > **dyld[]: missing symbol called**
        > 
        > If you have this error as a result of installing Sdk, via CocoaPods, add the following code to your Podfile
        > 
        > ```ruby
        > post_install do |installer|
        >   installer.pods_project.targets.each do |target|
        >     target.build_configurations.each do |config|
        >       config.build_settings['BUILD_LIBRARY_FOR_DISTRIBUTION'] = 'YES'
        >     end
        >   end
        > end
        > 
        > target 'OneEntrySDKTest' do
        >   # Comment the next line if you don't want to use dynamic frameworks
        >   use_frameworks!
        > 
        >   # Pods for OneEntrySDKTest
        >   pod 'OneEntry'
        > end
        > ```
    }
}

## Step 3: Initialize OneEntry in your app

This is the final step you need to take in order to add OneEntry to your application.

> Important:
> Before using SDK classes and methods, you need to go through initialization.
> Otherwise there will be an error

@TabNavigator {
    @Tab("Application Token") {
        1. To initialize with an authorization token, you need to get a link to the project and the token. You can do this in the project settings in the tab `App tokens`

        2. Configure a `OneEntryCore` shared instance, before using SDK methods. The `application(_:didFinishLaunchingWithOptions:)` method is best suited for this.

            ```swift
            let token = "..."
            let url = "https://sample.oneentry.cloud"
            let credential = OneEntryTokenCredential(token: token)

            OneEntryCore.initializeApp(url, credentials: credential)
            ```
    }

    @Tab("MTLs Certificate") {
        > Important: iOS Sdk OneEntry uses .p12(PKCS#12) certificates for authorization. Such a certificate can be generated independently from the `key` & `certificate` pair or use the one provided by OneEntry

        In any case, you need to download the archive with certificates. You can do this in the project settings, in the `Application Certificates` tab

        The following files will be inside:
        - `.cert` - Certificate, encrypted in base64
        - `.csr` - Certificate request
        - `.key` - Key, encrypted in base64
        - `.p12` - The `Certificate` & `Key` bundle, encrypted in PKCS#12

        #### Using the built-in certificate

        1. Move the .p12 file to the project, make sure it is included in Target Membership
        2. Initialize the application. The `application(_:didFinishLaunchingWithOptions:)` method is best suited for this.

        > By default, OneEntry certificates do not have a password
           
        ```swift
        let url = "https://sample.oneentry.cloud"
        let name = "swift_certificate"
        let credential = OneEntryCertificateCredential(name: name)

        OneEntryCore.initializeApp(domain, credentials: credential)
        ```

        #### Generation of your .p12 certificate

        1. To do this, you will need a key(`.key`) and certificate(`.cert`) file, download them
        2. Generate .p12 with `openSSL`
            ```shell
            openssl pkcs12 -legacy -export -out certificate.p12 -inkey key.key -in cert.cert
            ```
        3.  Move the .p12 file to the project, make sure it is included in Target Membership
        4.  Using the certificate and password you specified when creating it, initialize the application. The `application(_:didFinishLaunchingWithOptions:)` method is best suited for this.
            ```swift
            let url = "https://sample.oneentry.cloud"
            let name = "swift_certificate"
            let password = "password"
            let credential = OneEntryCertificateCredential(name: certificate, password: password)

            OneEntryCore.initializeApp(domain, credentials: credential)
            ```
    }
}
