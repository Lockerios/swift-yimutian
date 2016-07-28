//
//  FindViewController.swift
//  Yimutian
//
//  Created by yangyang on 15/10/29.
//  Copyright © 2015年 LLZ. All rights reserved.
//

import UIKit

class FindViewController: BaseViewController, UIPickerViewDataSource, UIPickerViewDelegate {

    var segmentController: UISegmentedControl!
    var dataTypePicker: UIPickerView!
    var pickerBtn: UIButton!
    
    //MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        segmentController = UISegmentedControl(items: ["找买家", "找卖家"])
        segmentController.selectedSegmentIndex = 0
        segmentController.addTarget(self, action: #selector(FindViewController.p_segmentValueChanged), for: .valueChanged)
        
        self.navigationItem.titleView = segmentController
        
        dataTypePicker = UIPickerView(frame: CGRect(x: 0,y: SCREEN_HEIGHT-220-60,width: SCREEN_WIDTH,height: 220))
        dataTypePicker.dataSource = self
        dataTypePicker.delegate = self
        dataTypePicker.isHidden = true
        dataTypePicker.layer.borderColor = UIColor.gray().cgColor
        dataTypePicker.layer.borderWidth = 1.0
        
        view.addSubview(dataTypePicker)
        
        pickerBtn = UIButton(type: .custom)
        pickerBtn.frame = CGRect(x: 0, y: 60, width: SCREEN_WIDTH, height: 44)
        pickerBtn.setTitle("北京市", for: UIControlState())
        pickerBtn.setTitleColor(UIColor.black(), for: UIControlState())
        pickerBtn.addTarget(self, action: #selector(FindViewController.p_showPicker), for: .touchUpInside)
        pickerBtn.layer.borderColor = UIColor.red().cgColor
        pickerBtn.layer.borderWidth = 1.0
        
        view.addSubview(pickerBtn)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    //MARK: - Methods
    
    func p_segmentValueChanged() {
        dLog(message: "\(segmentController.selectedSegmentIndex)")
    }
    
    func p_showPicker() {
        dLog(message: "show Picker")
        dataTypePicker.isHidden = !dataTypePicker.isHidden
    }
    
    //MARK: - Actions

    //MARK: UIPickerViewDataSource
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 3
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 5
    }
    
    //MARK: UIPickerViewDelegate
    
    func pickerView(_ pickerView: UIPickerView, widthForComponent component: Int) -> CGFloat {
        return SCREEN_WIDTH/3
    }
    
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return 44
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return "\(component)"+" "+"\(row)"
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        dLog(message: "\(component)"+" "+"\(row)"+" selected")
    }
}
