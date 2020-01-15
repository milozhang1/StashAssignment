//
//  SmartInvestmentInteractorTest.swift
//  StashTests
//
//  Created by zhangyihua on 1/15/20.
//

import XCTest
@testable import Stash

class SmartInvestmentInteractorTest: XCTestCase {
    
    // MARK: - Subject under test
    
    var sut: SmartInvestmentInteractor!
    
    
    override func setUp() {
        super.setUp()
        setupSmartInvestmentInteractor()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    // MARK: - Test setup
    
    func setupSmartInvestmentInteractor() {
        sut = SmartInvestmentInteractor()
    }
    
    // MARK: - Test doubles
    
    class SmartInvestmentPresenterSpy: SmartInvestmentInteractorOutputProtocol {
        
        var didGetAchievements = false
        
        func didRetrieveAchievements(_ achievements: [Achievement]) {
            didGetAchievements = true
        }
        
        func onError() {
            didGetAchievements = false
        }
    }
    
    class SmartInvestmentLocalDataManagerSpy: SmartInvestmentLocalDataManagerInputProtocol {
        
        var didFetchAchievements = false

        func retrieveSmartInvestment() throws -> [Achievement] {
            didFetchAchievements = true
            return []
        }
    }
    
    // MARK: - Tests
    func testFetchSmartInvestmentShouldAskDataManagerToFetchAndPresenterToFormatResult()
    {
      // Given
      let presenterSpy = SmartInvestmentPresenterSpy()
      sut.presenter = presenterSpy
      let datamanagerSpy = SmartInvestmentLocalDataManagerSpy()
      sut.localDatamanager = datamanagerSpy
      
      // When
      sut.retrieveSmartInvestment()
      
      // Then
      XCTAssert(presenterSpy.didGetAchievements, "retrieveSmartInvestment() should ask presenter to format result")
      XCTAssert(datamanagerSpy.didFetchAchievements, "retrieveSmartInvestment() should ask daramanager to get data")
    }
}
