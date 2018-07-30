//
//  SideMenuTableViewController.swift
//  MGAppSample
//
//  Created by 黃俊傑 on 2018/7/25.
//  Copyright © 2018年 Soui. All rights reserved.
//

import UIKit

class SideMenuTableViewController: UITableViewController {

    var titleList = [SideMenuData]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpTitleDataList()
    }

    // 設定選單
    private func setUpTitleDataList() {
        titleList.append(SideMenuData(title: "SearchBar練習", image: "SearchBar", page: "searchBarView"))
        titleList.append(SideMenuData(title: "WebView練習", image: "SearchBar", page: "webView"))
        titleList.append(SideMenuData(title: "JSON練習", image: "RandomUser", page: "randomUserView"))
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return titleList.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "sideMenuCell", for: indexPath)
        
        cell.textLabel?.text = titleList[indexPath.row].title
        cell.imageView?.image = UIImage(named: "right-arrow")

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = storyboard?.instantiateViewController(withIdentifier: titleList[indexPath.row].page)
        navigationController?.pushViewController(vc!, animated: true)
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

struct SideMenuData {
    var title: String
    var image: String
    var page: String
}


