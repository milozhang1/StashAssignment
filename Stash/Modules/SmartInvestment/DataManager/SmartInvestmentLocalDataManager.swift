//
//  SmartInvestmentLocalDataManager.swift
//  Stash
//
//  Created by zhangyihua on 1/13/20.
//

import Foundation

class SmartInvestmentLocalDataManager: SmartInvestmentLocalDataManagerInputProtocol {
    func retrieveSmartInvestment() throws -> [Achievement] {
        
        let path = Bundle.main.path(forResource: "achievements", ofType: "json") ?? ""
        let fileUrl = URL(fileURLWithPath: path)
        let data = try Data(contentsOf: fileUrl, options: .mappedIfSafe)
        let achievementResponse = try JSONDecoder().decode(AchievementResponse.self, from: data)
        
        return achievementResponse.achievements
    }
}

