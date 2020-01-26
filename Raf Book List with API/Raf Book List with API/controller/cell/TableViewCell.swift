import UIKit

class TableViewCell: UITableViewCell, UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return bookName.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
               let cell:CollectionViewCell = self.CustomCollection.dequeueReusableCell(withReuseIdentifier: "CollectionCell", for: indexPath) as! CollectionViewCell
        cell.BoolNameLabel.text = bookName[indexPath.row]
               return cell
    }
    
//    func collectionView(_ collectionView: UICollectionView, widthForRowAt indexPath: IndexPath) -> CGFloat {
//        return (collectionView.frame.width / 2.0)
//        }
//
    
    func collectionCell(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 146, height: 186)
    }
    
    
    @IBOutlet weak var CustomCollection: UICollectionView!
    var counter: Int?
    var bookName = [String]()
    
    
    
    override func awakeFromNib() {
        
          CustomCollection.delegate = self
          CustomCollection.dataSource = self
          
        super.awakeFromNib()
        // Initialization code
        
        counter = 0
        bookName.removeAll()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
    public func setTableViewCellData(with json:BookCategory){
    counter = json.book?.count ?? 0
    for i in 0..<json.book!.count {
        bookName.append(json.book![i].bookName!)   
    }
    
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//
//        return bookName.count
//    }
//
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//
//        let cell:CollectionViewCell = self.CustomCollection.dequeueReusableCell(withReuseIdentifier: "CollectionCell", for: indexPath) as! CollectionViewCell
//        return cell
//    }
        


}


//extension TableViewCell: UICollectionViewDataSource, UICollectionViewDelegate {
//
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//
//        return 4
//
//    }
//
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//
//        UICollectionViewCell()
//    }
    

}
