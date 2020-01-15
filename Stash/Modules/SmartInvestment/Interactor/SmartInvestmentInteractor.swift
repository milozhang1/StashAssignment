//
//  SmartInvestmentInteractor.swift
//  Stash
//
//  Created by zhangyihua on 1/13/20.
//

import Foundation

class SmartInvestmentInteractor: SmartInvestmentInteractorInputProtocol {
    weak var presenter: SmartInvestmentInteractorOutputProtocol?
    var localDatamanager: SmartInvestmentLocalDataManagerInputProtocol?
    
    func retrieveSmartInvestment() {
        do {
            if let achievements = try localDatamanager?.retrieveSmartInvestment() {
                presenter?.didRetrieveAchievements(achievements)
            }
        } catch {
            presenter?.didRetrieveAchievements([])
        }
    }
        
}
