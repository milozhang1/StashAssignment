//
//  MainProtocols.swift
//  Stash
//
//  Created by zhangyihua on 1/13/20.
//

import UIKit

protocol MainViewProtocol: AnyObject {
    var presenter: MainPresenterProtocol? { get set }
    
    // PRESENTER -> VIEW
    func showSmartInvestment()
}

protocol MainRouterProtocol: AnyObject {
    static func createMainModule() -> UIViewController
    
    // PRESENTER -> ROUTER
    func presentSmartInvestmentScreen(from view: MainViewProtocol)
}

protocol MainPresenterProtocol: AnyObject {
    var view: MainViewProtocol? { get set }
    var router: MainRouterProtocol? { get set }
    
    // VIEW -> PRESENTER
    func showSmartInvestment()
}
