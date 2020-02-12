import UIKit
// An exercise file for iOS Development Tips Weekly
// A weekly course on LinkedIn Learning for iOS developers
//  Season 10 (Q02 2020) video 05
//  by Steven Lipton (C)2020, All rights reserved
// Learn more at https://linkedin-learning.pxf.io/YxZgj
// This Week:  Learn how to handle SF Symbols  with autolayout in code.
//  For more code, go to http://bit.ly/AppPieGithub


/// Some constants
let text = "Settings"
let largeText = "Settings and a bunch of other really cool stuff. There is even a pizza ordering button in here!"
let symbol = "dial.fill"


class ViewController:UIViewController{
    // Basic Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ///set the textstyles for the font and image
        let textStyle:UIFont.TextStyle = .title1
        
        //configure label
        let label = UILabel()
        label.text = largeText
        label.numberOfLines = 0
        label.font = UIFont.preferredFont(forTextStyle: textStyle)
        
        //configure imageView
        let imageView = UIImageView(image: UIImage(systemName: symbol))
        imageView.tintColor = .black
        
        
        //Configuration code goes here.
        imageView.preferredSymbolConfiguration = UIImage.SymbolConfiguration(textStyle: textStyle, scale: .large)
        ///## Priorities
        imageView.setContentCompressionResistancePriority(.required, for: .horizontal)
        imageView.setContentHuggingPriority(.required, for: .horizontal)
        
        
        //Add the views
        view.addSubview(label)
        view.addSubview(imageView)
        
        //Autolayout
        imageView.translatesAutoresizingMaskIntoConstraints = false
        label.translatesAutoresizingMaskIntoConstraints = false
        
        var constraints:[NSLayoutConstraint] = []
        
        // centered V:|-imageview
        constraints += [NSLayoutConstraint(item: imageView, attribute: .centerY, relatedBy: .equal, toItem: view, attribute: .centerY, multiplier: 1.0, constant: 0)]
        // first baseline alignment V:imageview-label
        constraints += [NSLayoutConstraint(item: label, attribute: .firstBaseline, relatedBy: .equal, toItem: imageView, attribute: .firstBaseline, multiplier: 1.0, constant: 0)]
        
        
        // H:|-imageView
        constraints += [NSLayoutConstraint(item: imageView, attribute: .leading, relatedBy: .equal, toItem: view, attribute: .leadingMargin, multiplier: 1.0, constant: 0 )]
        // H:imageview-5-label
        constraints += [NSLayoutConstraint(item: label, attribute: .leading, relatedBy: .equal, toItem: imageView, attribute: .trailing, multiplier: 1.0, constant: 5)]
        //H:label-|
        constraints += [NSLayoutConstraint(item: label, attribute: .trailing, relatedBy: .equal, toItem: view, attribute: .trailingMargin, multiplier: 1.0, constant: 0)]
        
        view.addConstraints(constraints)
    }
    override func loadView() {
        
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 375, height: 667))
        view.backgroundColor = .systemBackground
        self.view = view
    }
}
