//
//  ViewController.swift
//  AnimationSandbox
//
//  Created by Rodrigo Cavalcanti on 31/05/24.
//

import UIKit

class ViewController: UIViewController {
    var imageView: UIImageView!
    var currentAnimation = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageView = UIImageView(image: UIImage(named: "fly"))
        imageView.center = view.center
        view.addSubview(imageView)
    }

    @IBAction func tapped(_ sender: UIButton) {
        
        sender.isHidden = true
        
        UIView.animate(withDuration: 1, delay: 0, options: []) {
            switch self.currentAnimation {
            case 0:
                break
            default:
                break
            }
        } completion: { finished in
            sender.isHidden = false
        }
        
        currentAnimation += 1
        
        if currentAnimation > 7 {
            currentAnimation = 0
        }
    }
    
}

