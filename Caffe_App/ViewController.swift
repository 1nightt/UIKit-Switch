// VC Регистрации пользователей

import UIKit

final class ViewController: UIViewController {
    // MARK: - IBOutlet
    private @IBOutlet weak var emailTextField: UITextField!
    private @IBOutlet weak var passwordTextField: UITextField!
    
    // MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        emailTextField.delegate = self
        passwordTextField.delegate = self
    }
    
    // MARK: - IBAction
    private @IBAction func entryButton(_ sender: UIButton) {
        if self.emailTextField.text!.isEmpty || self.passwordTextField.text!.isEmpty {
            let alertController = UIAlertController(title: "Ошибка", message: "Введите логин и пароль", preferredStyle: .alert)
            let action = UIAlertAction(title: "OK", style: .default, handler: nil)
            alertController.addAction(action)
            self.present(alertController, animated: true, completion: nil)
        }
    }
    
}

// Расширение для автоматического перехода клавиатуры на новую строчку
extension ViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == emailTextField {
            passwordTextField.becomeFirstResponder()
        } else {
            textField.resignFirstResponder()
        }
        return true
    }
}
