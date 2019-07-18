import UIKit

class AllDayFoodViewController: UIViewController, UITableViewDataSource, UITableViewDelegate{
    
    @IBOutlet weak var AllDayTableView: UITableView!
    
    let allDayFood = ["Escarola", "Catalonia", "Chicória", "Almeirão", "Tomate", "Abóbora", "Berinjela", "Chuchu", "Pepino", "Alface Romana" ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (allDayFood.count)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "AllDayCellID", for: indexPath) as! AllDayFoodCell
        cell.AllDayFoodUILabel.text = allDayFood[indexPath.row]
        return cell
    }
    
}
