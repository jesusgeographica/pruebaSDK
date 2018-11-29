# Installation

Tempo_ios_sdk is available through [CocoaPods]. To install
it, simply add the following line to your Podfile:

```ruby
source 'https://github.com/CocoaPods/Specs.git'
source 'git@github.com:GeographicaGS/ios-specs.git'
pod 'Tempo_ios_sdk'
```

Then, run the following command:

```ruby
$ pod install
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
