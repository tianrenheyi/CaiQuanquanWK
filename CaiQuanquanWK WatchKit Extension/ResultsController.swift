//
//  ResultsController.swift
//  CaiQuanquanWK
//
//  Created by 天人合一-apple on 15/5/21.
//  Copyright (c) 2015年 apple. All rights reserved.
//

import WatchKit
import Foundation


class ResultsController: WKInterfaceController {

    @IBOutlet weak var bg: WKInterfaceGroup!
    
    @IBOutlet weak var imgM: WKInterfaceImage!
    
    @IBOutlet weak var imgC: WKInterfaceImage!
    @IBOutlet weak var labResult: WKInterfaceLabel!
    
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
        // Configure interface objects here.
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
        
        imgC.setImageNamed("g\(c)")
        imgM.setImageNamed("g\(m)")
        
        if c == 1 {
            if m == 1 {
                onResult("平")
            } else if m == 2 {
                onResult("输")
            } else if m == 3 {
                onResult("赢")
            }
        } else if c == 2 {
            if m == 1 {
                onResult("赢")
            } else if m == 2 {
                onResult("平")
            } else if m == 3 {
                onResult("输")
             }
        } else if c == 3 {
            if m == 1 {
                onResult("输")
            } else if m == 2 {
                onResult("赢")
            } else if m == 3 {
                onResult("平")
            }
        }
        
    }
    
    // 判断胜负 接收一个字符串result：输，赢，平
    func onResult(result:String) {
        switch result {
            case "输":
                labResult.setText("你输了")
                lose += 1
                bg.setBackgroundImageNamed("bgLose")
            
            case "赢":
                labResult.setText("你赢了")
                win += 1
                bg.setBackgroundImageNamed("bgWin")
            case "平":
                labResult.setText("平手")
                tie += 1
                bg.setBackgroundImageNamed("bgTie")
            default:
            return
        }
    }
    

    @IBAction func onRestart() {
        // 让当前界面消失即可
        self.dismissController()
    }
    
    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

}
