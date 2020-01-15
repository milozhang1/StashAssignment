//
//  MainPresenter.swift
//  Stash
//
//  Created by zhangyihua on 1/13/20.
//

import Foundation

class MainPresenter: MainPresenterProtocol {
    
    weak var view: MainViewProtocol?
    var router: MainRouterProtocol?
    
    func showSmartInvestment(){
        router?.presentSmartInvestmentScreen(from: view!)
    }
}
