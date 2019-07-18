import UIKit

class FoodTwoTableViewController: UIViewController,UITableViewDataSource,UITableViewDelegate{
    
    let teste = ["* Morango","* Banana","* Amora","* Manga","* Maçã","Rúcula","Beterraba","Cenoura","Nabo","Agrião","Couve","Espinafre" ]
    
    @IBOutlet weak var TwoTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (teste.count)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FoodTwoID", for: indexPath) as! FoodTwoCell
        cell.FoodTwoName.text = teste[indexPath.row]
        return cell
    }
    
    
}
