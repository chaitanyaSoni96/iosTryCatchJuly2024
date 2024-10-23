//
//  ViewController.swift
//  CoreData example
//
//  Created by Chaitanya Soni on 16/09/24.
//

import UIKit
import CoreData

class ViewController: UIViewController {

    @IBOutlet weak var usernameTF: UITextField!
    
    @IBOutlet weak var passwordTF: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func loginTapped(_ sender: Any) {
        guard !(usernameTF.text ?? "").isEmpty,
              PasswordValidator().validate(passwordTF.text)
        else {
            self.showError("Validation Error")
            return
        }
        do {
            let users = try CoreDataManager.shared.persistentContainer.viewContext.fetch(User.fetchRequest())
            if let user = users.first(where: { $0.username == usernameTF.text }) {
                
                
                if user.password == passwordTF.text {
                    self.showHomeScreen()
                } else {
                    // password doesnt match
                    self.showError("Password doesnt match")
                }
                
            } else {
                // user not found
                self.showError("User not found")
            }
            
        } catch {
            self.showError(error.localizedDescription)
        }
    }
    
    @IBAction func signupTapped(_ sender: Any) {
        guard !(usernameTF.text ?? "").isEmpty,
              PasswordValidator().validate(passwordTF.text)
        else {
            self.showError("Validation Error")
            return
        }
        let user = User(context: CoreDataManager.shared.persistentContainer.viewContext)
        user.id = .init()
        user.username = usernameTF.text
        user.password = passwordTF.text
        
        CoreDataManager.shared.saveContext()
        
        self.showHomeScreen()
    }
    
    func showHomeScreen() {
        let storyboard = UIStoryboard(name: "Main", bundle: .main)
        let vc = storyboard.instantiateViewController(withIdentifier: "AppNavigationController")
        self.view.window?.rootViewController = vc
    }
    
    func showError(_ message: String) {
        let alert = UIAlertController(title: "Error",
                                      message: message,
                                      preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .destructive))
        
        self.present(alert, animated: true)
    }
}

struct PasswordValidator {
    func validate(_ password: String?) -> Bool {
        guard let password,
              password.count >= 8
        else {
            return false
        }
        
        var containsUpperCaseChar: Bool = false
        var containsLowerCaseChar: Bool = false
        var containsNumericChar: Bool = false
        var containsSpecialChar: Bool = false
        
        for char in password.unicodeScalars {
            if !containsUpperCaseChar {
                containsUpperCaseChar = CharacterSet.uppercaseLetters.contains(char)
            }
            if !containsLowerCaseChar {
                containsLowerCaseChar = CharacterSet.lowercaseLetters.contains(char)
            }
            if !containsNumericChar {
                containsNumericChar = CharacterSet.decimalDigits.contains(char)
            }
            if !containsSpecialChar {
                containsSpecialChar = CharacterSet.punctuationCharacters.union(CharacterSet.symbols).contains(char)
            }
        }
        
        return containsUpperCaseChar && containsLowerCaseChar && containsNumericChar && containsSpecialChar
    }
}
