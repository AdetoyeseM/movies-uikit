//
//  LoginViewController.swift
//  movies_uikit
//
//  Created by Ademola Fadumo on 02/09/2023.
//

import UIKit

protocol LoginViewDelegate: AnyView, AnyObject {}

class LoginViewController: UIViewController, LoginViewDelegate {

    var presenter: AnyPresenter?

    private let loginButton: UIButton = {
        let button = UIButton()
        button.setTitle("Login with Web", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.configuration = .plain()
        button.backgroundColor = .purple
        button.layer.cornerRadius = 12
        button.configuration?.contentInsets = NSDirectionalEdgeInsets(top: 12, leading: 24, bottom: 12, trailing: 24)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.heightAnchor.constraint(equalToConstant: 44).isActive = true
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        view.backgroundColor = .systemBackground
        view.addSubview(loginButton)

        loginButton.addTarget(self, action: #selector(something), for: .touchUpInside)
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()

        loginButton.center = self.view.center
    }

    @objc
    private func something() {
        (presenter as? LoginPresenter)?.loginWithWebAuthButtonPressed()
    }
}
