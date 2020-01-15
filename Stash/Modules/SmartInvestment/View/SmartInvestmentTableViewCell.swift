//
//  SmartInvestmentTableViewCell.swift
//  Stash
//
//  Created by zhangyihua on 1/13/20.
//

import UIKit

class SmartInvestmentTableViewCell: UITableViewCell {
    
    @IBOutlet weak var shadowView: UIView!
    @IBOutlet weak var circleView: UIView!
    @IBOutlet weak var backgroundImageView: UIImageView!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var levelLabel: UILabel!
    @IBOutlet weak var progressLabel: UILabel!
    @IBOutlet weak var coverView: UIView!
    
    @IBOutlet weak var backView: UIView!   {
        didSet {
            backView.layer.cornerRadius = 5
            backView.layer.masksToBounds = true
        }
    }
    
    @IBOutlet weak var progressView: UIProgressView!{
        didSet {
            progressView.layer.cornerRadius = 5
            progressView.clipsToBounds = true
            progressView.layer.sublayers![1].cornerRadius = 5
            progressView.subviews[1].clipsToBounds = true
        }
    }
    
    override func layoutSubviews() {
        
        circleView.layer.cornerRadius = circleView.bounds.height/2
        
        shadowView.layer.masksToBounds = false
        shadowView.layer.shadowOffset = CGSize(width: 2, height: 2)
        shadowView.layer.shadowColor = UIColor.black.cgColor
        shadowView.layer.shadowOpacity = 0.5
        shadowView.layer.shadowRadius = 5
        shadowView.layer.cornerRadius = 5
        shadowView.layer.shadowPath = UIBezierPath(roundedRect: shadowView.bounds, byRoundingCorners: .allCorners, cornerRadii: CGSize(width: 5, height: 5)).cgPath
        shadowView.layer.shouldRasterize = true
        shadowView.layer.rasterizationScale = UIScreen.main.scale
    }
    
    func setAchievement(achievement: Achievement){
        
        progressLabel.text = String("\(achievement.progress)pts")
        totalLabel.text = String("\(achievement.total)pts")
        progressView.progress = Float(achievement.progress) / Float(achievement.total)
        levelLabel.text = achievement.level
        backgroundImageView.downloadImage(from: achievement.bigImageUrl)
        coverView.isHidden = achievement.accessible

    }
}
