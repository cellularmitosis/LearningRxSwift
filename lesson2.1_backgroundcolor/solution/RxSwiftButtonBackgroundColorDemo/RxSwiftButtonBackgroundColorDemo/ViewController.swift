//
//  ViewController.swift
//  RxSwiftButtonBackgroundColorDemo
//
//  Created by Pepas Personal on 11/22/15.
//  Copyright © 2015 Pepas Labs. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class ViewController: UIViewController {
    
    @IBOutlet weak var button: UIButton!
    let disposeBag = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //        button.rx_tap.subscribeNext { [weak self] () -> Void in
        //            self?.view.backgroundColor = UIColor.greenColor()
        //        }
        button.rx.controlEvent(.touchDown).subscribe { _ in
            self.view.backgroundColor = self.generateRandomColor()
            
        }.addDisposableTo(disposeBag)
        
    }
    
    func generateRandomColor() -> UIColor {
        let hue : CGFloat = CGFloat(arc4random() % 256) / 256 // use 256 to get full range from 0.0 to 1.0
        let saturation : CGFloat = CGFloat(arc4random() % 128) / 256 + 0.5 // from 0.5 to 1.0 to stay away from white
        let brightness : CGFloat = CGFloat(arc4random() % 128) / 256 + 0.5 // from 0.5 to 1.0 to stay away from black
        
        return UIColor(hue: hue, saturation: saturation, brightness: brightness, alpha: 1)
    }
}
