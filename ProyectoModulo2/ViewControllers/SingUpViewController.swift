//
//  SingUpViewController.swift
//  FirstViewController
//
//  Created by Fernando Ugalde on 28/06/23.
//

import UIKit

class SingUpViewController: UIViewController {
    
    var titleLabel : UILabel?
    var nameTextField : UITextField?
    var emailTextField : UITextField?
    var passwordTextField : UITextField?
    var singUpContainer : UIView?
    var buttonSignUp : UIButton?
    var iconName : UIImageView?
    var iconEmail : UIImageView?
    var iconPasword : UIImageView?
    var singInRedirection: UIButton?
    var backButton : UIButton?

    var width = UIScreen.main.bounds.width
    var height = UIScreen.main.bounds.height
    var leftPadding : CGFloat = 25
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.ligtColor1
        screenElements()
    }
    
    func screenElements(){
        //singUpContainer = UIView(frame: CGRect(x: 25, y: 190, width: width-50, height: 130))
        singUpContainer = UIView()
        singUpContainer?.backgroundColor = UIColor.myButtonlColor
        singUpContainer?.layer.cornerRadius = 10
        view.addSubview(singUpContainer!)
        ////////////////////////////////////////////
        singUpContainer?.translatesAutoresizingMaskIntoConstraints = false
        singUpContainer?.topAnchor.constraint(equalTo: view.topAnchor, constant: 190).isActive = true
        singUpContainer?.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: leftPadding).isActive = true
        singUpContainer?.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -leftPadding).isActive = true
        singUpContainer?.bottomAnchor.constraint(equalTo: view.topAnchor, constant: 380).isActive = true
        ////////////////////////////////////////////
        iconName = UIImageView(frame: CGRect(x: 10, y: 15, width: 40, height: 40))
        iconName?.image = UIImage(systemName: "person.fill.badge.plus")
        iconName?.tintColor = UIColor.myBackGroundColor
        singUpContainer?.addSubview(iconName!)
        ////////////////////////////////////////////
        nameTextField = UITextField(frame: CGRect(x: 60, y: 10, width: width-120, height: 50))
        nameTextField?.textAlignment = .left
        nameTextField?.placeholder = "  Add your name"
        nameTextField?.backgroundColor = UIColor.ligtColor2
        nameTextField?.layer.cornerRadius = 10
        nameTextField?.layer.borderColor = UIColor.black.cgColor
        singUpContainer?.addSubview(nameTextField!)
        ///////////////////////////////////////////
        iconEmail = UIImageView(frame: CGRect(x: 10, y: 82.5, width: 40, height: 25))
        iconEmail?.image = UIImage(systemName: "envelope.fill")
        iconEmail?.tintColor = UIColor.myBackGroundColor
        singUpContainer?.addSubview(iconEmail!)
        /////////////////////////////////////////////
        emailTextField = UITextField(frame: CGRect(x: 60, y: 70, width: width-120, height: 50))
        emailTextField?.textAlignment = .left
        emailTextField?.placeholder = "  Add your e-mail"
        emailTextField?.backgroundColor = UIColor.ligtColor2
        emailTextField?.layer.cornerRadius = 10
        emailTextField?.layer.borderColor = UIColor.black.cgColor
        singUpContainer?.addSubview(emailTextField!)
        //////////////////////////////////////////////
        iconPasword = UIImageView(frame: CGRect(x: 10, y: 145, width: 40, height: 20))
        iconPasword?.image = UIImage(systemName: "key.horizontal.fill")
        iconPasword?.tintColor = UIColor.myBackGroundColor
        singUpContainer?.addSubview(iconPasword!)
        ////////////////////////////////////////////////
        passwordTextField = UITextField(frame: CGRect(x: 60, y: 130, width: width-120, height: 50))
        passwordTextField?.textAlignment = .left
        passwordTextField?.placeholder = "  Add your password"
        passwordTextField?.backgroundColor = UIColor.ligtColor2
        passwordTextField?.layer.cornerRadius = 10
        passwordTextField?.layer.borderColor = UIColor.black.cgColor
        singUpContainer?.addSubview(passwordTextField!)
        ///////////////////////////////////////////////////////////////
        titleLabel = UILabel(frame: CGRect(x: 0, y: 20, width: width, height: 200))
        titleLabel?.textAlignment = .center
        titleLabel?.textColor = UIColor.myBackGroundColor
        titleLabel?.font = UIFont(name: "Didot", size: 35)
        titleLabel?.text = "Sing-Up"
        view.addSubview(titleLabel!)
        /////////////////////////////////////////////////////
        buttonSignUp = UIButton()
        view.addSubview(buttonSignUp!)
        buttonSignUp?.translatesAutoresizingMaskIntoConstraints = false
        buttonSignUp?.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        buttonSignUp?.widthAnchor.constraint(equalTo: singUpContainer!.widthAnchor).isActive = true
        buttonSignUp?.topAnchor.constraint(equalTo: singUpContainer!.bottomAnchor, constant: 60).isActive = true
        buttonSignUp?.heightAnchor.constraint(equalToConstant: 50).isActive = true
        //Propeties
        buttonSignUp?.backgroundColor = UIColor.myButtonlColor
        buttonSignUp?.layer.cornerRadius = 20
        buttonSignUp?.titleLabel?.font = UIFont(name: "Georgia Bold", size: 20)
        buttonSignUp?.setTitle("Sing Up", for: .normal)
        buttonSignUp?.setTitleColor(UIColor.ligtColor1, for: .normal)
        buttonSignUp?.addTarget(self, action: #selector(goToNext), for: .touchUpInside)
        view.addSubview(buttonSignUp!)
        ///////////////////////////////////////////////////////////////
        singInRedirection = UIButton()
        view.addSubview(singInRedirection!)
        singInRedirection?.translatesAutoresizingMaskIntoConstraints = false
        singInRedirection?.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        singInRedirection?.widthAnchor.constraint(equalTo: singUpContainer!.widthAnchor).isActive = true
        singInRedirection?.topAnchor.constraint(equalTo: buttonSignUp!.bottomAnchor, constant: 10).isActive = true
        singInRedirection?.heightAnchor.constraint(equalToConstant: 25).isActive = true
        //Propeties
        singInRedirection?.backgroundColor = UIColor.clear
        singInRedirection?.titleLabel?.font = UIFont(name: "Georgia", size: 20)
        singInRedirection?.titleLabel?.isHighlighted = true
        singInRedirection?.setTitle("I have an account", for: .normal)
        singInRedirection?.setTitleColor(UIColor.myBackGroundColor, for: .normal)
        singInRedirection?.addTarget(self, action: #selector(goToSingIn), for: .touchUpInside)
        view.addSubview(singInRedirection!)
        ////////////////////////////////////////////////
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
