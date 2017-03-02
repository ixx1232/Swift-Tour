//
//  ViewController.swift
//  swiftTour
//
//  Created by ixxcome on 3/2/17.
//  Copyright © 2017 www.ixxcome.com. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let btn = UIButton(frame: CGRect(x: 100, y: 100, width: 100, height: 100))
        btn.backgroundColor = UIColor.red
        view.addSubview(btn)
    }


}

