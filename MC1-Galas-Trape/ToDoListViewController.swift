//
//  ToDoListViewController.swift
//  MC1-Galas-Trape
//
//  Created by Renzo Alvaroshan on 11/04/22.
//

import UIKit
import CoreData

struct ItemModel {
    var itemName = ""
    var itemStatus = false
}

class ToDoListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var totalCompleted: UILabel!
    @IBOutlet weak var totalList: UILabel!
    
    //    var selectActivitiesVC = SelectActivitiesViewController()
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    @IBOutlet weak var tableView: UITableView?
    var completedItems = 0
    
    var models = [ItemModel]()
    var selectedCell = 0
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
//        onToDoListViewDismissedHandler?()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView?.delegate = self
        tableView?.dataSource = self
        tableView?.frame = view.bounds
        
        setupCoreData()
        
        completedItems = countTrue()
        updateLabels(completedItems)
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(didTapAdd))
    }
    
    func setupCoreData() {
        retrieveData()
        tableView?.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return models.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = models[indexPath.row].itemName
        cell.accessoryType = models[indexPath.row].itemStatus ? .checkmark : .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            deleteData(productName: models[indexPath.row])
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        selectedCell = indexPath.row
        models[indexPath.row].itemStatus = !models[indexPath.row].itemStatus
        tableView.reloadRows(at: [indexPath], with: .automatic)
        updateCoreData(item: models[indexPath.row])
        
        completedItems = countTrue()
        
        updateLabels(completedItems)
    }
    
    func countTrue() -> Int {
        var count = 0
        for model in models{
            if(model.itemStatus == true){
                count += 1
            }
        }
        return count
    }
    
    func updateLabels(_ total:Int){
        totalCompleted.text = String(total)
        totalList.text = String(models.count)
    }
    
    @objc private func didTapAdd() {
        let alert = UIAlertController(title: "New Item", message: "Enter New Item", preferredStyle: .alert)
        alert.addTextField(configurationHandler: nil)
        alert.addAction(UIAlertAction(title: "Submit", style: .cancel, handler: { [weak self] _ in
            guard let field = alert.textFields?.first, let text = field.text, !text.isEmpty else { return }
            
            self?.createData(name: text)
            self?.updateLabels(self!.completedItems)
        }))
        
        present(alert, animated: true)
    }
    
    // MARK: CoreData
    
    func createData(name: String) {
        // kita perlu buat container dari coredata nya, container core data itu ada di appdelegate file
        // 1. Kita perlu akses app delegate? karena semua codingan coredata container ada didalam appdelegate
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        
        // 2. Setelah ada akses ke app delegate, maka kita bisa akses si container coredata nya
        let manageContext = appDelegate.persistentContainer.viewContext
        
        // 3. Kita udah akses container nya, sekarang kita akses entity dari core datanya untuk bisa assign value dari attribute yang ada di entity core data kita
        guard let productEntity = NSEntityDescription.entity(forEntityName: "ToDoListItem", in: manageContext) else { return }
        
        let product = NSManagedObject(entity: productEntity, insertInto: manageContext)
        product.setValue(name, forKey: "name")
        product.setValue(false, forKey: "completed")
        
        setupCoreData()
    }
    
    func retrieveData() {
        // Make sure local model juga kosong ga ada data
        models.removeAll()
        // kita perlu buat container dari coredata nya, container core data itu ada di appdelegate file
        // 1. Kita perlu akses app delegate? karena semua codingan coredata container ada didalam appdelegate
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        
        // 2. Setelah ada akses ke app delegate, maka kita bisa akses si container coredata nya
        let manageContext = appDelegate.persistentContainer.viewContext
        
        // 3. Prepare fetch dari entity coredata nya
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "ToDoListItem")
        
        fetchRequest.sortDescriptors = [NSSortDescriptor.init(key: "name", ascending: true)]
        
        do {
            let result = try manageContext.fetch(fetchRequest)
            for data in result as! [NSManagedObject] {
                models.append(ItemModel(itemName: data.value(forKey: "name") as! String, itemStatus: data.value(forKey: "completed") as! Bool))
            }
        } catch let error as NSError {
            print("Error due to : \(error.localizedDescription)")
        }
    }
    
    func updateCoreData(item: ItemModel) {
        // kita perlu buat container dari coredata nya, container core data itu ada di appdelegate file
        // 1. Kita perlu akses app delegate? karena semua codingan coredata container ada didalam appdelegate
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        
        // 2. Setelah ada akses ke app delegate, maka kita bisa akses si container coredata nya
        let manageContext = appDelegate.persistentContainer.viewContext
        
        // 3. Prepare fetch dari entity coredata nya
        let fetchRequest: NSFetchRequest<NSFetchRequestResult> = NSFetchRequest.init(entityName: "ToDoListItem")
        fetchRequest.predicate = NSPredicate(format: "name = %@", item.itemName)
        
        do {
            let object = try manageContext.fetch(fetchRequest)
            
            let objectToUpdate = object[0] as! NSManagedObject
            objectToUpdate.setValue(models[selectedCell].itemName, forKey: "name")
            objectToUpdate.setValue(models[selectedCell].itemStatus, forKey: "completed")
            
            do {
                try manageContext.save()
            } catch {
                print(error)
            }
        } catch let error as NSError {
            print(error)
        }
    }
    
    func deleteData(productName: ItemModel) {
        // kita perlu buat container dari coredata nya, container core data itu ada di appdelegate file
        // 1. Kita perlu akses app delegate? karena semua codingan coredata container ada didalam appdelegate
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        
        // 2. Setelah ada akses ke app delegate, maka kita bisa akses si container coredata nya
        let manageContext = appDelegate.persistentContainer.viewContext
        
        // 3. Prepare fetch dari entity coredata nya
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "ToDoListItem")
        fetchRequest.predicate = NSPredicate(format: "name = %@", productName.itemName)
        
        do {
            let objectFrom = try manageContext.fetch(fetchRequest)
            
            let objectToDelete = objectFrom[0] as! NSManagedObject
            manageContext.delete(objectToDelete)
            
            do {
                try manageContext.save()
            } catch {
                print(error)
            }
            
        } catch let error as NSError {
            print("Error due to : \(error.localizedDescription)")
        }
        
        retrieveData()
        tableView?.reloadData()
    }
    
}
