
import UIKit


protocol LEDBoardSettiongDelegate:AnyObject{
    func changedSetting(text:String?, textColor: UIColor, backgroundColor: UIColor)
}

// delegate는 쉽게 말해서, 내가 정보를 만들고자 하는 곳에 프로토콜을 통해 해당 정보를 생성해놓고.
// 프로토콜 자체로는 함수구현이 이루어지지 않으니, 프로토콜을 
class SettingViewController: UIViewController {
    
    @IBOutlet weak var o_btn: UIButton!
    @IBOutlet weak var s_btn: UIButton!
    @IBOutlet weak var b_btn: UIButton!
    @IBOutlet weak var g_btn: UIButton!
    @IBOutlet weak var p_btn: UIButton!
    @IBOutlet weak var y_btn: UIButton!

    
    @IBOutlet weak var textField: UITextField!
    
    
    weak var delegate:LEDBoardSettiongDelegate?
    
    var textColor : UIColor = .yellow
    var backgroundColor : UIColor = .black
    
    var ledText : String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureview()
    }
    
    private func configureview(){
        if let ledText = self.ledText {
            self.textField.text = ledText
        }
        self.changeTextColor(color: self.textColor)
        self.changeBackgroundColor(color: self.backgroundColor)
    }
    
    
    @IBAction func tapTextColorBtn(_ sender: UIButton) {
        if sender == self.y_btn{
            self.changeTextColor(color: .yellow)
            self.textColor = .yellow
        }
        else if sender == self.p_btn{
            self.changeTextColor(color: .purple)
            self.textColor = .purple
        }
        else {
            self.changeTextColor(color: .green)
            self.textColor = .green
        }
    }
    
    @IBAction func tapBackgroundColorBtn(_ sender: UIButton) {
        if sender == self.b_btn{
            self.changeBackgroundColor(color: .black)
            self.backgroundColor = .black
        }
        else if sender == self.s_btn{
            self.changeBackgroundColor(color: .blue)
            self.backgroundColor = .blue
        }
        else {
            self.changeBackgroundColor(color: .orange)
            self.backgroundColor = .orange
        }
        
    }
    @IBAction func saveBtn(_ sender: UIButton) {
        self.delegate?.changedSetting(
            text:self.textField.text,
            textColor: self.textColor,
            backgroundColor: self.backgroundColor
            )
        self.navigationController?.popViewController(animated: true)
    }
    
    private func changeTextColor(color : UIColor){
        self.y_btn.alpha = color == UIColor.yellow ? 1 : 0.2
        self.p_btn.alpha = color == UIColor.purple ? 1 : 0.2
        self.g_btn.alpha = color == UIColor.green ? 1 : 0.2
        
    }
    
    private func changeBackgroundColor(color : UIColor){
        self.b_btn.alpha = color == UIColor.black ? 1 : 0.2
        self.s_btn.alpha = color == UIColor.blue ? 1 : 0.2
        self.o_btn.alpha = color == UIColor.orange ? 1 : 0.2
    }
}
