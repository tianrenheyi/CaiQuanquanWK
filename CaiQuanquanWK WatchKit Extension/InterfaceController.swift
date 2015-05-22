//
//  InterfaceController.swift
//  CaiQuanquanWK WatchKit Extension
//
//  Created by 天人合一-apple on 15/5/21.
//  Copyright (c) 2015年 apple. All rights reserved.
//

import WatchKit
import Foundation


class InterfaceController: WKInterfaceController {
    @IBOutlet weak var labWin: WKInterfaceLabel!

    @IBOutlet weak var labLose: WKInterfaceLabel!
    
    @IBOutlet weak var labWinTimes: WKInterfaceLabel!
    
    @IBOutlet weak var labLoseTimes: WKInterfaceLabel!
    
    @IBOutlet weak var labTieTimes: WKInterfaceLabel!
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
        // Configure interface objects here.
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
        
        labWinTimes.setText("\(win)")
        labLoseTimes.setText("\(lose)")
        labTieTimes.setText("\(tie)")
    }

    // 出拳头
    @IBAction func onShitou() {
        onComputer()
        m = 1
        // 界面跳转，（result为界面标识,定义了全局变量context即为nil即可）
        self.presentControllerWithName("result", context: nil)
    }
    
    @IBAction func onJiandao() {
        onComputer()
        m = 2
        self.presentControllerWithName("result", context: nil)
    }
    
    @IBAction func onBu() {
        onComputer()
        m = 3
        self.presentControllerWithName("result", context: nil)
    }
    
    // 这个方法返回电脑出的拳
    func onComputer() {
        c = random() % 3 // 值是 0-2
        c += 1           // 值为 1-3
    }
    
    // 返回我出的拳
    
    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

}

// 设置几个全局变量
// 赢的次数
var win:Int = 0
// 输的次数
var lose:Int = 0
// 平的次数
var tie:Int = 0
// 电脑出拳
var c:Int = 1
// 我的出拳
var m:Int = 1

