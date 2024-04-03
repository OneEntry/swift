Pod::Spec.new do |spec|
    spec.name = 'OneEntry'
    spec.version = '1.1.8'
    spec.license = { :type => 'OWN', :file => 'LICENSE.txt' }
    spec.homepage = 'https://github.com/OneEntry/oneentry-ios-sdk'
    spec.summary = 'Adds Swift classes for easy integration with OneEntry'
    spec.authors = { 'ONEENTRY PORTAL CO' => 'swift@oneentry.cloud' }
    spec.documentation_url = 'https://github.com/OneEntry/oneentry-ios-sdk'    
    
    spec.dependency 'HMNetworking'
    spec.source = {
      :http => 'https://oneentry.s3.amazonaws.com/SWIFT/XCFrameworks/1.1.8/XCFrameworks.zip'
    }

    spec.platform = :ios
    spec.platform = :osx
    spec.platform = :tvos
    spec.platform = :watchos
    
    spec.vendored_frameworks = 'OneEntry.xcframework'

    spec.swift_version = '5.0'
    spec.ios.deployment_target = '13.0'
    spec.osx.deployment_target = '10.15'
    spec.tvos.deployment_target = '13.0'
    spec.watchos.deployment_target = '6.0'
end
