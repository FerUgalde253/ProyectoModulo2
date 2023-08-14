//
//  LogInViewController.swift
//  FirstViewController
//
//  Created by Fernando Ugalde on 28/06/23.
//

import UIKit

class SingInViewController: UIViewController {
    
    private var singInViewModel = SingInViewModel()

    var titleLabel : UILabel = UILabel()
    var emailTextField : UITextField = UITextField()
    var passwordTextField : UITextField = UITextField()
    var buttonSignIn : UIButton = UIButton()
    var singInContainer : UIView = UIView()
    var singUpRedirection : UIButton = UIButton()
    var backButton : UIButton = UIButton()
    var errorLabel: UILabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        screenElements()
        buttonSignIn.addTarget(self, action: #selector(signInButtonTapped), for: .touchUpInside)
        emailTextField.addTarget(self, action: #selector(emailTextFileEditingChanged), for: .editingChanged)
        passwordTextField.addTarget(self, action: #selector(passwordTextFileEditingChanged), for: .editingChanged)
        view.backgroundColor = UIColor.ligtColor1
    }
    
    // MARK: UIComponents
    func screenElements(){
        titleLabel.textAlignment = .center
        titleLabel.textColor = UIColor.myBackGroundColor
        titleLabel.font = UIFont(name: "Didot", size: 35)
        titleLabel.text = "Sing-In"
        view.addSubview(titleLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        ////////////////////////////////////////////
        singInContainer = UIView()
        singInContainer.backgroundColor = UIColor.myButtonlColor
        singInContainer.layer.cornerRadius = 10
        view.addSubview(singInContainer)
        singInContainer.translatesAutoresizingMaskIntoConstraints = false
        ////////////////////////////////////////////
        emailTextField.textAlignment = .left
        emailTextField.placeholder = "  Email"
        emailTextField.backgroundColor = UIColor.ligtColor2
        emailTextField.layer.cornerRadius = 10
        emailTextField.layer.borderColor = UIColor.black.cgColor
        view.addSubview(emailTextField)
        emailTextField.translatesAutoresizingMaskIntoConstraints = false
        ////////////////////////////////////////////
        passwordTextField.textAlignment = .left
        passwordTextField.placeholder = "  Password"
        passwordTextField.backgroundColor = UIColor.ligtColor2
        passwordTextField.layer.cornerRadius = 10
        passwordTextField.layer.borderColor = UIColor.black.cgColor
        view.addSubview(passwordTextField)
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        ////////////////////////////////////////////
        buttonSignIn = UIButton()
        buttonSignIn.backgroundColor = UIColor.myButtonlColor
        buttonSignIn.layer.cornerRadius = 20
        buttonSignIn.titleLabel?.font = UIFont(name: "Georgia Bold", size: 20)
        buttonSignIn.setTitle("Sing In", for: .normal)
        buttonSignIn.setTitleColor(UIColor.ligtColor1, for: .normal)
        view.addSubview(buttonSignIn)
        buttonSignIn.translatesAutoresizingMaskIntoConstraints = false
        ////////////////////////////////////////////
        singUpRedirection = UIButton()
        singUpRedirection.backgroundColor = UIColor.clear
        singUpRedirection.titleLabel?.font = UIFont(name: "Georgia", size: 20)
        singUpRedirection.setTitle("I haven't an account", for: .normal)
        singUpRedirection.setTitleColor(UIColor.myBackGroundColor, for: .normal)
        singUpRedirection.addTarget(self, action: #selector(goToSingUp), for: .touchUpInside)
        view.addSubview(singUpRedirection)
        singUpRedirection.translatesAutoresizingMaskIntoConstraints = false
        /////////////////////////////////////////////////////////////////
        backButton = UIButton()
        backButton.backgroundColor = UIColor.clear
        backButton.setImage(UIImage(systemName: "house.fill"), for: .normal)
        backButton.tintColor = UIColor.myBackGroundColor
        backButton.addTarget(self, action: #selector(goToHome), for: .touchUpInside)
        view.addSubview(backButton)
        backButton.translatesAutoresizingMaskIntoConstraints = false
        ////////////////////////////////
        errorLabel = UILabel()
        errorLabel.textColor = UIColor.myBackGroundColor
        errorLabel.font = UIFont(name: "Georgia", size: 20)
        errorLabel.textAlignment = .center
        view.addSubview(errorLabel)
        errorLabel.translatesAutoresizingMaskIntoConstraints = false
       
        ///Constrains

        // X Center Constrains
        [titleLabel,singInContainer,emailTextField,passwordTextField,buttonSignIn,singUpRedirection,errorLabel].forEach { view in NSLayoutConstraint.activate([view.centerXAnchor.constraint(equalTo: self.view.centerXAnchor)])
        }
        // Left Constrains
        [titleLabel,singInContainer,buttonSignIn,singUpRedirection,errorLabel].forEach { view in NSLayoutConstraint.activate([view.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: Constants.padding)])
        }
        // Right Constrains
        [titleLabel,singInContainer,buttonSignIn,singUpRedirection,errorLabel,backButton].forEach { view in NSLayoutConstraint.activate([view.rightAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.rightAnchor, constant: -Constants.padding)])
        }
        // Height Constrains
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: Constants.padding*1.5),
            titleLabel.heightAnchor.constraint(equalToConstant: 60),
            singInContainer.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: Constants.padding*1.5),
            singInContainer.heightAnchor.constraint(equalToConstant: 130),
            emailTextField.topAnchor.constraint(equalTo: singInContainer.topAnchor, constant: 10),
            emailTextField.heightAnchor.constraint(equalToConstant: Constants.padding*2),
            passwordTextField.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 10),
            passwordTextField.heightAnchor.constraint(equalToConstant: Constants.padding*2),
            buttonSignIn.topAnchor.constraint(equalTo: singInContainer.bottomAnchor, constant: Constants.padding*2.4),
            buttonSignIn.heightAnchor.constraint(equalToConstant: 50),
            singUpRedirection.topAnchor.constraint(equalTo: buttonSignIn.bottomAnchor, constant: 10),
            singUpRedirection.heightAnchor.constraint(equalToConstant: Constants.padding),
            errorLabel.topAnchor.constraint(equalTo: singUpRedirection.bottomAnchor, constant: 10),
            errorLabel.heightAnchor.constraint(equalToConstant: Constants.padding),
            backButton.centerYAnchor.constraint(equalTo: titleLabel.topAnchor),
            backButton.heightAnchor.constraint(equalToConstant: Constants.padding)
        ])
        
        // Special Constrains
        NSLayoutConstraint.activate([
            backButton.widthAnchor.constraint(equalToConstant: Constants.padding),
            emailTextField.widthAnchor.constraint(equalTo: singInContainer.widthAnchor, constant: -20),
            passwordTextField.widthAnchor.constraint(equalTo: singInContainer.widthAnchor, constant: -20)
        ])
    }
    
    //MARK: Funciones
    
    //Funcions
    func showError() {
            errorLabel.text = "Missed information"
        }
        
    func hideError() {
            errorLabel.text = ""
        }
    //Objc Funcions
    @objc func emailTextFileEditingChanged(){
        hideError()
        singInViewModel.email = emailTextField.text ?? ""
    }
    
    @objc func passwordTextFileEditingChanged(){
        hideError()
        singInViewModel.password = passwordTextField.text ?? ""
    }
    
    @objc func signInButtonTapped() {
        if singInViewModel.isValid {
            let nextView = WinesViewController()
            nextView.modalPresentationStyle = .fullScreen
            present(nextView, animated: true, completion: nil)
        } else {
            showError()
        }
    }
    @objc func goToSingUp(){
        let nextVC = SingUpViewController()
        nextVC.modalPresentationStyle = .fullScreen
        present(nextVC,animated: true, completion: nil)
    }
    
    @objc func goToHome(){
        let nextVC = HomeViewController()
        nextVC.modalPresentationStyle = .fullScreen
        present(nextVC,animated: true, completion: nil)
    }
}
