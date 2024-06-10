import UIKit

// Экран с возможными действиями взаимодействия
final class NewController: UIViewController {
    // MARK: - IBOutlet
    private @IBOutlet weak var fioTextField: UITextField!
    private @IBOutlet weak var countTextField: UITextField!
    private @IBOutlet weak var numberTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fioTextField.delegate = self
        countTextField.delegate = self
        numberTextField.delegate = self
    }
    
    // MARK: - IBAction
    private @IBAction func entryButton(_ sender: UIButton) {
        if fioTextField.text!.isEmpty || countTextField.text!.isEmpty || numberTextField.text!.isEmpty {
            let alertController = UIAlertController(title: "Ошибка", message: "Введите все данные", preferredStyle: .alert)
            let action = UIAlertAction(title: "OK", style: .default, handler: nil)
            alertController.addAction(action)
            self.present(alertController, animated: true, completion: nil)
        }
        let alertController = UIAlertController(title: "Выставить чек?", message: "", preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        let checkAction = UIAlertAction(title: "Чек", style: .default) { action in
            let storyBoard = UIStoryboard(name: "Main", bundle: nil)
            let thirdController = storyBoard.instantiateViewController(withIdentifier: "ViewController3") as! ViewController3
            self.navigationController?.pushViewController(thirdController, animated: true)
        }
        alertController.addAction(cancelAction)
        alertController.addAction(checkAction)
        self.present(alertController, animated: true, completion: nil)
    }
}

// Переход клавиатуры на новую строчку textField
extension ViewController2: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == fioTextField {
            countTextField.becomeFirstResponder()
        } else if textField == countTextField {
            numberTextField.becomeFirstResponder()
        } else {
            textField.resignFirstResponder()
        }
        return true
    }
}
