//
//  RandomUserViewController.swift
//  MGAppSample
//
//  Created by 黃俊傑 on 2018/7/30.
//  Copyright © 2018年 Soui. All rights reserved.
//

import UIKit

class RandomUserViewController: UIViewController, URLSessionDelegate, URLSessionDownloadDelegate  {
    
    @IBOutlet weak var userImage: UIImageView!
    
    @IBOutlet weak var userName: UILabel!
    
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    var randomUserTableView: RandomUserTableViewController?
    
    let randomUserApiUrl = "https://randomuser.me/api/"
    
    var defaultSession: URLSession?
    
    var dataTask: URLSessionDataTask?
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        defaultSession = URLSession(configuration: .default, delegate: self, delegateQueue: nil)
        
        getRandomUserData();
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // 畫面再入完後
    override func viewDidAppear(_ animated: Bool) {
        setUserImageCircle();
    }

    // 圖片圓角
    func setUserImageCircle() {
        userImage.layer.cornerRadius = userImage.frame.width / 2
        userImage.clipsToBounds = true
    }
    
    // 透過API取得隨機人員
    func getRandomUserData() {

        activityIndicator.startAnimating()
        
        guard let url = URL(string: randomUserApiUrl) else {
            return
        }
        
        dataTask = defaultSession?.dataTask(with: url, completionHandler: { (data, response, error) in

            if(error != nil) {

                if let error = error {
                    
                    DispatchQueue.main.async {
                        self.alertMessage(error: error)
                    }
                }
                
            } else {
                
                 if let data = data {
                    
                    do {
                        
                        let decoder: JSONDecoder = JSONDecoder()
                        
                        let decoded = try decoder.decode(RandomUserDataBean.self, from: data)
                        
                        let result = decoded.results[0]
                        
                        let userData = UserData(name: result.name.first + " " + result.name.last, phone: result.phone, email: result.email, image: result.picture.large)
                        
                        DispatchQueue.main.async {
                            self.setUserData(userData: userData)
                        }
                        
                    } catch {
                        DispatchQueue.main.async {
                            self.alertMessage(error: error)
                        }
                    }
                    
                }
                
            }
            
        })
        
        dataTask?.resume()
        
    }
    
    // 重新整理
    @IBAction func refreshUserData(_ sender: Any) {
        getRandomUserData()
    }
    
    // 錯誤訊息視窗
    func alertMessage(error: Error) {
        
        let alertCV = UIAlertController(title: "Error", message: error.localizedDescription, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertCV.addAction(okAction)
        
        activityIndicator.stopAnimating()
        present(alertCV, animated: true, completion: nil)
    }
    
    // 設定畫面人員資料
    func setUserData(userData: UserData) {
        userName.text = userData.name
        randomUserTableView?.userEmail.text = userData.email
        randomUserTableView?.userPhone.text = userData.phone
        randomUserTableView?.tableView.reloadData()
        
        let url = URL(string: userData.image)
        let data = try? Data(contentsOf: url!)
        userImage.image = UIImage(data: data!)
        
        activityIndicator.stopAnimating()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        // 取得目標tableView
        if(segue.identifier == "userInfoSegue") {
            randomUserTableView = segue.destination as? RandomUserTableViewController
        }
    }
    
    func urlSession(_ session: URLSession, downloadTask: URLSessionDownloadTask, didFinishDownloadingTo location: URL) {
//        print("didFinishDownloadingTo......")
//        activityIndicator.stopAnimating()
    }
    
    func urlSession(_ session: URLSession, task: URLSessionTask, didCompleteWithError error: Error?) {
//        print("didCompleteWithError......")
//        activityIndicator.stopAnimating()
    }
}

struct UserData {
    var name: String
    var phone: String
    var email: String
    var image: String
}

struct RandomUserData {
    
    
}

