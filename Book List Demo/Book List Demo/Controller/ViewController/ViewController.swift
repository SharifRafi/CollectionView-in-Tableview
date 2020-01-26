//
//  ViewController.swift
//  Book List Demo
//
//  Created by Admin on 1/21/20.
//  Copyright © 2020 Admin. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class ViewController: UIViewController{
  
    var bookCategory = [BookCategory]()

    @IBOutlet weak var tableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        
        // Do any additional setup after loading the view.
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
                //print(bookcategoryItems.count)
                for bookcategory in bookcategoryItems{
                    //print(bookcategory.1)
                    //print("rafi")
                    let model = BookCategory(bookcategory.1)
                    //print(model)
                    self.bookCategory.append(model)
                    
                }
                //print(self.bookCategory.count)
                self.tableView.reloadData()
                
            }
            
            
            
            
        }.resume()
        
    }
  
    


}
extension ViewController:UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //print("inside:",self.bookCategory.count)
        return self.bookCategory.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell:TableViewCell = self.tableView.dequeueReusableCell(withIdentifier: "tableCell", for: indexPath) as! TableViewCell
        
        cell.setTableViewCellData(with: bookCategory[indexPath.row])
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return view.frame.height/4.0
    }
}

