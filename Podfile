# Uncomment the next line to define a global platform for your project
# platform :ios, '9.0'
source 'https://github.com/CocoaPods/Specs.git'

target 'SportsMap' do
  # Comment the next line if you're not using Swift and don't want to use dynamic frameworks
  use_frameworks!
  # Основная библиотека MapKit.
  pod ‘YandexMapKit’, ’~> 3.1’ 
  # Дополнительные модули MapKit.
  # Удалите зависимости если ваше приложение не использует их.
  pod ‘YandexMapKitDirections’, ’~> 3.1’ 
  pod ‘YandexMapKitPlaces’, ’~> 3.1’ 
  #pod ‘YandexMapKitSearch’, ’~> 3.1’ 
  #pod ‘YandexMapKitTransport’, ’~> 3.1’
  # Pods for SportsMap
  # Библиотека для выпадающего меню
  pod 'BTNavigationDropdownMenu'
  # Библиотека для запросов
  pod 'Alamofire', '~> 4.7'

  target 'SportsMapTests' do
    inherit! :search_paths
    # Pods for testing
  end

  target 'SportsMapUITests' do
    inherit! :search_paths
    # Pods for testing
  end

end
