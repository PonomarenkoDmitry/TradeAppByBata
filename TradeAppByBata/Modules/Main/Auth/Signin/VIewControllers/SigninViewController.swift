//
//  SigninViewController.swift
//  TradeAppByBata
//
//  Created by Дмитрий Пономаренко on 18.03.23.
//

import UIKit


class SigninViewController: UIViewController {
    
    @IBOutlet var firstNameTextField: UITextField!
    
    @IBOutlet var lastNameTextField: UITextField!
    
    @IBOutlet var emailTextField: UITextField!
    
    var viewModel: SigninViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        firstNameTextField.layer.cornerRadius = firstNameTextField.frame.size.height/2
        lastNameTextField.layer.cornerRadius = lastNameTextField.frame.size.height/2
        emailTextField.layer.cornerRadius = emailTextField.frame.size.height/2
        viewModel.loadData()
    }
    
    @IBAction func signInButtotPressed(_ sender: Any) {
        viewModel.firstName = firstNameTextField.text ?? ""
        viewModel.lastName = lastNameTextField.text ?? ""
        viewModel.email = emailTextField.text ?? ""
        
        if viewModel.warningEr() == "" {
            viewModel.goToHome()
        } else {
            present(viewModel.showAlert(), animated: true)
        }

    }
    
    
    
    @IBAction func logInButtonPressed(_ sender: Any) {
        viewModel.goToLogin()
    }
    
    @IBAction func googleSignInButtonPressed(_ sender: Any) {

    }
    
    @IBAction func appleSignInButtonPressed(_ sender: Any) {
    }
}
