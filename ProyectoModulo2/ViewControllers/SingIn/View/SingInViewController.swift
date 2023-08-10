//
//  LogInViewController.swift
//  FirstViewController
//
//  Created by Fernando Ugalde on 28/06/23.
//

import UIKit

class SingInViewController: UIViewController {
    
    private var singInViewModel = SingInViewModel()

    var titleLabel : UILabel?
    var emailTextField : UITextField?
    var passwordTextField : UITextField?
    var buttonSignIn : UIButton?
    var singInContainer : UIView?
    var singUpRedirection : UIButton?
    var backButton : UIButton?
    var errorLabel: UILabel?
    
    var width = UIScreen.main.bounds.width
    var height = UIScreen.main.bounds.height
    var leftPadding : CGFloat = 25
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        screenElements()
        buttonSignIn?.addTarget(self, action: #selector(signInButtonTapped), for: .touchUpInside)
        emailTextField?.addTarget(self, action: #selector(emailTextFileEditingChanged), for: .editingChanged)
        passwordTextField?.addTarget(self, action: #selector(passwordTextFileEditingChanged), for: .editingChanged)
        view.backgroundColor = UIColor.ligtColor1
    }
    
    func screenElements(){
        titleLabel = UILabel(frame: CGRect(x: 0, y: 20, width: width, height: 200))
        titleLabel?.textAlignment = .center
        titleLabel?.textColor = UIColor.myBackGroundColor
        titleLabel?.font = UIFont(name: "Didot", size: 35)
        titleLabel?.text = "Sing-In"
        view.addSubview(titleLabel!)
        ////////////////////////////////////////////
        singInContainer = UIView()
        singInContainer?.backgroundColor = UIColor.myButtonlColor
        singInContainer?.layer.cornerRadius = 10
        view.addSubview(singInContainer!)
        singInContainer?.translatesAutoresizingMaskIntoConstraints = false
        singInContainer?.topAnchor.constraint(equalTo: view.topAnchor, constant: 190).isActive = true
        singInContainer?.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: leftPadding).isActive = true
        singInContainer?.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -leftPadding).isActive = true
        singInContainer?.bottomAnchor.constraint(equalTo: view.topAnchor, constant: 320).isActive = true
        ////////////////////////////////////////////
        emailTextField = UITextField(frame: CGRect(x: 35, y: 200, width: width-70, height: 50))
        emailTextField?.textAlignment = .left
        emailTextField?.placeholder = "  Email"
        emailTextField?.backgroundColor = UIColor.ligtColor2
        emailTextField?.layer.cornerRadius = 10
        emailTextField?.layer.borderColor = UIColor.black.cgColor
        view.addSubview(emailTextField!)
        ////////////////////////////////////////////
        passwordTextField = UITextField(frame: CGRect(x: 35, y: 260, width: width-70, height: 50))
        passwordTextField?.textAlignment = .left
        passwordTextField?.placeholder = "  Password"
        passwordTextField?.backgroundColor = UIColor.ligtColor2
        passwordTextField?.layer.cornerRadius = 10
        passwordTextField?.layer.borderColor = UIColor.black.cgColor
        view.addSubview(passwordTextField!)
        ////////////////////////////////////////////
        buttonSignIn = UIButton()
        view.addSubview(buttonSignIn!)
        buttonSignIn?.translatesAutoresizingMaskIntoConstraints = false
        buttonSignIn?.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        buttonSignIn?.widthAnchor.constraint(equalTo: singInContainer!.widthAnchor).isActive = true
        buttonSignIn?.topAnchor.constraint(equalTo: singInContainer!.bottomAnchor, constant: 60).isActive = true
        buttonSignIn?.heightAnchor.constraint(equalToConstant: 50).isActive = true
        //Propeties
        buttonSignIn?.backgroundColor = UIColor.myButtonlColor
        buttonSignIn?.layer.cornerRadius = 20
        buttonSignIn?.titleLabel?.font = UIFont(name: "Georgia Bold", size: 20)
        buttonSignIn?.setTitle("Sing In", for: .normal)
        buttonSignIn?.setTitleColor(UIColor.ligtColor1, for: .normal)
        //buttonSignIn?.addTarget(self, action: #selector(goToNext), for: .touchUpInside)
        view.addSubview(buttonSignIn!)
        ////////////////////////////////////////////
        singUpRedirection = UIButton()
        view.addSubview(singUpRedirection!)
        singUpRedirection?.translatesAutoresizingMaskIntoConstraints = false
        singUpRedirection?.leftAnchor.constraint(equalTo: buttonSignIn!.leftAnchor)
        singUpRedirection?.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        singUpRedirection?.widthAnchor.constraint(equalTo: singInContainer!.widthAnchor).isActive = true
        singUpRedirection?.topAnchor.constraint(equalTo: buttonSignIn!.bottomAnchor, constant: 10).isActive = true
        singUpRedirection?.heightAnchor.constraint(equalToConstant: 25).isActive = true
        //Propeties
        singUpRedirection?.backgroundColor = UIColor.clear
        singUpRedirection?.titleLabel?.font = UIFont(name: "Georgia", size: 20)
        singUpRedirection?.setTitle("I haven't an account", for: .normal)
        singUpRedirection?.setTitleColor(UIColor.myBackGroundColor, for: .normal)
        singUpRedirection?.addTarget(self, action: #selector(goToSingUp), for: .touchUpInside)
        view.addSubview(singUpRedirection!)
        /////////////////////////////////////////////////////////////////
        backButton = UIButton()
        view.addSubview(backButton!)
        backButton?.translatesAutoresizingMaskIntoConstraints = false
        backButton?.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -leftPadding).isActive = true
        backButton?.widthAnchor.constraint(equalToConstant: 25).isActive = true
        backButton?.centerYAnchor.constraint(equalTo: titleLabel!.centerYAnchor, constant: -25/2).isActive = true
        backButton?.heightAnchor.constraint(equalToConstant: 25).isActive = true
        //Propeties
        backButton?.backgroundColor = UIColor.clear
        backButton?.setImage(UIImage(systemName: "house.fill"), for: .normal)
        backButton?.tintColor = UIColor.myBackGroundColor
        backButton?.addTarget(self, action: #selector(goToHome), for: .touchUpInside)
        view.addSubview(backButton!)
        ////////////////////////////////
        errorLabel = UILabel()
        errorLabel?.textColor = UIColor.myBackGroundColor
        //errorLabel?.text = "HOLA"
        errorLabel?.font = UIFont(name: "Didot", size: 35)
        errorLabel?.textAlignment = .center
        errorLabel?.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(errorLabel!)
        
        errorLabel?.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -leftPadding).isActive = true
        errorLabel?.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        //errorLabel?.centerXAnchor.constraint(equalTo: titleLabel!.centerXAnchor, constant: -25/2).isActive = true
        //errorLabel?.heightAnchor.constraint(equalToConstant: 25).isActive = true
        errorLabel?.topAnchor.constraint(equalTo: singUpRedirection!.bottomAnchor, constant: 10).isActive = true
       
        ///
        
        
    }
    
    //MARK: Funciones
    
    func showError() {
            errorLabel!.text = "Todos los campos deben estar llenos"
        }
        
    func hideError() {
            errorLabel!.text = ""
        }
    
    @objc func emailTextFileEditingChanged(){
        hideError()
        singInViewModel.email = emailTextField!.text ?? ""
    }
    
    @objc func passwordTextFileEditingChanged(){
        hideError()
        singInViewModel.password = passwordTextField!.text ?? ""
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
    
    @objc func goToNext(){
        let nextVC = WinesViewController()
        nextVC.modalPresentationStyle = .fullScreen
        present(nextVC,animated: true, completion: nil)
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
