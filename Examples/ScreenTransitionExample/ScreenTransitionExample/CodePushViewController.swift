import UIKit

class CodePushViewController: UIViewController {

    @IBOutlet weak var nameLabel: UILabel!
    
    var name : String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let myname = name {
            self.nameLabel.text = myname
            self.nameLabel.sizeToFit()
        }
        
    }
    
    @IBAction func tapBackButton(_ sender: UIButton) {
        super.navigationController?.popViewController(animated: true)
    }
    
}
