Pod::Spec.new do |spec|
  spec.name          = 'OneEntry'
  spec.version       = '1.0.0'
  spec.license       = { :type => 'OWN', :file => 'LICENSE.txt' }
  spec.homepage      = 'https://github.com/OneEntry/swift'
  spec.summary       = 'Adds Swift classes for easy integration with OneEntry'
  spec.authors       = { 'ONEENTRY PORTAL CO' => 'swift@oneentry.cloud' }
  spec.documentation_url = 'https://github.com/OneEntry/swift'    
  
  spec.dependency 'Alamofire'
  spec.vendored_frameworks = 'OneEntry.xcframework'
  spec.source = { 
    :http => 'https://firebasestorage.googleapis.com/v0/b/ar-garden-b5b0c.appspot.com/o/OneEntry%2FOneEntry.zip?alt=media&token=6ec91f40-416b-4cda-b48f-40e3cf8edb40',
    :sha1 => '01a535388fa119597094bab597d840f01b8276b0501f326c74c7c038ead5cf35' 
  }  

  spec.swift_version = '5.0'
  spec.ios.deployment_target = '13.0'
  spec.osx.deployment_target = '10.15'
  spec.tvos.deployment_target = '13.0'
  spec.watchos.deployment_target = '6.0'
end