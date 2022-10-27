//
//  ViewController.swift
//  LearningTask-4.3
//
//  Created by rafael.rollo on 16/02/2022.
//

import UIKit

class LoginViewController: UIViewController {
    

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    typealias AlertTitle = String
    typealias ValidationMessage = String
    
    @IBAction func loginButtonPressed(_ sender: UIButton) {
        let (_, alertTitle, validationMessage) = checkLoginInputs()
        showAlert(withTitle: alertTitle, andMessage: validationMessage)
    }
    
    
    
    @IBAction func passwordRecoveryButtonPressed(_ sender: UIButton) {
        let (_ , alertTitle, validationMessage) = checkPasswordRecoveryInput()
        showAlert(withTitle: alertTitle, andMessage: validationMessage)
    }
    
    
    func checkLoginInputs() -> (Bool, AlertTitle, ValidationMessage){
        if let email = emailTextField.text, email.isEmpty  {
            return (false, "Ops", "Email não pode estar em branco")
        }
        if let password = passwordTextField.text, password.isEmpty {
            return (false, "Ops", "Digite sua senha de acesso")
        }
        
        return (true, "Logando", "Fazendo login na sua conta..")
    }
    
    func checkPasswordRecoveryInput() -> (Bool, AlertTitle, ValidationMessage){
        guard let email = emailTextField.text, !email.isEmpty else{
            return (false, "Ops", "Informe seu email e tente novamente")
        }
        return (true, "Redefinir senha", "Enviamos um email para \(email). Siga as instruções para criar uma nova senha segura.")
    }
    
    
    func showAlert(withTitle title:String, andMessage message:String){
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default))
        self.present(alert, animated: true)
    }
    
    
    
}

