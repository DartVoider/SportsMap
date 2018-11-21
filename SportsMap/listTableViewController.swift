//
//  listTableViewController.swift
//  SportsMap
//
//  Created by user on 20.11.2018.
//  Copyright © 2018 SAD. All rights reserved.
//

import UIKit

class listTableViewController: UITableViewController {

    var grounds = [SGround]()
    override func viewDidLoad() {
        
        super.viewDidLoad()
        getGrounds()
        print("asdf")

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return grounds.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "listTableViewCell", for: indexPath)
        if let castedCell = cell as? listTableViewCell {
            let ground = grounds[indexPath.row]
            castedCell.groundName.text = ground.name
        } else {
            print ("error")
        }

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

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let detailVC = segue.destination as! detailViewController
        if let selectedCell = sender as? listTableViewCell {
            let indexPath = tableView.indexPath(for: selectedCell)!
            let selectedItem = grounds[indexPath.row]
            detailVC.item=selectedItem
        }
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }

    func getGrounds() {
        print("mukalo")
        let urlString = "https://apidata.mos.ru/v1/datasets/886/rows?api_key=c3553d2754398b41bd1cbeea416e5d39&$top=20&$skip=1"
        guard let url = URL(string: urlString) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error {
                print(error.localizedDescription)
                return
            }
            guard let data = data else { return }
            
            do {
                let json = try JSONSerialization.jsonObject(with: data, options: [])
                print(json)
                self.parseGrounds(from: json)
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }

            } catch {
                print(error.localizedDescription)
            }
        }.resume()
    }
    
    func parseGrounds(from json: Any) {
        guard let groundsArray = json as? NSArray else {
            print("Parsing error")
            return
        }
        
        for i in groundsArray {
            guard let groundDict = i as? NSDictionary,
                let ground = SGround(ground_data: groundDict) else {
                    print("ololo error")
                    continue }
            self.grounds.append(ground)
            print(ground.name)

        }
        print(self.grounds)
    }

}
