//
//  articlesVC.swift
//  Elite Royal Pass Instant UC
//
//  Created by Junaid Mukadam on 04/07/20.
//  Copyright © 2020 Saif Mukadam. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
import GoogleMobileAds
import Kingfisher

class ArticlesVC: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    @IBOutlet weak var Banner: GADBannerView!
    
    @IBOutlet weak var myView: UITableView!
    
    //////////////////////// ALL ADs /////////////////
    
    
    
    
    //////////////////////// Facebook /////////////////
    
    
    func loadRewardedVideoAd() {
        
    }
    
    
    
    
    //////////////////////// Facebook End/////////////////
    
    let alert = UIAlertController(title: nil, message: "Loading Ad ...", preferredStyle: .alert)
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "article", for: indexPath) as! article
        cell.articlelabel.text = "Watch Ad Server " + String(indexPath.row+1)
        cell.watchAD.tag = indexPath.row
        cell.watchAD.addTarget(self, action: #selector(tapped(sender:)), for: .touchUpInside)
        
        if indexPath.row == 3 {
            cell.watchAD.isHidden = true
            cell.articlelabel.text = "If you can't watch Ad even after trying all the Servers it's time to take a BREAK."
            cell.articlelabel.textAlignment = .center
        }
        
        return cell
    }
    
    @objc func tapped(sender:UIButton){
        let loadingIndicator = UIActivityIndicatorView(frame: CGRect(x: 10, y: 5, width: 50, height: 50))
        loadingIndicator.hidesWhenStopped = true
        loadingIndicator.style = UIActivityIndicatorView.Style.medium
        loadingIndicator.startAnimating();
        
        alert.view.addSubview(loadingIndicator)
        present(alert, animated: true, completion: nil)
        
        let tag = sender.tag
        
        if tag == 0 {
            loadRewardedVideoAd() //facebook
        }else if tag == 1 {
        }else if tag == 2 {
            requestInterstitialAdColony() //AdColony
        }
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        100
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.title = "Earn Token"
        navigationController?.navigationBar.tintColor = UIColor.systemOrange
        navigationController?.isNavigationBarHidden = false
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        myView.delegate = self
        myView.dataSource = self
        myView.reloadData()
        Banner.adSize = GADCurrentOrientationAnchoredAdaptiveBannerAdSizeWithWidth(self.view.frame.size.width)
        Banner.adUnitID = "ca-app-pub-2710347124980493/2253995881"
        Banner.rootViewController = self
        Banner.load(GADRequest())
    }
}

//////////////////////// AdLovin /////////////////

    
    
    

//////////////////////// AdLovin End /////////////////


//////////////////////// AdColony  /////////////////


    
    func requestInterstitialAdColony() {
    }
    
//////////////////////// AdColony  End/////////////////
