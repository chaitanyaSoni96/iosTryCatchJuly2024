//
//  ViewController.swift
//  Push Notifications
//
//  Created by Chaitanya Soni on 06/04/25.
//

import UIKit
import UserNotifications


enum Foo: Error {
    case one(userMessage: String)
    case two
    case three
}

class ViewController: UIViewController {

    var tableView: UITableView?
    
    var data: [String] = [] {
        didSet {
            DispatchQueue.main.async {
                self.tableView?.reloadData()
            }
        }
    }
    
    lazy var some: UIButton = {
        let b = UIButton()
        return b
    }() {
        willSet {
            
        }
        
        didSet {
            
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        registerForRemoteNotification()
        
        
        do {
            
            let str = try self.foo()
            
        } catch let error as Foo {
            switch error {
            case .one(let message):
                break
            case .two:
                break
            case .three:
                break
            }
        } catch let error {
            
        }
        
        let request = URLRequest(url: URL(string: "google.com")!)
        URLSession.shared.dataTask(with: request, completionHandler: { data, response, error in
            
            //decode data into a codable
            //set data
            DispatchQueue.main.async {
                self.tableView?.reloadData()
            }
        }).resume()
        
        
        enum SkillLevel: Comparable {
            case beginner
            case intermediate
            case expert(stars: Int)
        }
        
        let beginner = SkillLevel.beginner
        let intermediate = SkillLevel.intermediate
        let expert = SkillLevel.expert(stars: 3)
        
        print(beginner < intermediate) // true
        print(intermediate > beginner) // true
        print(expert < intermediate) // false (expert is greater than intermediate)
        
        //Enum Cases As Protocol Witnesses.
        protocol DecodingError {
          static var fileCorrupted: Self { get }
          static func keyNotFound(_ key: String) -> Self
        }
        
        enum JSONDecodingError: DecodingError {
          case fileCorrupted // okay
          case keyNotFound(_ key: String) // okay
        }
        
        //Multiple Trailing Closures
        multipleTrailingClosures(val: "") {
            //
        } c2: {
            //
        }
        
        //inline
        multipleTrailingClosures(val: "", c1: {
            
        }, c2: {
            
        })
        
        let f16: Float16 = 0
        
        
        self.view.addSubview(self.some)
    }
    
    func foo() throws -> String {
        if Int.random(in: 0...10) % 2 == 2 {
            throw Foo.one(userMessage: "Something broke")
        } else if Int.random(in: 0...10) % 2 == 2 {
            throw Foo.two
        } else {
            return "Yay"
        }
    }
    
    func multipleTrailingClosures(val: String, c1: @escaping (() -> ()), c2: @escaping (() -> ())) {
        
    }
    
    func registerForRemoteNotification() {
        let center  = UNUserNotificationCenter.current()
        
        center.requestAuthorization(options: [.sound, .alert, .badge]) { (granted, error) in
            if error == nil {
                DispatchQueue.main.async {
                    UIApplication.shared.registerForRemoteNotifications()
                }
            }
        }
    }

}

