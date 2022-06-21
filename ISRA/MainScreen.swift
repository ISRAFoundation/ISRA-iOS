//
//  ViewController.swift
//  ICQC
//
//  Created by Rayaan Siddiqui on 5/18/21.
//

import UIKit
import Firebase
import FirebaseDatabase
import SafariServices

class MainScreen: UIViewController, UITableViewDataSource, UITableViewDelegate {
    @IBOutlet weak var MenuView: UIView!
    
    @IBOutlet weak var FeedView: UITableView!
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.row == 0 {
       let PrayerTimingsCell = tableView.dequeueReusableCell(withIdentifier: "PrayerTimingCell", for: indexPath) as! PrayerTimingsCell
         
            return PrayerTimingsCell
        
        } else if indexPath.row == 1 {
            let DonateCell = tableView.dequeueReusableCell(withIdentifier: "DonateCell", for: indexPath) as! DonateCell
            return DonateCell
            
        } else if indexPath.row == 2 {
            let LiveStreamCell = tableView.dequeueReusableCell(withIdentifier: "LiveStreamCell", for: indexPath) as! LiveStreamCell
            return LiveStreamCell
            
        } else if indexPath.row == 3 {
            let NazirahCell = tableView.dequeueReusableCell(withIdentifier: "NazirahCell", for: indexPath) as! NazirahCell
            return NazirahCell
            
        } else {
            return tableView.dequeueReusableCell(withIdentifier: "PrayerTimingCell", for: indexPath) as! PrayerTimingsCell
        }
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
 

        return 4
    }
 
    
    @IBAction func DonateBtn(_ sender: Any) {
        if let url = URL(string: "https://icqc.masjidcrm.com/Donate.aspx") {
                let config = SFSafariViewController.Configuration()
                config.entersReaderIfAvailable = true

                let vc = SFSafariViewController(url: url, configuration: config)
                present(vc, animated: true)
            }
    }
    @IBAction func LiveStreamBtn(_ sender: Any) {
        if let url = URL(string: "https://icqc.click2stream.com") {
                let config = SFSafariViewController.Configuration()
                config.entersReaderIfAvailable = true

                let vc = SFSafariViewController(url: url, configuration: config)
                present(vc, animated: true)
            }
    }
    @IBAction func NazirahBtn(_ sender: Any) {
        if let url = URL(string: "https://icqcmasjid.org/nazirah-registration-form") {
                let config = SFSafariViewController.Configuration()
                config.entersReaderIfAvailable = true

                let vc = SFSafariViewController(url: url, configuration: config)
                present(vc, animated: true)
            }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        FeedView.delegate = self
        FeedView.dataSource = self
        MenuView.layer.shadowColor = UIColor.black.cgColor
        MenuView.layer.shadowOpacity = 0.20
        MenuView.layer.shadowOffset = .zero
        let hour = Calendar.current.component(.hour, from: Date())

        switch hour {
        case 5..<9 : FeedView.backgroundView = UIImageView(image: UIImage(named: "morning.jpg"))
        case 20..<22 : FeedView.backgroundView = UIImageView(image: UIImage(named: "night.jpg"))
        default: FeedView.backgroundView = UIImageView(image: UIImage(named: "afternoon.jpg"))
        }
        
       // FeedView.backgroundView?.alpha = 0.55
        let  gradientLayer   = CAGradientLayer()
        gradientLayer.frame  =  self.FeedView.backgroundView!.bounds
          gradientLayer.colors = [UIColor.clear.cgColor,UIColor.black.cgColor]
        self.FeedView.backgroundView!.layer.addSublayer(gradientLayer)
       
    }


}

