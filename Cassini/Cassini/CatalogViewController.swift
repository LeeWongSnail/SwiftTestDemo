//
//  CatalogViewController.swift
//  Cassini
//
//  Created by LeeWong on 16/2/18.
//  Copyright © 2016年 LeeWong. All rights reserved.
//

import UIKit

class CatalogViewController: UIViewController {

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if let tvc = segue.destinationViewController as? ImageViewController {
            if let identifier = segue.identifier {
                switch identifier {
                    case "Earth" :
                        tvc.imageURL = DemoURL.NASA.Earth
                        tvc.title = "Eartch"
                    case "Saturn" :
                        tvc.imageURL = DemoURL.NASA.Saturn
                        tvc.title = "Saturn"
                    case "Cassini" :
                        tvc.imageURL = DemoURL.NASA.Cassini
                        tvc.title = "Cassini"
                default:break
                }
            }
        }
    }

}
