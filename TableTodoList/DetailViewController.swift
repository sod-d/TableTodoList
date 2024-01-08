//
//  DetailViewController.swift
//  TableTodoList
//
//  Created by sodud on 2024/01/05.
//

import UIKit

class DetailViewController: UIViewController {
    
    var receiveItem = ""
    
    @IBOutlet var lblItem: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        lblItem.text = receiveItem //뷰가 노출 될 때마다 이 내용을 레이블의 텍스트로 표시
    }
    
    func receiveItem(_ item: String) //main view에서 변수를 받기 위한 함수 추가
    {
        receiveItem = item
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
