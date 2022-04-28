import UIKit

//var onToDoListViewDismissedHandler: (() -> Void)? = nil

class SelectActivitiesViewController: UIViewController {
    
    var toDoListViewController = ToDoListViewController()
    
    var list: [String] = []
    
    var listItems = ListItems()
    
    var isDomesticClicked = false
    var isInternationalClicked = false
    var isPersonalClicked = false
    var isPublicClicked = false
    var isCityClicked = false
    var isCountryClicked = false
    var isMountainClicked = false
    var isBeachClicked = false
    var isSwimmingClicked = false
    var isHikingClicked = false
    var isFishingClicked = false
    var isGardeningClicked = false

    
    @IBOutlet weak var domesticBackground: UIImageView!
    @IBOutlet weak var internationalBackground: UIImageView!
    @IBOutlet weak var personalBackground: UIImageView!
    @IBOutlet weak var publicBackground: UIImageView!
    @IBOutlet weak var cityBackground: UIImageView!
    @IBOutlet weak var countryBackground: UIImageView!
    @IBOutlet weak var mountainBackground: UIImageView!
    @IBOutlet weak var beachBackground: UIImageView!
    @IBOutlet weak var swimmingBackground: UIImageView!
    @IBOutlet weak var hikingBackground: UIImageView!
    @IBOutlet weak var fishingBackground: UIImageView!
    @IBOutlet weak var gardeningBackground: UIImageView!
    
    
    @IBOutlet weak var domesticButtonOutlet: UIButton!
    @IBOutlet weak var internationalButtonOutlet: UIButton!
    @IBOutlet weak var personalButtonOutlet: UIButton!
    @IBOutlet weak var publicButtonOutlet: UIButton!
    @IBOutlet weak var cityButtonOutlet: UIButton!
    @IBOutlet weak var countryButtonOutlet: UIButton!
    @IBOutlet weak var mountainButtonOutlet: UIButton!
    @IBOutlet weak var beachButtonOutlet: UIButton!
    @IBOutlet weak var swimmingButtonOutlet: UIButton!
    @IBOutlet weak var hikingButtonOutlet: UIButton!
    @IBOutlet weak var fishingButtonOutlet: UIButton!
    @IBOutlet weak var gardeningButtonOutlet: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        onToDoListViewDismissedHandler = onToDoListViewDismissed
//        resetButtonState()
    }
    
//    func resetButtonState() -> Void
//    {
//        isDomesticClicked = false
//        isInternationalClicked = false
//        isPersonalClicked = false
//        isPublicClicked = false
//        isCityClicked = false
//        isCountryClicked = false
//        isMountainClicked = false
//        isBeachClicked = false
//        isSwimmingClicked = false
//        isHikingClicked = false
//        isFishingClicked = false
//        isGardeningClicked = false
//    }
    
//    func onToDoListViewDismissed() -> Void
//    {
//        resetButtonState()
//    }
    
    func buttonClicked(status: Bool, background: UIImageView) {
        if status {
            background.image = UIImage(named: "RectangleBorder")
        } else {
            background.image = UIImage(named: "RectangleWhite")
        }
    }
    
    @IBAction func createMyListClicked(_ sender: UIButton) {
        for i in list {
            toDoListViewController.createData(name: i)
        }
    }
    
    @IBAction func domesticButtonClicked(_ sender: UIButton) {
        isDomesticClicked = !isDomesticClicked
        buttonClicked(status: isDomesticClicked, background: domesticBackground)
        
        if isDomesticClicked {
            for i in listItems.domesticArray {
                // logicnya dipindahin ke view did load
                // terus didetect if coredata has object ga perlu di append
                // kalau array ada update penambahan object, baru di append
                list.append(i)
            }
        } else {
            // harusnya ga remove all (cuman delete yang gajadi diclick aja harusnya)
            list.removeAll()
        }
    }
    
    @IBAction func internationalButtonClicked(_ sender: UIButton) {
        isInternationalClicked = !isInternationalClicked
        buttonClicked(status: isInternationalClicked, background: internationalBackground)
        
        if isInternationalClicked {
            for i in listItems.internationalArray {
                list.append(i)
            }
        } else {
            list.removeAll()
        }
    }
    
    @IBAction func personalButtonClicked(_ sender: UIButton) {
        isPersonalClicked = !isPersonalClicked
        buttonClicked(status: isPersonalClicked, background: personalBackground)
        
        if isPersonalClicked {
            for i in listItems.personalArray {
                list.append(i)
            }
        } else {
            list.removeAll()
        }
    }
    
    @IBAction func publicButtonClicked(_ sender: UIButton) {
        isPublicClicked = !isPublicClicked
        buttonClicked(status: isPublicClicked, background: publicBackground)
        
        if isPublicClicked {
            for i in listItems.publicArray {
                list.append(i)
            }
        } else {
            list.removeAll()
        }
    }
    
    @IBAction func cityButtonClicked(_ sender: UIButton) {
        isCityClicked = !isCityClicked
        buttonClicked(status: isCityClicked, background: cityBackground)
        
        if isCityClicked {
            for i in listItems.cityArray {
                list.append(i)
            }
        } else {
            list.removeAll()
        }
    }
    
    @IBAction func countryButtonClicked(_ sender: UIButton) {
        isCountryClicked = !isCountryClicked
        buttonClicked(status: isCountryClicked, background: countryBackground)
        
        if isCountryClicked {
            for i in listItems.countryArray {
                list.append(i)
            }
        } else {
            list.removeAll()
        }
    }
    
    @IBAction func mountainClicked(_ sender: UIButton) {
        isMountainClicked = !isMountainClicked
        buttonClicked(status: isMountainClicked, background: mountainBackground)
        
        if isMountainClicked {
            for i in listItems.mountainArray {
                list.append(i)
            }
        } else {
            list.removeAll()
        }
    }
    
    @IBAction func beachButtonClicked(_ sender: UIButton) {
        isBeachClicked = !isBeachClicked
        buttonClicked(status: isBeachClicked, background: beachBackground)
        
        if isBeachClicked {
            for i in listItems.beachArray {
                list.append(i)
            }
        } else {
            list.removeAll()
        }
    }
    
    @IBAction func swimmingButtonClicked(_ sender: UIButton) {
        isSwimmingClicked = !isSwimmingClicked
        buttonClicked(status: isSwimmingClicked, background: swimmingBackground)
        
        if isSwimmingClicked {
            for i in listItems.swimmingArray {
                list.append(i)
            }
        } else {
            list.removeAll()
        }
    }
    
    @IBAction func hikingButtonClicked(_ sender: UIButton) {
        isHikingClicked = !isHikingClicked
        buttonClicked(status: isHikingClicked, background: hikingBackground)
        
        if isHikingClicked {
            for i in listItems.hikingArray {
                list.append(i)
            }
        } else {
            list.removeAll()
        }
    }
    
    @IBAction func fishingButtonClicked(_ sender: UIButton) {
        isFishingClicked = !isFishingClicked
        buttonClicked(status: isFishingClicked, background: fishingBackground)
        
        if isFishingClicked {
            for i in listItems.fishingArray {
                list.append(i)
            }
        } else {
            list.removeAll()
        }
    }
    
    @IBAction func gardeningButtonClicked(_ sender: UIButton) {
        isGardeningClicked = !isGardeningClicked
        buttonClicked(status: isGardeningClicked, background: gardeningBackground)
        
        if isGardeningClicked {
            for i in listItems.gardeningArray {
                list.append(i)
            }
        } else {
            list.removeAll()
        }
    }
}
