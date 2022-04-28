import UIKit

class AddDestinationController: UIViewController {

    
    @IBOutlet weak var countingLabel: UILabel!
    @IBOutlet weak var startDatePicker: UIDatePicker!
    @IBOutlet weak var endDatePicker: UIDatePicker!
    var timer = TimeInterval()
    override func viewDidLoad() {
        super.viewDidLoad()
//        timer = NSTimer.scheduledTimerWithTimeInterval(1, target:self, selector: "updateCounter", userInfo: nil, repeats: true)

        // Do any additional setup after loading the view.
        updateCounter()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func selectStartDate( sender: Any) {
        updateCounter()
    }

    @IBAction func selectEndDate( sender: Any) {
        updateCounter()

    }

    func updateCounter() {
        let timeLeft = endDatePicker.date.timeIntervalSinceNow - startDatePicker.date.timeIntervalSinceNow
        countingLabel.text = timeLeft.time
    }

}

extension TimeInterval {
    var time:String {
        return String(format:"%02d", Int((self/86400)), Int((self/3600.0)), Int((self/60.0)), Int((self)))
    }
}

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

