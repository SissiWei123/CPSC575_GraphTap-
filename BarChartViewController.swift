//
//  BarChartViewController.swift
//  GraphTap
//
//  Created by Iris Bao on 2019-11-06.
//  Copyright © 2019 Yuchen Wei. All rights reserved.
//

import Foundation
import UIKit

class BarChartViewController: UIViewController {
    
    lazy var barChartView: BarChartView = {
        let barChartView = BarChartView()
        barChartView.frame = view.frame
        return barChartView
    }()
        
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        view.addSubview(barChartView)
    }

}
