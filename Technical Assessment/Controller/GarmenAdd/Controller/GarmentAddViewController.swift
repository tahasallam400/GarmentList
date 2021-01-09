//
//  GarmentAddController.swift
//  Technical Assessment
//
//  Created by TAHA SALLAM on 12/20/20.
//

import UIKit

class GarmentAddViewController: UIViewController {

    @IBOutlet weak var txtGarment: UITextField!
    @IBOutlet weak var lblGarment: UILabel!
    var updateGarmentListDelegate:UpdateGarmentListDelegate!
    var garmentAddViewModel:GarmentAddViewModel = GarmentAddViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .save, target: self, action: #selector(saveData))
        lblGarment.text = String.Localization.GarmentName
        title = String.Localization.Add
    }
    
    @objc func saveData(){
        if let name =  txtGarment.text,!name.isEmpty{
            
            garmentAddViewModel.addGament(name:name, Date: Date())
            updateGarmentListDelegate.update()
        }
        self.navigationController?.popViewController(animated: true)
    }

}


