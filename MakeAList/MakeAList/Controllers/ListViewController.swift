//
//  ViewController.swift
//  MakeAList
//
//  Created by dave on 23/08/2018.
//  Copyright © 2018 dave. All rights reserved.
//

import UIKit

class ListViewController: UITableViewController {
  
  @IBOutlet weak var todolistTableView: UITableView!
  
  var toDoItems: [ToDoItemData]
  
  required init?(coder aDecoder: NSCoder) {
    toDoItems = [ToDoItemData]()
    
    let row0Item = ToDoItemData()
//    row0Item.title = dummyString[0]
//    row0Item.isChecked = true
    toDoItems.append(row0Item)
    
    let row1Item = ToDoItemData()
//    row1Item.title = dummyString[1]
//    row1Item.isChecked = true
    toDoItems.append(row1Item)

    let row2Item = ToDoItemData()
//    row2Item.title = dummyString[2]
//    row2Item.isChecked = false
    toDoItems.append(row2Item)

    let row3Item = ToDoItemData()
//    row3Item.title = dummyString[3]
//    row3Item.isChecked = true
    toDoItems.append(row3Item)

    let row4Item = ToDoItemData()
//    row4Item.title = dummyString[4]
//    row4Item.isChecked = false
    toDoItems.append(row4Item)

    let row5Item = ToDoItemData()
//    row5Item.title = dummyString[5]
//    row5Item.isChecked = true
    toDoItems.append(row5Item)

    let row6Item = ToDoItemData()
//    row6Item.title = dummyString[6]
//    row6Item.isChecked = false
    toDoItems.append(row6Item)

    super.init(coder: aDecoder)
  }
  
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
//    todolistTableView.dataSource = self
//    todolistTableView.delegate = self
//    view.backgroundColor = UIColor(red: 121/255, green: 193/255, blue: 175/255, alpha: 1)
    navigationItem.title = "To Do List"
    navigationItem.largeTitleDisplayMode = .always
    navigationController?.navigationBar.prefersLargeTitles = true
    navigationController?.navigationBar.backgroundColor = .white
    navigationController?.navigationBar.isTranslucent = false
    
    todolistTableView.isEditing = true
  }
  
  override func viewWillAppear(_ animated: Bool) {

  }
  
  override func viewDidAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  // MARK:- private methods
  func configureCheckmark(for cell: ToDoItemCell, with item: ToDoItemData) {
    if item.isChecked {
      cell.checkImageView?.image = UIImage(named: "checkedIcon.png")
    } else {
      cell.checkImageView?.image = UIImage(named: "uncheckedIcon.png")
    }
  }
  
  func configureText(for cell: ToDoItemCell, with indexPath: IndexPath) {
    cell.todoItemLabel.text = dummyString[indexPath.row]
  }
  
}

// MARK:- UITableViewDataSource
extension ListViewController {
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return dummyString.count
  }
  
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoItemCell", for: indexPath) as! ToDoItemCell
    configureText(for: cell, with: indexPath)
    let item = toDoItems[indexPath.row]
    configureCheckmark(for: cell, with: item)
    return cell
  }
}

// MARK:- UITableViewDelegate
extension ListViewController {
  override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    let cell = ToDoItemCell()
    let item = ToDoItemData()
    if let cell = tableView.cellForRow(at: indexPath) {
      if cell.accessoryType == .none {
        cell.accessoryType = .checkmark
        item.isChecked = true
      } else {
        cell.accessoryType = .none
        item.isChecked = false
      }
    }
    configureCheckmark(for: cell, with: item)
    view.layoutIfNeeded()
//    cell.checkImageView?.image = UIImage(named: "checkedIcon.png")
    tableView.deselectRow(at: indexPath, animated: true)
  }
  
  override func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCellEditingStyle {
    return .none
  }
  
  override func tableView(_ tableView: UITableView, shouldIndentWhileEditingRowAt indexPath: IndexPath) -> Bool {
    return false
  }
  
  override func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
    let moveObject = toDoItems[sourceIndexPath.row]
    toDoItems.remove(at: sourceIndexPath.row)
    toDoItems.insert(moveObject, at: destinationIndexPath.row)
  }
  
  
}
