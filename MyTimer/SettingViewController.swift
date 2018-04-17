//
//  SettingViewController.swift
//  MyTimer
//
//  Created by Kakeru Nakabachi on 2018/04/16.
//  Copyright © 2018年 kakeru nakabachi. All rights reserved.
//

import UIKit

class SettingViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    // UIPickerViewに表示するデータをArrayで作成
    let settingArray : [Int] = [10, 20, 30, 40, 50, 60]
    
    // 設定値を覚えるキーを設定
    let settingKey = "timer_value"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // timerSettinPickerのデリゲートとデータソースの通知先を指定
        timeSettingPicker.delegate = self
        timeSettingPicker.dataSource = self
        
        // UserDefaultsの取得
        let settings = UserDefaults.standard
        let timerValue = settings.integer(forKey: settingKey)
        
        // Pickerの選択を合わせる
        for row in 0..<settingArray.count {
            if settingArray[row] == timerValue {
                timeSettingPicker.selectRow(row, inComponent: 0, animated: true)
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    @IBOutlet weak var timeSettingPicker: UIPickerView!
    
    @IBAction func decisionButtonAction(_ sender: Any) {
        // 前画面に戻る
        _ = navigationController?.popViewController(animated: true)
    }
    
    // UIPickerViewの列数を設定
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    // UIPickerViewの行数を設定
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return settingArray.count
    }
    
    // UiPickerViewの表示する内容を設定
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return String(settingArray[row])
    }
    
    // picker選択時に実行
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        // UserDefaultsの設定
        let settings = UserDefaults.standard
        settings.setValue(settingArray[row], forKey: settingKey)
        settings.synchronize()
    }
}
