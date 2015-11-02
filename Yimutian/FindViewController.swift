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
        segmentController.addTarget(self, action: Selector("p_segmentValueChanged"), forControlEvents: .ValueChanged)
        
        self.navigationItem.titleView = segmentController
        
        dataTypePicker = UIPickerView(frame: CGRectMake(0,SCREEN_HEIGHT-220-60,SCREEN_WIDTH,220))
        dataTypePicker.dataSource = self
        dataTypePicker.delegate = self
        dataTypePicker.hidden = true
        dataTypePicker.layer.borderColor = UIColor.grayColor().CGColor
        dataTypePicker.layer.borderWidth = 1.0
        
        view.addSubview(dataTypePicker)
        
        pickerBtn = UIButton(type: .Custom)
        pickerBtn.frame = CGRectMake(0, 60, SCREEN_WIDTH, 44)
        pickerBtn.setTitle("北京市", forState: .Normal)
        pickerBtn.setTitleColor(UIColor.blackColor(), forState: .Normal)
        pickerBtn.addTarget(self, action: Selector("p_showPicker"), forControlEvents: .TouchUpInside)
        pickerBtn.layer.borderColor = UIColor.redColor().CGColor
        pickerBtn.layer.borderWidth = 1.0
        
        view.addSubview(pickerBtn)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    //MARK: - Methods
    
    func p_segmentValueChanged() {
        dLog("\(segmentController.selectedSegmentIndex)")
    }
    
    func p_showPicker() {
        dLog("show Picker")
        dataTypePicker.hidden = !dataTypePicker.hidden
    }
    
    //MARK: - Actions

    //MARK: UIPickerViewDataSource
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 3
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 5
    }
    
    //MARK: UIPickerViewDelegate
    
    func pickerView(pickerView: UIPickerView, widthForComponent component: Int) -> CGFloat {
        return SCREEN_WIDTH/3
    }
    
    func pickerView(pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return 44
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return "\(component)"+" "+"\(row)"
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        dLog("\(component)"+" "+"\(row)"+" selected")
    }
}
