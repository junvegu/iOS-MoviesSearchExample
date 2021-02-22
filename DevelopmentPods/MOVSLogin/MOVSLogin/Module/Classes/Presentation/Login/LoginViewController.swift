//
//  LoginViewController.swift
//  MOVSLogin
//
//  Created by Junior on 2/21/21.
//

import UIKit
class LoginViewController : UIViewController {
    
    //MARK:- CreateLogibn
    @IBOutlet weak var usernameUITextField: UITextField!
    @IBOutlet weak var passwordUITextField: UITextField!
    @IBOutlet weak var errorUILabel: UILabel!
    
    private var viewModel: LoginViewModel!
    
    static func create(with viewModel: LoginViewModel) -> LoginViewController? {
        guard let view = UIStoryboard.init(name: "Login", bundle: Bundle(for: Self.self).resource).instantiateViewController(withIdentifier: "LoginViewController") as? LoginViewController else {
            return nil
        }
        view.viewModel = viewModel
        return view
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bind(to: viewModel)
        viewModel.viewDidLoad()
        let tap = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
    }
    
    private func bind(to viewModel: LoginViewModel) {
        viewModel.isLoginSuccess.observe(on: self) { [weak self] _ in  self?.navigateMain()}
        viewModel.loading.observe(on: self) { [weak self] in self?.updateLoading($0) }
        viewModel.error.observe(on: self) { [weak self] in self?.showError($0) }
    }
    
    
    @IBAction func loginDidSelect(_ sender: Any) {
        viewModel.login(username: usernameUITextField.text ?? "", password: passwordUITextField.text ?? "")
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    private func navigateMain(){
        viewModel.
    }
    
    private func updateLoading(_ loading: LoginViewModelLoading?){
        switch loading {
        case .fullScreen:
            self.displayAnimatedActivityIndicatorView()
        default:
            self.hideAnimatedActivityIndicatorView()
        }
    }
    
    private func showError(_ error: String) {
        errorUILabel.text = error
        UIView.transition(with: errorUILabel, duration: 0.4,
                          options: .curveEaseIn,
                          animations: {
                            self.errorUILabel.isHidden = error.isEmpty
                          })
    }
}


