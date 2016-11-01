//
//  LSFooterView.swift
//  swift_group-purchase
//
//  Created by 李明禄 on 16/9/2.
//  Copyright © 2016年 SocererGroup. All rights reserved.
//

import UIKit

//定义一个协议
protocol FooterViewDelegate {
    func didClickFooterView(footerView: LSFooterView)
    
}
class LSFooterView: UIView {
    
    @IBOutlet weak var LoadMoreBtn: UIButton!
    
    @IBOutlet weak var WaitView: UIView!
    
    //定义一个属性
    var delegate: FooterViewDelegate? = nil
   
    
    
    class func initView() -> LSFooterView {
        let footerView = NSBundle.mainBundle().loadNibNamed("LSFooterView", owner: nil, options: nil)!.last
        return footerView as! LSFooterView
    
    }

    @IBAction func clickLoadMoreBtn(sender: AnyObject) {
        
        self.WaitView.hidden = false
        self.LoadMoreBtn.hidden = true
        
//        dispatch_after(dispatch_time( dispatch_time(DISPATCH_TIME_NOW, (Int64)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), { 
//            self.delegate?.didClickFooterView(self)
//        }),
                       dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (Int64)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), {
                       
                            // 调用代理方法向模型中添加数据
                            self.delegate?.didClickFooterView(self)
                        self.WaitView.hidden = true
                        self.LoadMoreBtn.hidden = false
                        });
                       
                       
    }
    

    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */

}
