//
//  ViewController + UITextFieldDelegate.swift
//  Sunny
//
//  Created by Aleksei Bodrov on 13.09.2022.
//

import UIKit



extension ViewController: UITextFieldDelegate  {
    
    func textField(
        _ textField: UITextField,
        shouldChangeCharactersIn range: NSRange,
        replacementString string: String
    ) -> Bool {
        
        if let text = textField.text {
            if let textRange = Range(range, in: text) {
            updatedText = text.replacingCharacters(in: textRange, with: string)
            print(updatedText)
            }
        }
        return true
    }
}
