import UIKit

class NeverFoodViewController: UIViewController,UITableViewDataSource,UITableViewDelegate{
    
    @IBOutlet weak var NeverTableView: UITableView!
    
    let neverFood = ["Blocos Minerais", "Carne", "Favas", "Frutas Cristalizadas", "Leite e derivados", "Mandioca", "Petiscos de Petshop", "Polivitamínicos", "Grãos", "Cebolinha", "Uva"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (neverFood.count)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "NeverFoodCellID", for: indexPath) as! NeverFoodCell
        cell.NeverFoodLabel.text = neverFood[indexPath.row]
        return cell
    }
    
}
