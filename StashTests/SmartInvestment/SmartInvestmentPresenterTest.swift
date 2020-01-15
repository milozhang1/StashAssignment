//
//  SmartInvestmentPresenterTest.swift
//  StashTests
//
//  Created by zhangyihua on 1/15/20.
//

import XCTest
@testable import Stash

class SmartInvestmentPresenterTest: XCTestCase {
    
    // MARK: - Subject under test
    
    var sut: SmartInvestmentPresenter!
    
    
    override func setUp() {
        super.setUp()
        setupSmartInvestmentPresenter()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    // MARK: - Test setup
    
    func setupSmartInvestmentPresenter() {
        sut = SmartInvestmentPresenter()
    }
    
    // MARK: - Test doubles
    
    class SmartInvestmentViewControllerSpy: SmartInvestmentViewProtocol {
        
        var presenter: SmartInvestmentPresenterProtocol?
        var achievements: [Achievement] = []
        var isShowingError = false
        
        func showAchievements(achievements: [Achievement]) {
            self.achievements = achievements
            isShowingError = false
        }
        
        func showError() {
            isShowingError = true
        }
        
        func showLoading() {
        }
        
        func hideLoading() {
        }
    }
    
    // MARK: - Tests
    
    func testPresentFetchedAchievementsShouldFormatFetchedAchievementsForDisplay()
    {
        // Given
        let spy = SmartInvestmentViewControllerSpy()
        sut.view = spy
        
        // When
        let achievement = Achievement(id: 1,
                                      level: "2",
                                      progress: 10,
                                      total: 50,
                                      bigImageUrl: URL(string: "https://cdn.zeplin.io/5a5f7e1b4f9f24b874e0f19f/screens/341E40C8-1C2A-400C-B67D-F490B74BDD81.png")!,
                                      accessible: true)
        let achievements = [achievement]
        sut.didRetrieveAchievements(achievements)
        
        // Then
        for curr in spy.achievements {
            XCTAssertEqual(curr.id, 1, "Presenting fetched achievement should properly format order ID")
            XCTAssertEqual(curr.level, "2", "Presenting fetched achievement should properly format order date")
            XCTAssertEqual(curr.progress, 10, "Presenting fetched achievement should properly format email")
            XCTAssertEqual(curr.total, 50, "Presenting fetched achievement should properly format name")
            XCTAssertEqual(curr.accessible, true, "Presenting fetched achievement should properly format total")
            XCTAssertEqual(curr.bigImageUrl.absoluteString, "https://cdn.zeplin.io/5a5f7e1b4f9f24b874e0f19f/screens/341E40C8-1C2A-400C-B67D-F490B74BDD81.png", "Presenting fetched achievement should properly format total")
        }
    }
    
    func testPresentFetchedAchievementsFailedShouldAskViewControllerToDisplayError()
    {
        // Given
        let spy = SmartInvestmentViewControllerSpy()
        sut.view = spy
        
        // When
        sut.onError()
        
        // Then
        XCTAssertTrue(spy.isShowingError)
    }
}
