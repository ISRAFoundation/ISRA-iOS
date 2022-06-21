//
//  PrayerTimingsCell.swift
//  ICQC
//
//  Created by Rayaan Siddiqui on 5/19/21.
//

import UIKit
import Firebase
import FirebaseDatabase
class PrayerTimingsCell: UITableViewCell {
    @IBOutlet weak var ptLbl: UILabel!
    @IBOutlet weak var PTViewWithShadow: UIView!
    @IBOutlet weak var AF: UILabel!
    @IBOutlet weak var AD: UILabel!
    @IBOutlet weak var AA: UILabel!
    @IBOutlet weak var AM: UILabel!
    @IBOutlet weak var AI: UILabel!
    @IBOutlet weak var AJ1: UILabel!
    @IBOutlet weak var AJ2: UILabel!
    @IBOutlet weak var IF: UILabel!
    @IBOutlet weak var ID: UILabel!
    @IBOutlet weak var IA: UILabel!
    @IBOutlet weak var IM: UILabel!
    @IBOutlet weak var II: UILabel!
    @IBOutlet weak var IJ1: UILabel!
    @IBOutlet weak var IJ2: UILabel!
    @IBOutlet weak var SR: UILabel!
    @IBOutlet weak var SS: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        
     
        PTViewWithShadow.layer.shadowColor = UIColor.white.cgColor
        PTViewWithShadow.layer.shadowOpacity = 0.30
        PTViewWithShadow.layer.shadowOffset = .zero
        PTViewWithShadow.layer.shadowRadius = 10
        PTViewWithShadow.layer.cornerRadius = 10
        let date = Date()
        let format = DateFormatter()
        format.dateFormat = "LLLL dd"
        var formattedDate = format.string(from: date)
        ptLbl.text = "Prayer Timings (\(formattedDate))"
        let ref = Database.database().reference()
        format.dateFormat = "M/d/YYYY"
         formattedDate = format.string(from: date)
        let input = formattedDate
        print("HERERERE")
        print(input)

       
/*
        let databaseRef = Database.database().reference().child("Prayer Times")
               let query = databaseRef.queryOrdered(byChild: "Date").queryStarting(atValue: "5/21/2021").queryEnding(atValue: "\("5/21/2021")\\uf8ff")
print("MADE C1")
               query.observeSingleEvent(of: .value) { (snapshot) in
                   guard snapshot.exists() != false else { print("COMPLETE FAIL#"); return }
                  print(snapshot.value)
                print("MADE F1")
                   DispatchQueue.main.async {
                       print("MADE C2")
                   }
               }
   */
        let questionPostsRef = ref.child("Current Event")
        let query = questionPostsRef.queryOrdered(byChild: "trackId").queryEqual(toValue: "12345678")
        query.observeSingleEvent(of: .value, with: { snapshot in
            for child in snapshot.children {
                let childSnap = child as! DataSnapshot
                let dict = childSnap.value as! [String: Any]
                let cat = dict["category"] as! String
                let name = dict["name"] as! String
                print(childSnap.key, cat, name)
            }
        })

        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
