//
//  ViewController.swift
//  CollectionViewDemo2
//
//  Created by 梁雅軒 on 2017/2/13.
//  Copyright © 2017年 zoaks. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource {
    var arrData = [DataDetailInfo]()
    @IBOutlet weak var collectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()

        collectionView.register(UINib(nibName: "MyCell", bundle: nil), forCellWithReuseIdentifier: "MyCell")
        for i in 1...4{
            let info = DataDetailInfo()
            info.message = "\(i)"
            arrData.append(info)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func btnOnClick(_ sender: UIButton) {
        var message = 0
        if sender.tag == 0 {
            message = 1
        }else if sender.tag == 1 {
            message = 5
        }
        
        for info in arrData{
            info.message = "\(message)"
            message += 1
        }
        collectionView.reloadData()
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MyCell", for: indexPath) as! MyCell
        cell.setInfo(info: arrData[indexPath.row])
        cell.layer.borderColor = UIColor.black.cgColor
        cell.layer.borderWidth = 1
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let info = arrData[indexPath.row]
        info.isSelect = !info.isSelect
        collectionView.reloadItems(at: [indexPath])
    }
}

class DataDetailInfo {
    var message:String!
    var isSelect = false
}
