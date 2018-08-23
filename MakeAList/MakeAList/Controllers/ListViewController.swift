//
//  ViewController.swift
//  MakeAList
//
//  Created by dave on 23/08/2018.
//  Copyright © 2018 dave. All rights reserved.
//

import UIKit

class ListViewController: UIViewController {

  @IBOutlet weak var todolistTableView: UITableView!
  
  let dummyString: [String] = ["play the guitar",
                             "study the swift",
                             "drive the car",
                             "music listen",
                             "play the piano",
                             "game development",
                             "swimming"]
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
    todolistTableView.dataSource = self
    todolistTableView.delegate = self
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
}

extension ListViewController: UITableViewDelegate, UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return dummyString.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
    cell.textLabel?.text = dummyString[indexPath.row]
    return cell
  }
}
