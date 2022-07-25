//
//  MainView.swift
//  FrameSubview
//
//  Created by Вячеслав Квашнин on 25.07.2022.
//

import Foundation
import UIKit

class MainView: UIView {
    
    var likeAction: (() -> Void)?
    
    let contentView: UIView = {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        view.layer.borderColor = UIColor.lightGray.cgColor
        view.layer.borderWidth = 2
        view.layer.backgroundColor = UIColor.lightGray.cgColor
        return view
    }()
    
    let likeButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Like", for: .normal)
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        setupUI()
        setupConstraints()
        addAction()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        self.addSubview(contentView)
        self.addSubview(likeButton)
    }
    
    private func addAction() {
        likeButton.addTarget(self, action: #selector(tapLikeButton), for: .touchUpInside)
    }
    
    @objc
    func tapLikeButton() {
        likeAction?()
    }

    private func setupConstraints() {
        setupContentViewConstraints()
        setupLikeButtonConstraints()
    }
    
    fileprivate func setupContentViewConstraints() {
        self.translatesAutoresizingMaskIntoConstraints = false
        contentView.translatesAutoresizingMaskIntoConstraints = false
        contentView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 30).isActive = true
        contentView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16).isActive = true
        contentView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16).isActive = true
        contentView.bottomAnchor.constraint(equalTo: self.centerYAnchor, constant: 0).isActive = true
    }
    
    fileprivate func setupLikeButtonConstraints() {
        likeButton.translatesAutoresizingMaskIntoConstraints = false
        likeButton.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 0).isActive = true
        likeButton.topAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 10).isActive = true
    }
    
}
