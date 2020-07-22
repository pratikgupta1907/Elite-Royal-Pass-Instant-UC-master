//
//  SettingPageVC.swift
//  Elite Royal Pass Instant UC
//
//  Created by pratik gupta on 21/07/20.
//  Copyright © 2020 Saif Mukadam. All rights reserved.
//


import UIKit

private let reuseIdentifier = "SettingsCell"

class SettingPageVC: UIViewController {
    
    let imageArray = [#imageLiteral(resourceName: "commerce"), #imageLiteral(resourceName: "love-and-romance"), #imageLiteral(resourceName: "commerce"), #imageLiteral(resourceName: "commerce"), #imageLiteral(resourceName: "commerce"), #imageLiteral(resourceName: "commerce"), #imageLiteral(resourceName: "commerce")]
    let nameArray = ["Redeem","Feedback","Bug / Problem","Rate Us","Privacy Policy", "Rate Us","Privacy Policy"]
    
    
    // MARK: - Properties
    
    var tableView: UITableView!
    var userInfoHeader: UserInfoHeader!
    
    // MARK: - Init
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    // MARK: - Helper Functions
    
    func configureTableView() {
        tableView = UITableView()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = 50
        
        tableView.register(SettingsCell.self, forCellReuseIdentifier: reuseIdentifier)
        view.addSubview(tableView)
        tableView.frame = view.frame
        
        let frame = CGRect(x: 0, y: 88, width: view.frame.width, height: 100)
        userInfoHeader = UserInfoHeader(frame: frame)
        tableView.tableHeaderView = userInfoHeader
        tableView.tableFooterView = UIView()
        tableView.backgroundColor = .systemGroupedBackground
        
    }
    
    func configureUI() {
        configureTableView()
        
        navigationController?.isNavigationBarHidden = false
        self.navigationItem.hidesBackButton = false
        view.backgroundColor = .white
        navigationController?.navigationBar.prefersLargeTitles = false
        UINavigationBar.appearance().isTranslucent = false
        navigationController?.navigationBar.barTintColor = .white
        
        let textAttributes = [NSAttributedString.Key.foregroundColor:UIColor.systemRed]
        navigationController?.navigationBar.titleTextAttributes = textAttributes
       // navigationController?.navigationBar.barStyle = .black
       // navigationController?.navigationBar.tintColor = .black
        navigationItem.title = "Settings"
    }
    
}

extension SettingPageVC: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        switch section {
        case 0:
            return 2
        case 1:
            return 3
        case 2:
            return 2
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = UIView()
        if #available(iOS 13.0, *) {
            view.backgroundColor = .systemGroupedBackground
        } else {
            // Fallback on earlier versions
        }
        return view
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as! SettingsCell
        cell.accessoryType = .disclosureIndicator
        cell.selectionStyle = .none
        
        cell.imageView?.image = imageArray[indexPath.row]
        
        cell.textLabel?.text = nameArray[indexPath.row]
        return cell
        
    }
    
    
}
