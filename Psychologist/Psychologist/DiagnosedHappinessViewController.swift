//
//  DiagnosedHappinessViewController.swift
//  Psychologist
//
//  Created by LeeWong on 16/2/17.
//  Copyright © 2016年 LeeWong. All rights reserved.
//

import UIKit

class DiagnosedHappinessViewController : HappinessViewController ,UIPopoverPresentationControllerDelegate{
    
    override var happiness : Int {
        didSet {
            diagnostaticHistory += [happiness]
            
        }
    }
    
    //偏好存储
    let storageDefault = NSUserDefaults.standardUserDefaults()
    
    var diagnostaticHistory : [Int] {
        get { return storageDefault.valueForKey(History.DefaultKey) as? [Int] ?? []}
        set { storageDefault.setObject(newValue, forKey: History.DefaultKey)}
    }
    
    
    //一个结构体 history 用于存放一些常量
    private struct History {
        static let SegueIdentifier = "Show Diagnostic History"
        static let DefaultKey = "DiagnosedHappinessViewController.History"
    }
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if let identifier = segue.identifier {
            switch identifier {
                case History.SegueIdentifier :
                    if let tvc = segue.destinationViewController as? TextViewController {
                        if let ppc = tvc .popoverPresentationController {
                            ppc.delegate = self
                        }
                        tvc.text = "\(diagnostaticHistory)"
                    }
                default : break
            }
        }
    }
    
    //不进行适配这个方法可以组织popover在iPhone上使用时直接modal出一个全屏的控制器 
    func adaptivePresentationStyleForPresentationController(controller: UIPresentationController) -> UIModalPresentationStyle {
        return UIModalPresentationStyle.None //不要进行适配
    }
    
}