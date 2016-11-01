//
//  ViewController.swift
//  swift_group-purchase
//
//  Created by 李明禄 on 16/8/29.
//  Copyright © 2016年 SocererGroup. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, FooterViewDelegate {
    
    var tableView: UITableView!
    let ScreenRect = UIScreen.mainScreen().bounds
    
    let pathString = "tgs.plist"
    var GoodsModelArray: [LSGoods] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        //初始化数据
        loadData()
        
        //添加tableView
        addTableView()
        
        //设置footerView
        addFooterView()
    }
    
    
    
    // MARK:   加载数据
    func loadData() {
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
    
    // MARK: 添加tableView
    func addTableView() {
        let tableViewX = 0 as CGFloat
        let tableViewY = 0 as CGFloat
        let tableViewWidth = self.ScreenRect.width
        let tableViewHeight = self.ScreenRect.height
        let frame = CGRectMake(tableViewX, tableViewY, tableViewWidth, tableViewHeight)
        let tempTableView = UITableView.init(frame: frame, style: UITableViewStyle.Plain)
        
        self.tableView = tempTableView
        self.view.addSubview(self.tableView)
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
        self.tableView.contentInset = UIEdgeInsetsMake(60, 0, 0, 0)
    
    }
    
    
    //MARK: 设置footerView
    func addFooterView() {
        let footerView: LSFooterView = LSFooterView.initView()
        footerView.delegate = self
        self.tableView.tableFooterView = footerView
        
    }
    
    func didClickFooterView(footerView: LSFooterView) {
        print("点击了footerView")
        let model: LSGoods! = LSGoods()
        model.title = "加了一条"
        model.icon = "37e4761e6ecf56a2d78685df7157f097.png"
        model.price = "20"
        model.buyCount = "50"
       
        self.GoodsModelArray.append(model)
        
//        let path = NSBundle.mainBundle().pathForResource(pathString, ofType: nil)
//        let GoodsArray = NSArray(contentsOfFile: path!)!
//        
//       
//        
//        for goods in GoodsArray {
//            let good = LSGoods.parse(dict: goods as! NSDictionary)
//            self.GoodsModelArray.append(good)
//            
//        }
//        
        
        
        
        let indexPath = NSIndexPath.init(forRow: self.GoodsModelArray.count - 1, inSection: 0)
        
        self.tableView.insertRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.Automatic)
        
        self.tableView.scrollToRowAtIndexPath(indexPath, atScrollPosition: UITableViewScrollPosition.Bottom, animated: true)
        
    }
    
    
    // MARK:  DataSource Method
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.GoodsModelArray.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
//        let ID = "good"
//        var cell = tableView.dequeueReusableCellWithIdentifier(ID)
//        
//        if cell == nil {
//           cell = UITableViewCell.init(style: UITableViewCellStyle.Subtitle, reuseIdentifier: ID)
//        }
//        
        let good = self.GoodsModelArray[indexPath.row]
//        cell?.textLabel?.text = good.title
//        cell?.imageView?.image = UIImage(named: good.icon)
//        cell?.detailTextLabel?.text = good.price
//        
//        return cell!
        let cell = LSTableViewCell.goodsCellWithTableView(tableView)
        
        cell.goodsProperty = good
        
        return cell
        
        
    }
    
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 80
    }
    
    
//    func tableView(tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
//        <#code#>
//    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

