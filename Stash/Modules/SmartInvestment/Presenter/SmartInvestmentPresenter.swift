//
//  SmartInvestmentPresenter.swift
//  Stash
//
//  Created by zhangyihua on 1/13/20.
//

import Foundation
import UIKit

class SmartInvestmentPresenter: SmartInvestmentPresenterProtocol {
    weak var view: SmartInvestmentViewProtocol?
    var interactor: SmartInvestmentInteractorInputProtocol?
    var router: SmartInvestmentRouterProtocol?
    
    func viewDidLoad() {
        view?.showLoading()
        interactor?.retrieveSmartInvestment()
    }
}

extension SmartInvestmentPresenter: SmartInvestmentInteractorOutputProtocol {
    func didRetrieveAchievements(_ achievements: [Achievement]) {
        view?.hideLoading()
        view?.showAchievements(achievements: achievements)
    }
    
    func onError() {
        view?.hideLoading()
        view?.showError()
    }
    
}


