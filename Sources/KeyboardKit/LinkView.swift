//
//  LinkView.swift
//  KeyboardKit
//
//  Created by Tblr-Macmini on 18/08/20.
//

import UIKit
public class linkView: UIView {

    @IBOutlet var view: UIView!
    // MARK: - Initialization

    /**
     Create a toolbar that uses a custom button creator. You
     must setup the buttons yourself if you use this option.
     */
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.frame = UIScreen.main.bounds
        Bundle.main.loadNibNamed("linkView", owner: self, options: nil)
        self.view.frame = UIScreen.main.bounds
        self.addSubview(self.view)
        let button = UIButton()
        button.frame.size.height = 50
        button.frame.size.width = self.view.frame.size.width
        button.frame.size.height = self.view.frame.size.height
        button.backgroundColor = .clear
        button.setTitleColor(.blue, for: .normal)
        button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        self.view.addSubview(button)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    @objc func buttonAction(sender: UIButton!) {
        let url = "https://forms.office.com/Pages/ResponsePage.aspx?id=s78kuI6RwkO7HNzBukCoK6-vTLPcZtJNoEGs-lhs9SxUMzM5UlQ3TVVERlowTDdNVDcwVDFJSUhUSi4u"
        if let url = URL(string: url), UIApplication.shared.canOpenURL(url) {
           if #available(iOS 10.0, *) {
              UIApplication.shared.open(url, options: [:], completionHandler: nil)
           } else {
              UIApplication.shared.openURL(url)
           }
        }
    }
}
