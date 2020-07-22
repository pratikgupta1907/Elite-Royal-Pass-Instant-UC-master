//
//  HistoryModel.swift
//  Elite Royal Pass Instant UC
//
//  Created by pratik gupta on 20/07/20.
//  Copyright © 2020 Saif Mukadam. All rights reserved.
//

import Foundation
import SwiftyJSON

struct HistoryModel {
    
    var date: String = ""
    var id: String = ""
    var Coin: String = ""
    var Pending: Int = 0
    
    
    init() {
        
    }
    
    init(json: JSON) {
        date = json["date"].stringValue
        id = json["id"].stringValue
        Coin = json["Coin"].stringValue
        Pending = json["Pending"].intValue
    
    }
    
}


