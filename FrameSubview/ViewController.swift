//
//  ViewController.swift
//  FrameSubview
//
//  Created by Вячеслав Квашнин on 25.07.2022.
//

import UIKit

class ViewController: UIViewController {
    
    var mainView: MainView { return self.view as! MainView }
    var liked = false
    
    override func loadView() {
        view = MainView(frame: UIScreen.main.bounds)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mainView.likeAction = {
            self.likeAction()
        }
    }
    
    fileprivate func likeAction() {
        self.liked = !self.liked
        if !self.liked {
            UIView.animate(withDuration: 2) {
                self.mainView.contentView.backgroundColor = UIColor.red
                self.mainView.likeButton.setTitle("Dislike", for: .normal)
            }
        } else {
            UIView.animate(withDuration: 2) {
                self.mainView.contentView.backgroundColor = .clear
                self.mainView.likeButton.setTitle("Like", for: .normal)
            }
        }
    }
}

