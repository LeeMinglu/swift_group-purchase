//
//  LSTableViewCell.swift
//  swift_group-purchase
//
//  Created by 李明禄 on 16/8/30.
//  Copyright © 2016年 SocererGroup. All rights reserved.
//

import UIKit

class LSTableViewCell: UITableViewCell {
    
    

    @IBOutlet weak var imgView: UIImageView!

    @IBOutlet weak var LTitle: UILabel!
    
    @IBOutlet weak var LPrice: UILabel!
    
    @IBOutlet weak var LBuyCount: UILabel!
    var goods:LSGoods!
    
   var goodsProperty: LSGoods! {
        get {
        
        return self.goods
        }
    
        set(goods) {
        
            self.imgView.image = UIImage(named: goods.icon)
            self.LTitle.text = goods!.title
            self.LPrice.text = "价格：" + goods!.price
            self.LBuyCount.text = goods!.buyCount + "人已购买"
        }
    }
    
    class func goodsCellWithTableView(tableView: UITableView) -> LSTableViewCell {
        
        let ID = "Goods"
        var cell = tableView.dequeueReusableCellWithIdentifier(ID)
        
        if cell == nil {
            cell = NSBundle.mainBundle().loadNibNamed("LSTableViewCell", owner: nil, options: nil)!.last as! LSTableViewCell
        }
        
        return cell as! LSTableViewCell
    
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
