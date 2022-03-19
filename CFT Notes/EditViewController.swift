//
//  EditViewController.swift
//  CFT Notes
//
//  Created by Dunya on 3/18/22.
//

import UIKit

class EditViewController: UIViewController {

    @IBOutlet weak var titleTextView: UITextField!
    @IBOutlet weak var mainTextView: UITextView!
    @IBOutlet weak var datetimeLabel: UILabel!
    
    var noteIndex: Int = 0
    
    var edit: Bool = false
    
    @IBAction func SaveButtonAction(_ sender: Any) {
        let note: [String:String]
        if edit {
            note = editNote(index: noteIndex, title: titleTextView.text!, text: mainTextView.text)
        } else {
            note = addNote(title: titleTextView.text!, text: mainTextView.text)
        }
        datetimeLabel.text = note["datetime"]
        
        dismiss(animated: true)
    }
    
    @IBAction func CancelButtonAction(_ sender: Any) {
        dismiss(animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if !edit {
            setViewProperties(title: "New note", text: "Enter your note here :-)", datetime: "")
        } else {
            setViewProperties(title: notes[noteIndex]["title"]!, text: notes[noteIndex]["text"]!, datetime: notes[noteIndex]["datetime"]!)
        }
    }
    
    func setViewProperties(title: String, text: String, datetime: String){
        titleTextView.text = title
        mainTextView.text = text
        datetimeLabel.text = datetime
    }
}
