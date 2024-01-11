//
//  TableViewController.swift
//  TableTodoList
//
//  Created by sodud on 2024/01/05.
//

import UIKit

var items = ["스터디 준비하기", "회사 회식", "메가박스 영화 시사회 참석"]
var itemsImageFile = ["pencil.png","cart.png", "clock.png" ]

class TableViewController: UITableViewController {

    @IBOutlet var tvListView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
         self.navigationItem.leftBarButtonItem = self.editButtonItem
    }
    
    override func viewWillAppear(_ animated: Bool) {
        tvListView.reloadData() //뷰를 리로드
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return items.count
    }

    
    //셀 추가
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath)
        
        cell.textLabel?.text = items[(indexPath as NSIndexPath).row]
        cell.imageView?.image = UIImage(named: itemsImageFile[(indexPath as NSIndexPath).row])

        // Configure the cell...

        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    // 셀 삭제
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            items.remove(at: (indexPath as NSIndexPath).row)
            itemsImageFile.remove(at: (indexPath as NSIndexPath).row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    
    override func tableView(_ tableView: UITableView, titleForDeleteConfirmationButtonForRowAt IndexPath: IndexPath) -> String? {
        return "삭제"
    }

    
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
        let itemToMove = items[(fromIndexPath as NSIndexPath).row] //이동할 아이템의 위치를 저장
        let itemImageToMove = itemsImageFile[(fromIndexPath as NSIndexPath).row] //이동할 아이템의 이미지를 저장
        items.remove(at: (fromIndexPath as NSIndexPath).row) //이동할 아이템을 삭제, 삭제한 아이템 인덱스 재정렬
        itemsImageFile.remove(at: (fromIndexPath as NSIndexPath).row) //이동할 아이템 이미지 삭제, 삭제한 아이템 이미지 재정렬
        items.insert(itemToMove, at: (to as NSIndexPath).row) //삭제된 아이템을 이동할 위치로 삽입, 삽입한 아이템 뒤 인덱스 재정렬
        itemsImageFile.insert(itemImageToMove, at:(to as NSIndexPath).row) //삭제된 이미지를 이동할 위치로 삽입, 삽입한 이미지 뒤 인덱스 재정렬
    }
    

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation

//     In a storyboard-based application, you will often want to do a little preparation before navigation
//     segue를 사용하여 뷰를 이동하는 함수
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        if segue.identifier == "sgDetail" {
            let cell = sender as! UITableViewCell
            let indexPath = self.tvListView.indexPath(for: cell)
            let detailView = segue.destination as! DetailViewController
            detailView.receiveItem(items[((indexPath! as NSIndexPath).row)])
        }
    }

}
