//
//  SearchBarViewController.swift
//  MGAppSample
//
//  Created by 黃俊傑 on 2018/7/25.
//  Copyright © 2018年 Soui. All rights reserved.
//

import UIKit

class SearchBarViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate {
    
    @IBOutlet weak var resultTableView: UITableView!
    
    var animalList = [Animal]()
    
    var currentAnimalList = [Animal]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpAnimalData()
        createSearchBar()
        
        currentAnimalList = animalList
    }

    func setUpAnimalData() {
        animalList.append(Animal(name: "Aenescumb", image: "Aenescumb"))
        animalList.append(Animal(name: "Akker", image: "Akker"))
        animalList.append(Animal(name: "Akker", image: "Akker"))
        animalList.append(Animal(name: "Baram", image: "Baram"))
        animalList.append(Animal(name: "Dinsmore", image: "Dinsmore"))
        animalList.append(Animal(name: "SBtinka", image: "SBtinka"))
        animalList.append(Animal(name: "Tylere", image: "Tylere"))
        animalList.append(Animal(name: "Ollaneg", image: "Ollaneg"))
        animalList.append(Animal(name: "Mirabelle", image: "Mirabelle"))
        animalList.append(Animal(name: "Jabbar", image: "Jabbar"))
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        if(searchText == "") {
            currentAnimalList = animalList
        } else {
            currentAnimalList = animalList.filter({ (animal) -> Bool in
                animal.name.lowercased().contains(searchText.lowercased())
            })
        }
        resultTableView.reloadData()
    }
    
    func searchBar(_ searchBar: UISearchBar, selectedScopeButtonIndexDidChange selectedScope: Int) {
        
    }
    
    func createSearchBar() {
        
        let searchBar = UISearchBar()
        searchBar.showsCancelButton = false
        searchBar.placeholder = "Enter Name.."
        searchBar.delegate = self
        
        self.navigationItem.titleView = searchBar
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return currentAnimalList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "searchBarTableCell") {
            cell.textLabel?.text = currentAnimalList[indexPath.row].name
            return cell
        } else {
            return UITableViewCell()
        }
    }
    
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

struct Animal {
    var name: String
    var image: String
}
