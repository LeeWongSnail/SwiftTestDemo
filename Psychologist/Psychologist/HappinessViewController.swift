//
//  HappinessViewController.swift
//  Happiness
//
//  Created by LeeWong on 16/2/17.
//  Copyright © 2016年 LeeWong. All rights reserved.
//

import UIKit

class HappinessViewController: UIViewController , FaceViewDataSource {

    @IBOutlet weak var faceView: FaceView! {
        didSet {
            faceView.dataSource = self
            faceView.addGestureRecognizer(UIPinchGestureRecognizer(target: faceView, action: "scale:"))
//            faceView.addGestureRecognizer(UIPanGestureRecognizer(target: self, action: "changeHappiness"))
        }
    }
    var happiness : Int = 75 { //0 = very sad 100= ecstatic
        didSet {
            happiness = min(max(happiness, 0), 100)
            print("happiness = \(happiness)")
            updateUI()
            
        }
    }
    
    
    private struct Constants {
        static let HappinessGestureScale:CGFloat = 4
    }
    
    @IBAction func changeHappiness(sender: UIPanGestureRecognizer) {
        switch sender.state {
        case .Ended : fallthrough
        case .Changed :
            let translation = sender.translationInView(faceView)
            let happinessChange = -Int(translation.y / Constants.HappinessGestureScale)
            
            if happinessChange != 0 {
                happiness += happinessChange
                sender.setTranslation(CGPointZero, inView: faceView)
            }
        default : break
        }
    }
    
    //注意 在跳转之前设置happiness的值时 由于faceview可能还没有加载出来 所以这里会有可能崩溃
    //所以在faceView加上一个？
    private func updateUI() {
        faceView?.setNeedsDisplay()
        title = "\(happiness)"
    }

    
    //实现协议方法
    func smilinessForFaceView(sender: FaceView) -> Double? {
        return Double(happiness - 50)/50
    }
    
}
