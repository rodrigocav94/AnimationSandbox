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
        
        UIView.animate(withDuration: 1, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 5, options: []) { // By default, UIKit animations have an "ease in, ease out" curve
            switch self.currentAnimation {
            case 0:
                self.imageView.transform = CGAffineTransform(scaleX: 2, y: 2) // make the view twice its normal width and height.
            case 1:
                self.imageView.transform = .identity // Clears our view of any pre-defined transform, resetting any changes that have been applied by modifying its transform property.
            case 2:
                self.imageView.transform = CGAffineTransform(translationX: -256, y: -256) // These values are deltas, or differences from the current value, meaning that it subtracts 256 from both the current X and Y position.
            case 3:
                self.imageView.transform = .identity
            case 4:
                self.animateImageChange(alive: false)
                self.imageView.transform = CGAffineTransform(rotationAngle: CGFloat.pi)
                // values are radians specified as a CGFloat.
                // it will always take the shortest route to make the rotation work.
            case 5:
                self.imageView.transform = .identity
                self.animateImageChange(alive: true)
            case 6:
                self.imageView.alpha = 0.2
            case 7:
                self.imageView.alpha = 1
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
    
    func animateImageChange(alive: Bool) {
        UIView.transition(
            with: self.imageView,
            duration: 0.1,
            options: .curveEaseInOut,
            animations: {
                self.imageView.image = UIImage(named: alive ? "fly": "flyDead")
            },
            completion: nil
        )
    }
}

