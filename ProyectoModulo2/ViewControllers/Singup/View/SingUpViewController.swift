//
//  SingUpViewController.swift
//  FirstViewController
//
//  Created by Fernando Ugalde on 28/06/23.
//

import UIKit

class SingUpViewController: UIViewController {
    
    private var singUpViewModel = SingUpViewModel()
    
    var titleLabel : UILabel = UILabel()
    var nameTextField : UITextField = UITextField()
    var emailTextField : UITextField = UITextField()
    var passwordTextField : UITextField = UITextField()
    var singUpContainer : UIView = UIView()
    var buttonSignUp : UIButton = UIButton()
    var iconName : UIImageView = UIImageView()
    var iconEmail : UIImageView = UIImageView()
    var iconPasword : UIImageView = UIImageView()
    var singInRedirection: UIButton = UIButton()
    var backButton : UIButton = UIButton()
    var errorLabel: UILabel = UILabel()

    var width = UIScreen.main.bounds.width
    var height = UIScreen.main.bounds.height
    var leftPadding : CGFloat = 25
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.ligtColor1
        screenElements()
        buttonSignUp.addTarget(self, action: #selector(signUpButtonTapped), for: .touchUpInside)
        nameTextField.addTarget(self, action: #selector(nameTextFileEditingChanged), for: .editingChanged)
        emailTextField.addTarget(self, action: #selector(emailTextFileEditingChanged), for: .editingChanged)
        passwordTextField.addTarget(self, action: #selector(passwordTextFileEditingChanged), for: .editingChanged)
    }
    
    func screenElements(){
        singUpContainer = UIView()
        singUpContainer.backgroundColor = UIColor.myButtonlColor
        singUpContainer.layer.cornerRadius = 10
        singUpContainer.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(singUpContainer)
               
        ////////////////////////////////////////////
        iconName.image = UIImage(systemName: "person.fill.badge.plus")
        iconName.tintColor = UIColor.myBackGroundColor
        iconName.translatesAutoresizingMaskIntoConstraints = false
        singUpContainer.addSubview(iconName)
        
        ////////////////////////////////////////////
        nameTextField.textAlignment = .left
        nameTextField.placeholder = "  Add your name"
        nameTextField.backgroundColor = UIColor.ligtColor2
        nameTextField.layer.cornerRadius = 10
        nameTextField.layer.borderColor = UIColor.black.cgColor
        nameTextField.translatesAutoresizingMaskIntoConstraints = false
        singUpContainer.addSubview(nameTextField)
        
        ///////////////////////////////////////////
        iconEmail.image = UIImage(systemName: "envelope.fill")
        iconEmail.tintColor = UIColor.myBackGroundColor
        iconEmail.translatesAutoresizingMaskIntoConstraints = false
        singUpContainer.addSubview(iconEmail)
        
        /////////////////////////////////////////////
        emailTextField.textAlignment = .left
        emailTextField.placeholder = "  Add your e-mail"
        emailTextField.backgroundColor = UIColor.ligtColor2
        emailTextField.layer.cornerRadius = 10
        emailTextField.layer.borderColor = UIColor.black.cgColor
        emailTextField.translatesAutoresizingMaskIntoConstraints = false
        singUpContainer.addSubview(emailTextField)
        
        //////////////////////////////////////////////
        iconPasword.image = UIImage(systemName: "key.horizontal.fill")
        iconPasword.tintColor = UIColor.myBackGroundColor
        iconPasword.translatesAutoresizingMaskIntoConstraints = false
        singUpContainer.addSubview(iconPasword)
        
        ////////////////////////////////////////////////
        passwordTextField.textAlignment = .left
        passwordTextField.placeholder = "  Add your password"
        passwordTextField.backgroundColor = UIColor.ligtColor2
        passwordTextField.layer.cornerRadius = 10
        passwordTextField.layer.borderColor = UIColor.black.cgColor
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        singUpContainer.addSubview(passwordTextField)
        
        ///////////////////////////////////////////////////////////////
        titleLabel.textAlignment = .center
        titleLabel.textColor = UIColor.myBackGroundColor
        titleLabel.font = UIFont(name: "Didot", size: 35)
        titleLabel.text = "Sing-Up"
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(titleLabel)
        
        /////////////////////////////////////////////////////
        buttonSignUp = UIButton()
        buttonSignUp.backgroundColor = UIColor.myButtonlColor
        buttonSignUp.layer.cornerRadius = 20
        buttonSignUp.titleLabel?.font = UIFont(name: "Georgia Bold", size: 20)
        buttonSignUp.setTitle("Sing Up", for: .normal)
        buttonSignUp.setTitleColor(UIColor.ligtColor1, for: .normal)
        buttonSignUp.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(buttonSignUp)
        
        ///////////////////////////////////////////////////////////////
        singInRedirection = UIButton()
        singInRedirection.backgroundColor = UIColor.clear
        singInRedirection.titleLabel?.font = UIFont(name: "Georgia", size: 20)
        singInRedirection.titleLabel?.isHighlighted = true
        singInRedirection.setTitle("I have an account", for: .normal)
        singInRedirection.setTitleColor(UIColor.myBackGroundColor, for: .normal)
        singInRedirection.addTarget(self, action: #selector(goToSingIn), for: .touchUpInside)
        singInRedirection.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(singInRedirection)
       
        ////////////////////////////////////////////////
        backButton = UIButton()
        backButton.backgroundColor = UIColor.clear
        backButton.setImage(UIImage(systemName: "house.fill"), for: .normal)
        backButton.tintColor = UIColor.myBackGroundColor
        backButton.addTarget(self, action: #selector(goToHome), for: .touchUpInside)
        backButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(backButton)
        
        /////////////////////////////////////////////
        errorLabel = UILabel()
        errorLabel.textColor = UIColor.myBackGroundColor
        errorLabel.font = UIFont(name: "Georgia", size: 20)
        errorLabel.textAlignment = .center
        errorLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(errorLabel)
        
        // X Constrains
        [singUpContainer, titleLabel, buttonSignUp, singInRedirection, errorLabel].forEach { view in NSLayoutConstraint.activate([view.centerXAnchor.constraint(equalTo: self.view.centerXAnchor)]) }
        
        // Left Constrains
        [singUpContainer, titleLabel, buttonSignUp, singInRedirection, errorLabel].forEach { view in NSLayoutConstraint.activate([view.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: Constants.padding)]) }
        
        // Right Constrains
        [singUpContainer, titleLabel, buttonSignUp, singInRedirection, errorLabel, backButton].forEach { view in NSLayoutConstraint.activate([view.rightAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.rightAnchor, constant: -Constants.padding)]) }
        
        // Height Constrains
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: Constants.padding*1.5),
            titleLabel.heightAnchor.constraint(equalToConstant: 60),
            backButton.centerYAnchor.constraint(equalTo: titleLabel.topAnchor),
            backButton.heightAnchor.constraint(equalToConstant: Constants.padding),
            singUpContainer.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: Constants.padding*1.5),
            singUpContainer.heightAnchor.constraint(equalToConstant: 190),
            buttonSignUp.topAnchor.constraint(equalTo: singUpContainer.bottomAnchor, constant: Constants.padding*2.4),
            buttonSignUp.heightAnchor.constraint(equalToConstant: Constants.padding*2),
            singInRedirection.topAnchor.constraint(equalTo: buttonSignUp.bottomAnchor, constant: 10),
            singInRedirection.heightAnchor.constraint(equalToConstant: Constants.padding),
            errorLabel.topAnchor.constraint(equalTo: singInRedirection.bottomAnchor, constant: 10),
            errorLabel.heightAnchor.constraint(equalToConstant: Constants.padding)
        ])
        
