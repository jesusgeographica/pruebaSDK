#
# Be sure to run `pod lib lint Tempo-ios-sdk.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'TempoSDK'
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

  s.source_files = 'TempoSDK/Classes/*'
  s.ios.vendored_frameworks = 'TempoSDK/Frameworks/CartoMobileSDK.framework'
  s.preserve_path = 'TempoSDK/Frameworks/*'
  s.requires_arc = true
  s.frameworks = 'GLKit', 'CartoMobileSDK'
  s.libraries = 'z', 'c++'
  s.script_phase = {
	:name => 'CartoMobileSDK',
	:script => 'CARTOMOBILESDK_DIR="${PROJECT_DIR}/TempoSDK/CartoMobileSDK"
				if [ -f "${CARTOMOBILESDK_DIR}/module.modulemap" ]
				then
				echo "CartoMobileSDK already exists, skipping"
				else
				FRAMEWORK_DIR="${BUILT_PRODUCTS_DIR}/CartoMobileSDK.framework"
				if [ -d "${FRAMEWORK_DIR}" ]; then
				echo "${FRAMEWORK_DIR} already exists, so skipping the rest of the script."
				exit 0
				fi
				mkdir -p "${FRAMEWORK_DIR}/Modules"
				echo "module CartoMobileSDK [system] {
				header \"${PROJECT_DIR}/TempoSDK/CartoMobileSDK.framework/Versions/A/Headers/CartoMobileSDK.h\"
				export *
				}" >> "${FRAMEWORK_DIR}/Modules/module.modulemap"
				ln -sf "${PROJECT_DIR}/TempoSDK/CartoMobileSDK" "${FRAMEWORK_DIR}/Headers"
				fi',
	:execution_position => :before_compile
  }

end
