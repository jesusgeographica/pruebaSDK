#
# Be sure to run `pod lib lint Tempo-ios-sdk.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'Tempo-ios-sdk'
  s.version          = '0.1.0'
  s.summary          = 'iOS library for indoor mapping.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
iOS library for indoor mapping using GeoJSON.
                       DESC

  s.homepage         = 'https://github.com/GeographicaGS'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Javier Aragón' => 'javier.aragon@geographica.gs' }
  s.source           = { :git => 'git@github.com:GeographicaGS/Tempo-ios-sdk.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '10.0'

  s.swift_version = '4.2'

  s.source_files = 'Tempo-ios-sdk/Classes/**/*'
  s.preserve_path = '${POD_ROOT}/Tempo-ios-sdk/Tempo-ios-sdk-Bridging-Header.h'
  s.xcconfig = { 'FRAMEWORK_SEARCH_PATHS' => '$(PROJECT_DIR)' }
  s.library  = 'c++.tbd', 'z.tbd'
  #s.xcconfig = { 'SWIFT_OBJC_BRIDGING_HEADER' => '${POD_ROOT}/Tempo-ios-sdk/Tempo-ios-sdk-Bridging-Header.h' }
  s.module_name = 'Tempo-ios-sdk'
  s.frameworks = 'GLKit'

end