        // Container elemensts Constrains
        [iconName, iconEmail, iconPasword].forEach { view in NSLayoutConstraint.activate([view.leadingAnchor.constraint(equalTo: singUpContainer.leadingAnchor, constant: 10)])}
        
        [iconName, iconEmail, iconPasword].forEach { view in NSLayoutConstraint.activate([view.widthAnchor.constraint(equalToConstant: 40)])}
        
        [nameTextField, emailTextField, passwordTextField].forEach { view in NSLayoutConstraint.activate([view.leftAnchor.constraint(equalTo: iconName.rightAnchor, constant: 10)])}
        
        [nameTextField, emailTextField, passwordTextField].forEach { view in NSLayoutConstraint.activate([view.rightAnchor.constraint(equalTo: singUpContainer.rightAnchor, constant: -10)])}
        
        NSLayoutConstraint.activate([
            nameTextField.topAnchor.constraint(equalTo: singUpContainer.topAnchor, constant: 10),
            nameTextField.heightAnchor.constraint(equalToConstant: 50),
            emailTextField.topAnchor.constraint(equalTo: nameTextField.bottomAnchor, constant: 10),
            emailTextField.heightAnchor.constraint(equalToConstant: 50),
            passwordTextField.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 10),
            passwordTextField.heightAnchor.constraint(equalToConstant: 50),
            iconName.centerYAnchor.constraint(equalTo: nameTextField.centerYAnchor),
            iconName.heightAnchor.constraint(equalToConstant: 40),
            iconEmail.centerYAnchor.constraint(equalTo: emailTextField.centerYAnchor),
            iconEmail.heightAnchor.constraint(equalToConstant: 25),
            iconPasword.centerYAnchor.constraint(equalTo: passwordTextField.centerYAnchor),
            iconPasword.heightAnchor.constraint(equalToConstant: 25)
        ])
        
        // Special Constrains
        NSLayoutConstraint.activate([
            backButton.widthAnchor.constraint(equalToConstant: Constants.padding)
        ])
        
    }
    func showError() {
            errorLabel.text = "Missed information"
        }
        
    func hideError() {
            errorLabel.text = ""
        }
    //Objc Funcions
    @objc func nameTextFileEditingChanged(){
        hideError()
        singUpViewModel.name = nameTextField.text ?? ""
    }
    
    @objc func emailTextFileEditingChanged(){
        hideError()
        singUpViewModel.email = emailTextField.text ?? ""
    }
    
    @objc func passwordTextFileEditingChanged(){
        hideError()
        singUpViewModel.password = passwordTextField.text ?? ""
    }
   
    @objc func signUpButtonTapped() {
        if singUpViewModel.isValid {
            let nextView = WinesViewController()
            nextView.modalPresentationStyle = .fullScreen
            present(nextView, animated: true, completion: nil)
        } else {
            showError()
        }
    }
    
    @objc func goToNext(){
        let nextVC = SingInViewController()
        nextVC.modalPresentationStyle = .fullScreen
        present(nextVC,animated: true, completion: nil)
    }
    @objc func goToSingIn(){
        let nextVC = SingInViewController()
        nextVC.modalPresentationStyle = .fullScreen
        present(nextVC,animated: true, completion: nil)
    }
    @objc func goToHome(){
        let nextVC = HomeViewController()
        nextVC.modalPresentationStyle = .fullScreen
        present(nextVC,animated: true, completion: nil)
    }
    
}
