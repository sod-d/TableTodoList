//
//  AddViewController.swift
//  TableTodoList
//
//  Created by sodud on 2024/01/05.
//

import UIKit

class AddViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    let MAX_ARRAY_NUM = 3
    let PICKER_VIEW_COLUMN = 1
    var imageArray = [UIImage?]()
    var selImgRow = 0
    var ImageFile = ["pencil.png","cart.png", "clock.png" ]
    
    @IBOutlet var imgView: UIImageView!
    @IBOutlet var pickerImage: UIPickerView!
    @IBOutlet var tfAddItem: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        for i in 0 ..< MAX_ARRAY_NUM {
            let image = UIImage(named: ImageFile[i])
            imageArray.append(image)
        }
        NSLog("MAX_ARRAY_NUM : " + String(MAX_ARRAY_NUM))
        imgView.image = imageArray[0]
    }
    
    
    @IBAction func btnAddItem(_ sender: UIButton) {
        items.append(tfAddItem.text!)
        itemsImageFile.append(itemsImageFile[selImgRow])
        tfAddItem.text=""
        _ = navigationController?.popViewController(animated: true)
        
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return PICKER_VIEW_COLUMN
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        NSLog("KSY count" + String(itemsImageFile.count))
        return ImageFile.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return  ImageFile[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        imgView.image = imageArray[row]
        selImgRow = row
    }

}
