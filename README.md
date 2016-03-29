# FlatButtonKit

FlatButtonKit is written by Swift and make Flat Style Button from UILabel.

## Requirements
- Swift 2.2
- iOS 8.0 or later

## Installation

### Carthage

* Cartfile

```Cartfile
github "keygx/FlatButtonKit"
```

* install

```
$ carthage update
```
To integrate "FlatButtonKit.framework" into your Xcode project

### CocoaPods

* PodFile

```PodFile
source 'https://github.com/CocoaPods/Specs.git'
platform :ios, '8.0'
use_frameworks!

pod 'FlatButtonKit', :git => 'https://github.com/keygx/FlatButtonKit'
```
* install

```
$ pod install
```

## Usage

### Make Button Style

- Inherit FlatButtonKit class
- For more information: SampleButtonStyle.swift

```SampleButtonStyle.swift
import FlatButtonKit

~~

class SampleButtonStyle: FlatButtonKit {

	~~

	 override func setButtonStyle(status: ButtonStatus) {

	 	~~

		switch status {
		case .Disabled:
	        // Disabled Style Stettings...

		case .Highlighted:
	        // Highlight Style Stettings...

		case .Selected:
	        // Selected Style Stettings...

		default:
	        // Normal Style Stettings...
		}
	}
}
```

###Layout UILabel

![](images/storyboard1.png)

###Setting Custom Class

![](images/storyboard2.png)

###Code written

```ViewController.swift

class ViewController: UIViewController {

	@IBOutlet weak var button: SampleButtonStyle!
    @IBOutlet weak var btn1: SampleButtonStyle!
    @IBOutlet weak var btn2: SampleButtonStyle!
    @IBOutlet weak var btn3: SampleButtonStyle!

	override func viewDidLoad() {
		super.viewDidLoad()

		button.title.normal = "Normal"
        button.title.highlighted = "Highlighted"
        button.title.selected = "Selected"
        button.title.disabled = "Disabled"
        button.status = .Normal
        button.tag = 1

		// set Touch Event
		button.setTarget(target: self, selector: "didTapped:") // -> func didTapped(sender:)

		or

		// set Click Handler
		button.setClickHandler() { sender in
			println("ClickHandler: \(sender.tag)")
		}
	}

	// Receive Touch Event
	func didTapped(sender: NSTimer) {
	    if let sender: AnyObject = sender.userInfo {
	        println("didTapped: \(sender.tag)")
	    }
	}

	~~
}
```

###Run Application

![](images/iPhone6.png)


## License

AlertHelperKit is released under the MIT license. See LICENSE for details.

## Author

Yukihiko Kagiyama (keygx) <https://twitter.com/keygx>
