# Tempo-ios-sdk

[![Version](https://img.shields.io/cocoapods/v/Tempo-ios-sdk.svg?style=flat)](https://cocoapods.org/pods/Tempo-ios-sdk)
[![License](https://img.shields.io/cocoapods/l/Tempo-ios-sdk.svg?style=flat)](https://cocoapods.org/pods/Tempo-ios-sdk)
[![Platform](https://img.shields.io/cocoapods/p/Tempo-ios-sdk.svg?style=flat)](https://cocoapods.org/pods/Tempo-ios-sdk)

## Installation

Tempo-ios-sdk is available through [CocoaPods]. To install
it, simply add the following line to your Podfile:

```ruby
source 'https://github.com/CocoaPods/Specs.git'
source 'git@github.com:GeographicaGS/ios-specs.git'
pod 'TempoSDK'
```
Add the following line to your Info.plist

```ruby
CartoLicence API_KEY
apisecret API_SECRET_TO_JWT
```

## Example

```ruby
import UIKit
import TempoSDK

class ViewController: MapViewController {

override func viewDidLoad() {
super.viewDidLoad()
initMap()
loadMap()
}
}
```

## Author

Javier Aragón, javier.aragon@geographica.gs
Jesús Victorio, jesus.victorio@geographica.gs

## License

TempoSDK is available under the MIT license. See the LICENSE file for more info.
