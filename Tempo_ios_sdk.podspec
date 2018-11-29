#
# Be sure to run `pod lib lint Tempo_ios_sdk.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'Tempo_ios_sdk'
  s.version          = '0.1.2'
  s.summary          = 'iOS library for indoor mapping.'
  s.description      = 'iOS library for indoor mapping using GeoJSON.'
  s.homepage         = 'https://github.com/GeographicaGS'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Javier Aragón' => 'javier.aragon@geographica.gs',
  						'Jesús Victorio' => 'jesus.victorio@geographica.gs',  }
  s.source           = { :git => 'git@github.com:GeographicaGS/Tempo-ios-sdk.git', :tag => s.version.to_s}

  s.ios.deployment_target = '10.0'
  s.swift_version = '4.2'

  s.source_files = 'Tempo_ios_sdk/src/**/*.{swift,h,m}'
  s.resources = "Tempo_ios_sdk/src/**/*.{xib,zip,png,xcdatamodeld}"

  s.resource_bundles = {
    'recursos' => [
          'Tempo_ios_sdk/**/*.xib',
          'Tempo_ios_sdk/**/*.xcdatamodeld',
          'Tempo_ios_sdk/**/*.zip'
    ]
  }

  s.requires_arc = true
  s.libraries = 'z', 'c++'
  s.frameworks = 'GLKit', 'CoreData', 'CartoMobileSDK'
  s.ios.vendored_frameworks = 'Tempo_ios_sdk/Frameworks/CartoMobileSDK.framework'
  s.preserve_path = 'Tempo_ios_sdk/Frameworks/*'

  s.dependency 'AlamofireObjectMapper', '~> 5.2'
  s.dependency 'SwiftyJWT', '~> 0.0.3'
  s.dependency 'SSZipArchive', '~> 2.1'
  s.dependency 'BottomPopup', '~> 0.4'

  end

    s.prepare_command = <<-CMD
                          echo "Downloading CartoMobileSDK, please wait..."
                          curl --progress-bar "https://nutifront.s3.amazonaws.com/sdk_snapshots/sdk4-ios-build-4.1.4.zip"  --output CartoMobileSDK.zip
                          unzip CartoMobileSDK.zip
                          rm CartoMobileSDK.zip
                          cp -r CartoMobileSDK.framework/* Tempo_ios_sdk/Frameworks/CartoMobileSDK.framework
                          rm -r CartoMobileSDK.framework
                     CMD


end
