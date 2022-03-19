//
//  Model.swift
//  CFT Notes
//
//  Created by Dunya on 3/18/22.
//

import Foundation
import UIKit

var notes: [[String:String]] {
    set {
        UserDefaults.standard.set(newValue, forKey: "notes")
        UserDefaults.standard.synchronize()
    }
    get {
        if let data = UserDefaults.standard.array(forKey: "notes") as? [[String:String]] {
            return data
        }else{
            return []
        }
    }
}

func addNote(title: String = "New note", text: String = "Enter your note! :-)"){
    notes.append(["title":title, "text":text, "datetime":getNowDateTimeFormattedString()])
}

func removeNote(index: Int){
    notes.remove(at: index)
}

func editNote(index: Int, title: String, text: String) {
    notes[index]["title"] = title
    notes[index]["text"] = text
    notes[index]["datetime"] = getNowDateTimeFormattedString()
}

func getNowDateTimeFormattedString(pattern: String="HH:mm - dd.MM.yyyy") -> String{
    let df = DateFormatter()
    df.dateFormat = pattern
    let now = df.string(from: Date())
    return now
}

func moveItem(fromIndex: Int, to: Int){
    let from = notes[fromIndex]
    removeNote(index: fromIndex)
    notes.insert(from, at: to)
}
