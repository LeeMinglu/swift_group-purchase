//
//  ViewController.swift
//  swift_group-purchase
//
//  Created by 李明禄 on 16/8/29.
//  Copyright © 2016年 SocererGroup. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    let pathString = "tgs.plist"
    var GoodsModelArray: [LSGoods] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        initData()
    }
    
    func initData() {
        let path = NSBundle.mainBundle().pathForResource(pathString, ofType: nil)
        let GoodsArray = NSArray(contentsOfFile: path!)!
        
        var tempArray: [LSGoods] = []
        
        for goods in GoodsArray {
            let good = LSGoods.parse(dict: goods as! NSDictionary)
            tempArray.append(good)
        }
        
        self.GoodsModelArray = tempArray
        
        print(self.GoodsModelArray)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

