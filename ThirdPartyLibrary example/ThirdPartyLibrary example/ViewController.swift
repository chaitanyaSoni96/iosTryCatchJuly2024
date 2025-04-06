//
//  ViewController.swift
//  ThirdPartyLibrary example
//
//  Created by Chaitanya Soni on 19/03/25.
//

import UIKit
import DropDown
import SwiftyMenu

extension String: SwiftyMenuDisplayable {
    public var displayableValue: String {
        return self
    }

    public var retrievableValue: Any {
        return self
    }
}

class ViewController: UIViewController {
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var swiftyMenu: SwiftyMenu!
    
    private let dropDownOptionsDataSource = [
        "Option 1", "Option 2", "Option 3",
        "Option 4", "Option 5", "Option 6",
        "Option 7", "Option 8", "Option 9"
    ]
    
    private var storyboardMenuAttributes: SwiftyMenuAttributes {
        var attributes = SwiftyMenuAttributes()
        
        // Custom Behavior
        attributes.multiSelect = .disabled(allowSingleDeselection: false)
        attributes.scroll = .enabled
        attributes.hideOptionsWhenSelect = .enabled
        
        // Custom UI
        attributes.roundCorners = .all(radius: 8)
        attributes.rowStyle = .value(height: 35, backgroundColor: .gray, selectedColor: UIColor.gray.withAlphaComponent(0.1))
        attributes.headerStyle = .value(backgroundColor: .gray, height: 35)
        attributes.placeHolderStyle = .value(text: "Please Select Item", textColor: .lightGray)
        attributes.textStyle = .value(color: .white, separator: " & ", font: .systemFont(ofSize: 12))
        attributes.separatorStyle = .value(color: .black, isBlured: false, style: .singleLine)
        attributes.arrowStyle = .value(isEnabled: true)
        attributes.height = .value(height: 300)
        
        // Custom Animations
        attributes.expandingAnimation = .spring(level: .low)
        attributes.expandingTiming = .value(duration: 0.5, delay: 0)
        
        attributes.collapsingAnimation = .linear
        attributes.collapsingTiming = .value(duration: 0.5, delay: 0)
        
        attributes.titleMarginHorizontal = .value(leading: 5, trailing: 5)
        attributes.itemMarginHorizontal = .value(leading: 5, trailing: 5)
        
        attributes.errorInfo = .default
        
        return attributes
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        swiftyMenu.delegate = self
        swiftyMenu.items = dropDownOptionsDataSource
        swiftyMenu.configure(with: storyboardMenuAttributes)
    }

    @IBAction func buttonClick(_ sender: UIButton) {
        let dropdown = DropDown()
        dropdown.anchorView = sender
        dropdown.dataSource = ["Jan", "Feb", "March", "April"]
        dropdown.selectionAction = { index, title in
            print(index, title)
            self.label.text = title
        }
        dropdown.direction = .bottom
        dropdown.bottomOffset = .init(x: 0, y: sender.frame.height)
        dropdown.show()
    }
}

extension ViewController: SwiftyMenuDelegate {
    func swiftyMenu(_ swiftyMenu: SwiftyMenu, didSelectItem item: any SwiftyMenuDisplayable, atIndex index: Int) {
        
    }
    func swiftyMenu(_ swiftyMenu: SwiftyMenu, didDeselectItem item: any SwiftyMenuDisplayable, atIndex index: Int) {
        
    }
    
}
