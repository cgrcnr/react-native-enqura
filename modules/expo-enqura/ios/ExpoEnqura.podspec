# require 'json'

# package = JSON.parse(File.read(File.join(__dir__, '..', 'package.json')))

Pod::Spec.new do |s|
  s.name           = 'ExpoEnqura'
  s.version        = '1.0.0'
  s.summary        = 'A sample project summary'
  s.description    = 'A sample project description'
  s.author         = ''
  s.homepage       = 'https://docs.expo.dev/modules/'
  s.platform       = :ios, '13.0'
  s.source         = { git: '' }
  s.ios.deployment_target  = '13.0'
  s.static_framework = true

  s.dependency 'ExpoModulesCore'
  s.dependency 'Toaster'
  s.dependency 'EnVerify', '1.3.13.6'
   

  # Swift/Objective-C compatibility
  s.pod_target_xcconfig = {
    'DEFINES_MODULE' => 'YES',
    'SWIFT_COMPILATION_MODE' => 'wholemodule',

    #custom add
    # 'BUILD_LIBRARY_FOR_DISTRIBUTION' => 'YES',
    # 'EXPANDED_CODE_SIGN_IDENTITY' => '',
    # 'CODE_SIGNING_REQUIRED' => 'NO',
    # 'CODE_SIGNING_ALLOWED' => 'NO',
  }

  # s.subspec 'EnVerify' do |ap|
  #   #ap.source_files = …
  #   ap.pod_target_xcconfig = { 
  #     'BUILD_LIBRARY_FOR_DISTRIBUTION' => 'YES',
  #     'EXPANDED_CODE_SIGN_IDENTITY' => '',
  #     'CODE_SIGNING_REQUIRED' => 'NO',
  #     'CODE_SIGNING_ALLOWED' => 'NO',
  #   }
  # end

  # s.preserve_paths = "ios/EnQualify.xcframework/**/*"
  # s.vendored_frameworks = 'ios/EnQualify.xcframework'

  # if !$ExpoUseSources&.include?(package['name']) && ENV['EXPO_USE_SOURCE'].to_i == 0 && File.exist?("#{s.name}.xcframework") && Gem::Version.new(Pod::VERSION) >= Gem::Version.new('1.10.0')
  #   s.source_files = "**/*.h"
  #   s.vendored_frameworks = "#{s.name}.xcframework"
  # else
  #   s.source_files = "**/*.{h,m,swift}"
  # end
  
  s.source_files = "**/*.{h,m,mm,swift,hpp,cpp}"
end
