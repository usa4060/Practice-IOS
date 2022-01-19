import UIKit

class CodePushViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    @IBAction func tapBackButton(_ sender: UIButton) {
        super.navigationController?.popViewController(animated: true)
    }
    
}
