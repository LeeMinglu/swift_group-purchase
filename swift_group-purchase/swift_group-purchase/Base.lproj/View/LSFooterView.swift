//
//  LSFooterView.swift
//  swift_group-purchase
//
//  Created by 李明禄 on 16/9/2.
//  Copyright © 2016年 SocererGroup. All rights reserved.
//

import UIKit

class LSFooterView: UIView {
    
    @IBOutlet weak var LoadMoreBtn: UIButton!
    
    @IBOutlet weak var WaitView: UIView!
    
    class func initView() -> UIView {
        let footerView = NSBundle.mainBundle().loadNibNamed("LSFooterView", owner: nil, options: nil).last as! UIView
        return footerView
    
    }

    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */

}
