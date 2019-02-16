//
//  ViewController.swift
//  AutoTextViewSizing
//
//  Created by user140592 on 2/16/19.
//  Copyright © 2019 talspektor. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let textView = UITextView()
        textView.frame = CGRect(x: 0, y: 0, width: 200, height: 100)
        textView.backgroundColor = .lightGray
        
        view.addSubview(textView)

        //use auto layout to set my textView
        textView.translatesAutoresizingMaskIntoConstraints = false
        [
            textView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            textView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            textView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            textView.heightAnchor.constraint(equalToConstant: 50)
        ].forEach({$0.isActive = true})
        
        textView.font = UIFont.preferredFont(forTextStyle: .headline)
        
        textView.delegate = self
        textView.isScrollEnabled = false
        
        textViewDidChange(textView)
    }


}

extension ViewController: UITextViewDelegate {
    
    func textViewDidChange(_ textView: UITextView) {
        print(textView.text)
        let size = CGSize(width: view.frame.width, height: .infinity)
        let estimatedSize = textView.sizeThatFits(size)
        
        textView.constraints.forEach {(constraint) in
            if constraint.firstAttribute == .height {
                constraint.constant = estimatedSize.height
            }
        }
    }
}

