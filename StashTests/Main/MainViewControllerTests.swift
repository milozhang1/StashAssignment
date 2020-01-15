//
//  MainViewControllerTests.swift
//  StashTests
//
//  Created by zhangyihua on 1/14/20.
//

import XCTest
@testable import Stash

class MainViewControllerTests: XCTestCase {
    
    var sut: MainViewController!
    var window: UIWindow!
    
    override func setUp() {
        super.setUp()
        window = UIWindow()
        setupMainViewController()
    }
    
    override func tearDown() {
        sut = nil
        window = nil
        super.tearDown()
    }
    
    // MARK: - Test Setup
    
    func setupMainViewController() {
        let bundle = Bundle.main
        let storyboard = UIStoryboard(name: "Main", bundle: bundle)
        let navController = storyboard.instantiateViewController(withIdentifier: "MainNavigationController")
        sut = navController.children.first as? MainViewController
    }
    
    func loadView(){
        window.addSubview(sut.view)
        RunLoop.current.run(until: Date())
    }
    
    // MARK: - Initial State
    
    func testMainController_whenCreated_buttonLabel() {
        loadView()
        
        let text = sut.investmentButton.title(for: .normal)
        XCTAssertEqual(text, "Smart Investing")
    }
    
}
