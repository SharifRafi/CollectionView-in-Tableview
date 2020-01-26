import UIKit
import Alamofire
import SwiftyJSON

class MainViewController: UIViewController {
    
    @IBOutlet weak var customTableVIew: UITableView!
    var bookCategory = [BookCategory]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        customTableVIew.delegate = self
        customTableVIew.dataSource = self
        
        loadDatafromServer()
    }
     
    let headers: HTTPHeaders = [
        "Accept": "application/json"
    ]
    func loadDatafromServer(){
        AF.request("https://api.myjson.com/bins/xdwpq", headers: headers).response { response in
            
            //debugPrint(response)
            
            DispatchQueue.main.async() {
                
                let bookcategoryItems = JSON(response.value as Any)
                
                for bookcategory in bookcategoryItems{
                    
                    let model = BookCategory(bookcategory.1)
                    
                    self.bookCategory.append(model)
                    
                }
                
                self.customTableVIew.reloadData()
                
            }
        }.resume()
    }
}

extension MainViewController: UITableViewDataSource, UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.bookCategory.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell: TableViewCell = self.customTableVIew.dequeueReusableCell(withIdentifier: "TableCell", for: indexPath) as! TableViewCell
        
       cell.setTableViewCellData(with: bookCategory[indexPath.row])

        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
       return (view.frame.height / 3.0)
        //return 250
    }    
}

