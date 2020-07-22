//
//  OpenHistoryVC.swift
//  Elite Royal Pass Instant UC
//
//  Created by pratik gupta on 20/07/20.
//  Copyright © 2020 Saif Mukadam. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

//SystemRed HexColor = ff3b30ff

class OpenHistoryVC: UITableViewController {
    
    var arrData = [HistoryModel]()
    fileprivate let cellId = "cellId"
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.isNavigationBarHidden = false
        self.navigationItem.hidesBackButton = false
        view.backgroundColor = .white
        navigationItem.title = "My History"
        let textAttributes = [NSAttributedString.Key.foregroundColor:UIColor.systemRed]
        navigationController?.navigationBar.titleTextAttributes = textAttributes
        navigationController?.navigationBar.prefersLargeTitles = false
        UINavigationBar.appearance().isTranslucent = false
        navigationController?.navigationBar.barTintColor = .white
     //   navigationController?.navigationBar.shadowImage = UIImage()
        tableView.separatorStyle = .singleLine
        tableView.separatorColor = UIColor(white: 0.90, alpha: 1)

        
        tableView.register(HistoryCell.self, forCellReuseIdentifier: cellId)
        tableView.tableFooterView = UIView()
        fetchData()
        
    }
    
    func fetchData() {
        
        let urlString = "https://safeapps.online/RoyalPass/GetHistory.php"
        
        let header : HTTPHeaders = ["Content-Type":"application/json"]
        
        guard let profileUrl = URL(string: urlString) else { return }
        
        let parameters: Parameters = [
            "id": "110076888336522318440"
        ]
        
        AF.request(profileUrl,method:.post, parameters: parameters, encoding: JSONEncoding.default ,headers:header).responseJSON { response in
            
            let responseData = response.result
            
            switch responseData {
                
            case .success(let value):
                let json = JSON(value)
                for arr in json.arrayValue {
                    
                    self.arrData.append(HistoryModel(json : arr))
                }
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
                
            case .failure(let afError):
                print(afError.errorDescription!)
            }
        }
        
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if arrData.count == 0 {
            tableView.setEmptyMessage("No History")
            return 0
        } else {
            
            tableView.restore()
            
            return arrData.count
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! HistoryCell
        cell.coverImageView.image = UIImage(named: "check-mark")
        cell.titleLabel.text = "You have Earned \(arrData[indexPath.row].Coin) UC"
        cell.dateLbel.text = arrData[indexPath.row].date
        cell.selectionStyle = .none
        
        if indexPath.row <= arrData[0].Pending - 1 {
            cell.pendingLabel.text = "Pending"
        } else {
            cell.pendingLabel.textColor = .lightGray
            cell.pendingLabel.text = "Redeemed"
        }

        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 55
    }
    
    
    
}

extension UITableView {

    func setEmptyMessage(_ message: String) {
        let messageLabel = UILabel(frame: CGRect(x: 0, y: 0, width: self.bounds.size.width, height: self.bounds.size.height))
        messageLabel.text = message
        messageLabel.textColor = .systemRed
        messageLabel.numberOfLines = 0
        messageLabel.textAlignment = .center
        messageLabel.font = UIFont(name: "Montserrat-Bold", size: 18)
        messageLabel.sizeToFit()

        self.backgroundView = messageLabel
        self.separatorStyle = .none
    }

    func restore() {
        self.backgroundView = nil
        self.separatorStyle = .singleLine
    }
}

