#
# Be sure to run `pod lib lint Tempo-ios-sdk.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'Tempo-ios-sdk'
  s.version          = '0.1.1'
  s.summary          = 'iOS library for indoor mapping.'

  s.description      = <<-DESC
iOS library for indoor mapping using GeoJSON.
                       DESC

  s.homepage         = 'https://github.com/GeographicaGS'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Javier Aragón' => 'javier.aragon@geographica.gs' }
  s.source           = { :git => 'git@github.com:jesusgeographica/pruebaSDK.git', :branch => 'copy-master'}

  s.ios.deployment_target = '10.0'

  s.swift_version = '4.2'

  s.source_files = 'Tempo-ios-sdk/**/*'
  s.ios.vendored_frameworks = 'Tempo-ios-sdk/Frameworks/CartoMobileSDK.framework'
  s.preserve_path = 'podname/Frameworks/*'
  s.requires_arc = true
  s.frameworks = 'GLKit', 'CartoMobileSDK'
  s.libraries = 'z', 'c++'

end
