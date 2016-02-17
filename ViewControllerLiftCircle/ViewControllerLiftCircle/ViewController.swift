//
//  ViewController.swift
//  ViewControllerLiftCircle
//
//  Created by LeeWong on 16/2/17.
//  Copyright © 2016年 LeeWong. All rights reserved.
//


//只看到了那么多 没看清楚 尝试旋转屏幕试一下
import UIKit

class ViewController: UIViewController {

    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
    }
    
   override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        print("init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?)")
    }

    
    deinit {
        print("deinit")
    }
    
    override func awakeFromNib() {
        print("awakeFromNib() ")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        print("viewDidLoad()")
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        print("viewWillAppear(animated: Bool)")
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidDisappear(animated)
        print("viewDidAppear(animated: Bool)")
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        print("viewWillDisappear(animated: Bool)")
    }
    
    override func viewDidDisappear(animated: Bool) {
        super.viewDidDisappear(animated)
        print("viewDidDisappear(animated: Bool)")
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews();
        print("viewWillLayoutSubviews() ")
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews();
        print("viewDidLayoutSubviews() ")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillTransitionToSize(size: CGSize, withTransitionCoordinator coordinator: UIViewControllerTransitionCoordinator) {
        print("viewWillTransitionToSize")
        super.viewWillTransitionToSize(size, withTransitionCoordinator: coordinator)
    }
    


}

