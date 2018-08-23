//
//  ToDoItemCell.swift
//  MakeAList
//
//  Created by dave on 23/08/2018.
//  Copyright © 2018 dave. All rights reserved.
//

import UIKit

class ToDoItemCell: UITableViewCell {
  
  @IBOutlet weak var checkImageView: UIImageView!
  @IBOutlet weak var todoItemLabel: UILabel!
  
  override func awakeFromNib() {
    super.awakeFromNib()
    // Initialization code
//    backgroundColor = UIColor(red: 121/255, green: 193/255, blue: 175/255, alpha: 1)
  }
  
  override func setSelected(_ selected: Bool, animated: Bool) {
    super.setSelected(selected, animated: animated)
    
    // Configure the view for the selected state
  }
  
}
