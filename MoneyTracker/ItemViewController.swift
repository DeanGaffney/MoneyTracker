//
//  ItemViewController.swift
//  MoneyTracker
//
//  Created by Dean Gaffney on 26/11/2016.
//  Copyright © 2016 Dean Gaffney. All rights reserved.
//

import UIKit

class ItemViewController: UIViewController ,UITextFieldDelegate{

    @IBOutlet weak var canelButton: UIBarButtonItem!
    @IBOutlet weak var saveButton: UIBarButtonItem!
    
    var item: Item?
    
    override func viewDidLoad() {
        super.viewDidLoad()

       //set up text field delegates
        
        //enable save button only if field is not empty
        checkValidItemName()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        saveButton.isEnabled = false
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        checkValidItemName()
        navigationItem.title = textField.text
    }
    
    func checkValidItemName(){
        // let text = nameTextField.text ?? ""
        //saveButton.isEnabled = !text.isEmpty
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (sender as! UIBarButtonItem === saveButton){
            // initalise properties of the object
            //item = Item(args got from fields by user)
        }
    }
    
    @IBAction func cancel(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
       

}
