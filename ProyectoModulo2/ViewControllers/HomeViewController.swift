//
//  ViewController.swift
//  FirstViewController
//
//  Created by Fernando Ugalde on 27/06/23.
//

import UIKit

class HomeViewController: UIViewController {
    
    var newView : UIView?
    var newLabel : UILabel?
    var singUpButton : UIButton?
    var singInButton : UIButton?
    var startImage : UIImageView?
    var logInContainer : UIView?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .myBackGroundColor
        initializeElements()
    }
    func initializeElements(){
                
        //View over the main view
        newView = UIView(frame: CGRect(x: 0, y: 0, width: Constants.width, height: Constants.height))
        newView?.backgroundColor = .myBackGroundColor
        view.addSubview(newView!)
        
        //singInContainer = UIView(frame: CGRect(x: 25, y: 190, width: width-50, height: 130))
        logInContainer = UIView()
        logInContainer?.backgroundColor = .clear
        logInContainer?.layer.cornerRadius = 10
        view.addSubview(logInContainer!)
        
        logInContainer?.translatesAutoresizingMaskIntoConstraints = false
        logInContainer?.topAnchor.constraint(equalTo: view.topAnchor, constant: Constants.leftPadding).isActive = true
        logInContainer?.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: Constants.leftPadding).isActive = true
        //logInContainer?.widthAnchor.constraint(equalToConstant: width-(padding*2)).isActive = true
        logInContainer?.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -Constants.leftPadding).isActive = true
        logInContainer?.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -Constants.leftPadding).isActive = true
        

        newLabel = UILabel()
        logInContainer?.addSubview(newLabel!)
        newLabel?.translatesAutoresizingMaskIntoConstraints = false
        newLabel?.topAnchor.constraint(equalTo: logInContainer!.topAnchor, constant: Constants.leftPadding*2).isActive = true
        newLabel?.leadingAnchor.constraint(equalTo: logInContainer!.leadingAnchor).isActive = true
        newLabel?.widthAnchor.constraint(equalTo: logInContainer!.widthAnchor).isActive = true
    
        //Propeties
        newLabel?.textColor = UIColor.ligtColor1
        newLabel?.textAlignment = .center
        newLabel?.font = UIFont(name: "Didot Bold", size: 35)
        newLabel?.text = "Mobile-Sommelier"
        
        //Put in view
        logInContainer?.addSubview(newLabel!)
        
        //Possisining Image
        startImage = UIImageView()
        logInContainer?.addSubview(startImage!)
        startImage?.translatesAutoresizingMaskIntoConstraints = false
        startImage?.centerXAnchor.constraint(equalTo: logInContainer!.centerXAnchor).isActive = true
        startImage?.centerYAnchor.constraint(equalTo: logInContainer!.centerYAnchor,constant: -60).isActive = true
        startImage?.widthAnchor.constraint(equalToConstant: 180).isActive = true
        //P
        startImage?.image = UIImage(named: "startImage")
        startImage?.layer.masksToBounds = true
        startImage?.contentMode = .scaleAspectFit
        logInContainer?.addSubview(startImage!)
        
        
        //Button
        //Possisioning
        //singUpButton = UIButton(frame: CGRect(x: 20, y: 550, width: width-120, height: 50))
        singUpButton = UIButton()
        logInContainer?.addSubview(singUpButton!)
        singUpButton?.translatesAutoresizingMaskIntoConstraints = false
        singUpButton?.centerXAnchor.constraint(equalTo: logInContainer!.centerXAnchor).isActive = true
        singUpButton?.widthAnchor.constraint(equalTo: logInContainer!.widthAnchor).isActive = true
        singUpButton?.topAnchor.constraint(equalTo: logInContainer!.centerYAnchor, constant: 160).isActive = true
        singUpButton?.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        
        
        //Propeties
        singUpButton?.backgroundColor = UIColor.myButtonlColor
        singUpButton?.layer.cornerRadius = 20
        singUpButton?.titleLabel?.font = UIFont(name: "Georgia Bold", size: 20)
        singUpButton?.setTitle("Sing Up", for: .normal)
        singUpButton?.setTitleColor(UIColor.ligtColor1, for: .normal)
        singUpButton?.addTarget(self, action: #selector(singUpViewController), for: .touchUpInside)
        logInContainer?.addSubview(singUpButton!)
        ///
        singInButton = UIButton()
        logInContainer?.addSubview(singInButton!)
        singInButton?.translatesAutoresizingMaskIntoConstraints = false
        singInButton?.topAnchor.constraint(equalTo: singUpButton!.firstBaselineAnchor, constant: 30).isActive = true
        singInButton?.centerXAnchor.constraint(equalTo: logInContainer!.centerXAnchor).isActive = true
        singInButton?.widthAnchor.constraint(equalTo: logInContainer!.widthAnchor).isActive = true
        singInButton?.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        
        singInButton?.backgroundColor = UIColor.myButtonlColor
        singInButton?.layer.cornerRadius = 20
        singInButton?.titleLabel?.font = UIFont(name: "Georgia Bold", size: 20)
        singInButton?.setTitle("Sing In", for: .normal)
        singInButton?.setTitleColor(UIColor.ligtColor1, for: .normal)
        singInButton?.addTarget(self, action: #selector(singInViewController), for: .touchUpInside)
        logInContainer?.addSubview(singInButton!)
        ///
    }
    
    @objc func singInViewController() {
        print("Sing In button presed")
        let goTo = SingInViewController()
        goTo.modalPresentationStyle = .fullScreen
        present(goTo, animated: true, completion: nil)
    
    }
    @objc func singUpViewController() {
        print("Sing Un button presed")
        let goTo = SingUpViewController()
        goTo.modalPresentationStyle = .fullScreen
        present(goTo, animated: true, completion: nil)
    }

}
