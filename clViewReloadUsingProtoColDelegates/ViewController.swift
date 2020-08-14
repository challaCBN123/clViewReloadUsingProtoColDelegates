//
//  ViewController.swift
//  clViewReloadUsingProtoColDelegates
//
//  Created by Bhargava on 13/08/20.
//  Copyright © 2020 Bhargava. All rights reserved.
//

import UIKit

class ViewController: UIViewController ,UICollectionViewDelegate,UICollectionViewDataSource,clReloadDelegate{
   
    
  
    
    @IBOutlet weak var clView: UICollectionView!
    let url = URL(string: "https://jsonplaceholder.typicode.com/photos")
    var dataArray:[[String:Any]] = []
    var datasArray:[[String:Any]] = []
    let dat = gettindData()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    //https://jsonplaceholder.typicode.com/photos
        clView.delegate  = self
        clView.dataSource = self
        dat.getData(url: url!) { (urlData  , err) in
      
            self.datasArray = urlData as! [[String : Any]]
          
                DispatchQueue.main.async {
                                         self.clView.reloadData()
                                     }
             for index in 0..<self.dataArray.count{
                                let dataDict = self.datasArray[index]
                                print(dataDict["title"] as! String)
                            }
        }
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return datasArray.count
      }
      
      func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = clView.dequeueReusableCell(withReuseIdentifier: "ClViewCell", for: indexPath) as! ClViewCell
        let dataDict = datasArray[indexPath.row]
        cell.titleLbl.text = (dataDict["title"]) as? String
        
        DispatchQueue.global().async {
            let imageUrl = URL(string: dataDict["url"] as? String ?? " ")
                           let data = try? Data(contentsOf: imageUrl!)
            DispatchQueue.main.async {
               
                if data != nil{
                    cell.imageViews.image = UIImage(data: data!)
                }
                
            }
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let stboard = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(identifier: "detailVc") as! detailVc
        let dataDict = datasArray[indexPath.row]
      stboard.albumId = "\(dataDict["albumId"] as! Int)"
        stboard.id = "\(dataDict["id"] as! Int)"
        stboard.imageTitle = dataDict["title"] as! String
        let imageUrl = URL(string: dataDict["url"] as? String ?? " ")
        let data = try? Data(contentsOf: imageUrl!)
        if let image = UIImage(data: data!){
            stboard.imageUrl = image
        }
        stboard.Delegate = self
        self.navigationController?.pushViewController(stboard, animated: true)
    }
    func ClviewReload() {
          DispatchQueue.main.async {
              self.clView.reloadData()
            print("reload using delegates")
          }
      }
}

class ClViewCell:UICollectionViewCell{
    
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var imageViews: UIImageView!
}

