//
//  LoginViewController.swift
//  TradeAppByBata
//
//  Created by Дмитрий Пономаренко on 18.03.23.
//

import UIKit

class LoginVIewContoller: UIViewController {
    
    @IBOutlet var firstNameTextField: UITextField!
    
    @IBOutlet var passwordTextField: UITextField!
    
    @IBOutlet var showPassword: UIButton!
    
    var viewModel: LoginViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        showPassword.isHidden = true
        passwordTextField.delegate = self
        firstNameTextField.layer.cornerRadius = firstNameTextField.frame.size.height/2
        passwordTextField.layer.cornerRadius = passwordTextField.frame.size.height/2
        viewModel.loadData()
    }
    
    @IBAction func loginButtonPressed(_ sender: Any) {
        viewModel.firstName = firstNameTextField.text ?? ""
        viewModel.password = passwordTextField.text ?? ""

        if viewModel.warningEr() == "" {
            viewModel.goToHome()
        } else {
            present(viewModel.showAlert(), animated: true)
        }
        
    }
    
    @IBAction func showPassword(_ sender: Any) {
        passwordTextField.isSecureTextEntry.toggle()
    }
    
}

extension LoginVIewContoller: UITextFieldDelegate {
    
    func textFieldDidChangeSelection(_ textField: UITextField) {
        showPassword.isHidden = false
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if passwordTextField.text != "" {
            showPassword.isHidden = false
        } else {
            showPassword.isHidden = true
        }
    }
}

