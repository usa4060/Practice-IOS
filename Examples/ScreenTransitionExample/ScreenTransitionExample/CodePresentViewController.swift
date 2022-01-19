
import UIKit


protocol SendDataDelegate: AnyObject {
    func SendData(name:String)
}

class CodePresentViewController: UIViewController {

    
    @IBOutlet weak var nameLabel: UILabel!
    var name : String?
    weak var delegate : SendDataDelegate?
    override func viewDidLoad() {
        super.viewDidLoad()
        if let myname = name {
            self.nameLabel.text = myname
            self.nameLabel.sizeToFit()
        }

    }
    
    @IBAction func tapBackButton(_ sender: UIButton) {
        self.delegate?.SendData(name: "Yongin")
        self.presentingViewController?.dismiss(animated: true, completion: nil)
    }
    
}
