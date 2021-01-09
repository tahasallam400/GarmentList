//
//  GarmentAdd + UITextFieldDelegate.swift
//  Technical Assessment
//
//  Created by TAHA SALLAM on 12/21/20.
//

import UIKit

extension GarmentAddViewController:UITextFieldDelegate{
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let maxLength = 35
        let currentString: NSString = (textField.text ?? "") as NSString
        let newString: NSString =
            currentString.replacingCharacters(in: range, with: string) as NSString
        return newString.length <= maxLength
    }
}
