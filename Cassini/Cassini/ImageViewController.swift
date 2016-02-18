//
//  ImageViewController.swift
//  Cassini
//
//  Created by LeeWong on 16/2/18.
//  Copyright © 2016年 LeeWong. All rights reserved.
//

import UIKit

class ImageViewController: UIViewController,UIScrollViewDelegate {

    var imageURL : NSURL? {
        didSet {
            image = nil
            if view.window != nil {
                fetchImage()
            }
        }
    }
    
    
    private func fetchImage() {
        
        if let url = imageURL {
            let qos = Int(QOS_CLASS_USER_INITIATED.rawValue)
            activityIndicator?.startAnimating()
            dispatch_async(dispatch_get_global_queue(qos, 0), { () -> Void in
                let imageData = NSData(contentsOfURL: url)
                dispatch_async(dispatch_get_main_queue(), { () -> Void in
                    if imageData != nil {
                        self.image = UIImage(data: imageData!)
                    } else {
                        self.image = nil
                    }
                })
            })
        }
    }
    
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    @IBOutlet weak var scrollView: UIScrollView! {
        didSet {
            scrollView.contentSize = imageView.frame.size
            scrollView.delegate = self
            scrollView.maximumZoomScale = 2
            scrollView.minimumZoomScale = 0.2
        }
    }
    
    func viewForZoomingInScrollView(scrollView: UIScrollView) -> UIView? {
        return imageView
    }
    
    private var imageView = UIImageView()
    
    private var image : UIImage? {
        get { return imageView.image }
        set {
            imageView.image = newValue
            imageView.sizeToFit()
            scrollView?.contentSize = imageView.frame.size
            activityIndicator?.stopAnimating()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        scrollView.addSubview(imageView)
        
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        if image == nil {
            fetchImage()
        }
    }
    
}
