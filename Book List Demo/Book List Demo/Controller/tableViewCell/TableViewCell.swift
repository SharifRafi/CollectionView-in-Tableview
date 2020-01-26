//
//  TableViewCell.swift
//  Book List Demo
//
//  Created by Admin on 1/21/20.
//  Copyright © 2020 Admin. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {
    
   // var bookobj = [Book]()
    var bookname = [String]()
    
    @IBOutlet weak var customCollectionView: UICollectionView!
    
    var counter:Int?
    override func awakeFromNib() {
        //print("inside collection Cell")
        
        customCollectionView.dataSource = self
        customCollectionView.delegate = self
        
        super.awakeFromNib()
        // Initialization code
        counter = 0
        bookname.removeAll()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    public func setTableViewCellData(with json:BookCategory){
        //print(json.book?.count ?? 0)
        counter = json.book?.count ?? 0
        for i in 0..<json.book!.count {
            bookname.append(json.book![i].bookName!)
            
        }
    }
}
extension TableViewCell:UICollectionViewDelegate, UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        //print(counter!)
        return counter!
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell:CollectionViewCell = self.customCollectionView.dequeueReusableCell(withReuseIdentifier: "collectionCell", for: indexPath) as! CollectionViewCell
        cell.label.text = bookname[indexPath.row]
        print(bookname[indexPath.row])
        
        return cell
        
        
    }
    
    
}

