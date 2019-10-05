platform :ios, '12.0'

target 'SwiftIssues' do

  use_frameworks!
  
  # Pods for API service using Moya
  pod 'Moya/RxSwift'
  pod 'PINRemoteImage', '~> 3.0.0-beta'

  # Swinject
  pod 'Swinject'
  pod 'SwinjectStoryboard'
 
  # rx
  pod 'RxSwift'
  pod 'RxCocoa'
  
  # add the Firebase pod for Google Analytics
  pod 'Firebase/Analytics'
  
  # Pods for PodTest
  pod 'Fabric', '~> 1.10.2'
  pod 'Crashlytics', '~> 3.13.4'
  
  target 'SwiftIssuesTests' do
    inherit! :search_paths
    # Pods for testing
    pod 'Quick'
    pod 'Nimble'
  end
  
end
