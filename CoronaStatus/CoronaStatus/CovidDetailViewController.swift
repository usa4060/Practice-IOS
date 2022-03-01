
import UIKit

class CovidDetailViewController: UITableViewController {
    
    @IBOutlet weak var newCaseCell: UITableViewCell!
    @IBOutlet weak var totalCaseCell: UITableViewCell!
    @IBOutlet weak var recoveredCell: UITableViewCell!
    @IBOutlet weak var deathCell: UITableViewCell!
    @IBOutlet weak var percentageCell: UITableViewCell!
    @IBOutlet weak var overseasInflowCell: UITableViewCell!
    @IBOutlet weak var regionalOutbreakCell: UITableViewCell!
    
    var covidOverview : CovidOverView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureView()
    }
    
    func configureView(){
        guard let covidOverview = self.covidOverview else {return}
        self.title = covidOverview.countryName
        self.newCaseCell.detailTextLabel?.text = "\(covidOverview.newCase)"
        self.totalCaseCell.detailTextLabel?.text = "\(covidOverview.totalCase)"
        self.deathCell.detailTextLabel?.text = "\(covidOverview.death)"
        self.percentageCell.detailTextLabel?.text = "\(covidOverview.percentage)"
        self.recoveredCell.detailTextLabel?.text = "\(covidOverview.recovered)"
        self.overseasInflowCell.detailTextLabel?.text = "\(covidOverview.newFcase)"
        self.regionalOutbreakCell.detailTextLabel?.text = "\(covidOverview.newCcase)"
        
        
    }
    
}
