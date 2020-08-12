//
//  Tool.swift
//  KeyboardKit
//
//  Created by Tblr-Macmini on 10/08/20.
//

import UIKit
class Tool: UIView {
   
    @IBOutlet var view:UIView!
    @IBOutlet weak var textLbl: UILabel!
    @IBOutlet weak var rightButton: UIButton!
    @IBOutlet weak var leftButton: UIButton!
    var currentArrayIndex = 0
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.frame = UIScreen.main.bounds
        Bundle.main.loadNibNamed("Tool", owner: self, options: nil)
        self.view.frame = UIScreen.main.bounds
        self.addSubview(self.view)
        if dataArray.count != 0{
            leftButton.isHidden = false
            rightButton.isHidden = false
            textLbl.isHidden = false
            textLbl.text = dataArray[0]
        }else{
            leftButton.isHidden = true
            rightButton.isHidden = true
            textLbl.isHidden = true
        }
        textDocumentProxy = textDocumentProxyObj
        setupTapAction()
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    private weak var textDocumentProxy: UITextDocumentProxy?
    @IBAction func rightOnClick(_ sender: Any) {
        if currentArrayIndex != dataArray.count - 1{
            currentArrayIndex = currentArrayIndex + 1
            textLbl?.text = dataArray[currentArrayIndex]
        }
    }
    @IBAction func leftOnClick(_ sender: Any) {
        if currentArrayIndex != 0{
            currentArrayIndex = currentArrayIndex - 1
            textLbl?.text = dataArray[currentArrayIndex]
        }
    }
    func setupTapAction() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(handleTap))
        addGestureRecognizer(tap)
    }
}
@objc private extension Tool {
    
    func handleTap() {
        let wordsArry = ["wiped out","worn out","burnt out","done in"]
        if let word:String = self.textDocumentProxy?.documentContextBeforeInput
        {
            var lastWords = word.components(separatedBy: " ")
            var lastTwoWordsString = String()
            if lastWords.count > 2{
                lastTwoWordsString = lastWords.suffix(2).joined(separator: " ")
            }
            var count = Int()
            if wordsArry.contains(lastTwoWordsString){
                count = (word.components(separatedBy: " ").last?.count ?? 0)+1
                lastWords = lastWords.dropLast()
            }
            count = count+(lastWords.last?.count ?? 0)
            for _: Int in 0 ..<  count {
                self.textDocumentProxy?.deleteBackward()
            }
        }
        textDocumentProxy?.replaceCurrentWord(with: textLbl.text ?? "" + " ")
    }
}
