# Tempo-ios-sdk

[![Version](https://img.shields.io/cocoapods/v/Tempo-ios-sdk.svg?style=flat)](https://cocoapods.org/pods/Tempo-ios-sdk)
[![License](https://img.shields.io/cocoapods/l/Tempo-ios-sdk.svg?style=flat)](https://cocoapods.org/pods/Tempo-ios-sdk)
[![Platform](https://img.shields.io/cocoapods/p/Tempo-ios-sdk.svg?style=flat)](https://cocoapods.org/pods/Tempo-ios-sdk)

## Installation

Tempo_ios_sdk is available through [CocoaPods]. To install
it, simply add the following line to your Podfile:

```ruby
source 'https://github.com/CocoaPods/Specs.git'
source 'git@github.com:GeographicaGS/ios-specs.git'
pod 'Tempo_ios_sdk'
```
Add the following line to your Info.plist

```ruby
TempoLicenceCarto API_KEY
TempoApiSecret API_SECRET_TO_JWT
```

## Example

```ruby
import UIKit
import Tempo_ios_sdk

class ViewController: MapViewController {

override func viewDidLoad() {
    super.viewDidLoad()

    createMap()
    }
}
```

## Author

Javier Aragón, javier.aragon@geographica.gs
Jesús Victorio, jesus.victorio@geographica.gs

## License

Tempo_ios_sdk is available under the MIT license. See the LICENSE file for more info.
