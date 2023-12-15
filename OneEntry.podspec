Pod::Spec.new do |spec|
  spec.name = 'OneEntry'
  spec.version = '1.0.0'
  spec.license = { :type => 'OWN', :file => 'LICENSE.txt' }
  spec.homepage = 'https://github.com/OneEntry/oneentry-ios-sdk'
  spec.summary = 'Adds Swift classes for easy integration with OneEntry'
  spec.authors = { 'ONEENTRY PORTAL CO' => 'swift@oneentry.cloud' }
  spec.documentation_url = 'https://github.com/OneEntry/oneentry-ios-sdk'    
  
  spec.dependency 'Alamofire'
  spec.source = { 
    :http => 'https://firebasestorage.googleapis.com/v0/b/ar-garden-b5b0c.appspot.com/o/OneEntry%2FOneEntry.zip?alt=media&token=f81a2957-92ff-4c30-87dc-c6d605165458',
    :flatten => false    
  } 

  spec.platform = :ios
  spec.platform = :osx
  spec.platform = :tvos
  spec.platform = :watchos

  spec.vendored_frameworks = 'XCFrameworks/OneEntry.xcframework'

  spec.swift_version = '5.0'
  spec.ios.deployment_target = '13.0'
  spec.osx.deployment_target = '10.15'
  spec.tvos.deployment_target = '13.0'
  spec.watchos.deployment_target = '6.0'
end