//
//  ViewController.swift
//  FrameSubview
//
//  Created by Вячеслав Квашнин on 25.07.2022.
//

import UIKit

class ViewController: UIViewController {
    
    var mainView: MainView { return self.view as! MainView }
    
    override func loadView() {
        view = MainView(frame: UIScreen.main.bounds)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mainView.likeAction = {
            self.mainView.contentView.backgroundColor = UIColor.red
        }
    }
}

