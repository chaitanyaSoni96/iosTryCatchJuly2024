//
//  ViewController2.swift
//  UI Basics
//
//  Created by Chaitanya Soni on 08/08/24.
//

import UIKit
import WebKit

class ViewController2: UIViewController {
    @IBOutlet weak var searchBar: UISearchBar!
    
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var webView: WKWebView!
    
    @IBOutlet weak var pickerView: UIPickerView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        pickerView.dataSource = self
        pickerView.delegate = self
        
        let attributedString = NSAttributedString(string: "row: asdhak sdjhaskld hjasl",
                                                attributes: [
                                                    NSAttributedString.Key.font : UIFont.italicSystemFont(ofSize: 20),
                                                    .strikethroughStyle : NSUnderlineStyle.single.rawValue,
                                                    .strikethroughColor : UIColor.green
                                                            ])
        label.attributedText = attributedString
        
        searchBar.becomeFirstResponder()
    }
    
    @IBAction func nextScreenTapped() {
        
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
}

extension ViewController2: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        2
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if component == 0 {
            return 5
        } else {
            return 50
        }
    }
}

extension ViewController2: UISearchBarDelegate {
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        
        if let searchText = searchBar.text,
           let url = URL(string: searchText) {
            
            let request = URLRequest(url: url)
            webView.load(request)
            
            self.view.endEditing(true)
        }
    }
    
}

extension ViewController2: UIPickerViewDelegate {
//    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
//        "row: \(row), comp: \(component)"
//    }
    func pickerView(_ pickerView: UIPickerView, attributedTitleForRow row: Int, forComponent component: Int) -> NSAttributedString? {
        
        let mutableString = NSMutableAttributedString()
        
        
        mutableString.append(NSAttributedString(string: "row: ",
                                                attributes: [
                                                    NSAttributedString.Key.font : UIFont.italicSystemFont(ofSize: 12),
                                                    .strikethroughStyle : NSUnderlineStyle.single
                                                            ]))
        mutableString.append(NSAttributedString(string: "\(row)",
                                                attributes:
                                                    [
                                                        NSAttributedString.Key.font : UIFont.preferredFont(forTextStyle: .subheadline),
                                                        NSAttributedString.Key.foregroundColor : UIColor.red
                                                    ]
                                               ))
        mutableString.append(NSAttributedString(string: ", comp: ",
                                                attributes: [NSAttributedString.Key.font : UIFont.preferredFont(forTextStyle: .body)]))
        mutableString.append(NSAttributedString(string: "\(component)",
                                                attributes: [
                                                    NSAttributedString.Key.font : UIFont.preferredFont(forTextStyle: .subheadline),
                                                    NSAttributedString.Key.foregroundColor : UIColor.blue
                                                ]))
        
        return mutableString
    }
    
}
