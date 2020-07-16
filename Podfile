 platform :ios, '9.0'

target 'LandiLords' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!

  # Pods for LandiLords

  target 'LandiLordsTests' do
    inherit! :search_paths
    # Pods for testing
  end
  
  # add the Firebase pod for Google Analytics
  pod 'Firebase/Analytics'
  pod 'Firebase/Auth'
  pod 'Firebase/Database'
  pod 'SVProgressHUD'
  pod 'ChameleonFramework'
  pod 'Firebase'
  # add pods for any other desired Firebase products
  # https://firebase.google.com/docs/ios/setup#available-pods

end
post_install do |installer|
    installer.pods_project.targets.each do |target|
        target.build_configurations.each do |config|
            config.build_settings['CLANG_WARN_DOCUMENTATION_COMMENTS'] = 'NO'
        end
    end
end
