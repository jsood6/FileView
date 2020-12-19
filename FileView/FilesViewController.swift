//
//  FilesViewController.swift
//  FileView
//
//  Created by Jigyasaa Sood on 12/18/20.
//

import UIKit

class FilesViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var filesTableView: UITableView!
    
    var filesArray: [File] = []
    let URLstring = "https://us-central1-mobile-developer-challenge.cloudfunctions.net/listFiles"

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.filesTableView.delegate = self
        self.filesTableView.dataSource = self
        
        fetchFiles()

        // Do any additional setup after loading the view.
    }
    
    func fetchFiles()
        {
            let url = URL(string:URLstring)!
            
            //getting data
            let request = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: 10)
            
            let session = URLSession(configuration: .default, delegate: nil, delegateQueue: OperationQueue.main)
            
            //task to get the data
            let task = session.dataTask(with: request) { (data, response, error) in
                //This will run when the network request returns
                if let error = error {
                    print(error.localizedDescription)
                    //based on error, display corresponding message
                    
                    //create a alert view controller
                    let alertController = UIAlertController(title: "Cannot load files", message: "Please check your wifi connection", preferredStyle: .alert)
                    
                    //create an OK action
                    let OKAction = UIAlertAction(title: "OK", style: .default) {(action) in
                        //handle response here
                    }
                    
                    // add the OK action to the alert controller
                    alertController.addAction(OKAction)
                    
                   
                    DispatchQueue.main.async {
                        self.present(alertController, animated: true, completion: nil)
                    }
                }
                else if let data = data {
                    let dataArray = try! JSONSerialization.jsonObject(with: data, options: []) as! NSArray
                    print(dataArray)
                    
                    //let fileDictionaries = dataDictionary[""] as! [[String:Any]]
                    let filezArray = dataArray
                    
                    for filez in filezArray {
                        let file = filez as! [String:Any]
                        let fileDictionary = File(dictionary: file)
                        self.filesArray.append(fileDictionary)
                        
                    }
                    
                    
                    self.filesTableView.reloadData()
                    
                }
            }
            //ALWAYS NEED TO CALL THIS FUNCTION! this will actually start the task
            task.resume()
        }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.filesArray.count;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FilesCell", for: indexPath) as! FilesTableViewCell
        cell.file = filesArray[indexPath.row]
        return cell
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
