//
//  ViewController.swift
//  Planet 8
//
//  Created by MSadri on 11/29/18.
//  Copyright © 2018 MSadri. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource  {
    
    
    
    
    @IBOutlet weak var mainTableView: UITableView!
    
    var dataToReloadThisTable : [String] = [] {
        didSet{
            self.mainTableView.reloadData()
            self.autoScroll(toWhere: dataToReloadThisTable.count - 1 )
        }
    }
    //entery data to this page
    var enteryDataToThisPage : [String] = {
        var thisLocalStory = [String]()
        thisLocalStory = ["123","456", "QuestionCell[Yes][No]"]
        return thisLocalStory
    }()
    
    var yesArray : [String] = {
        var thisYesArray = [String]()
        thisYesArray = ["Sadegh","Bitarafan", "QuestionCell[Ok][Later]"]
        return thisYesArray
    }()
    
    var noArray : [String] = {
        var thisNoArray = [String]()
        thisNoArray = ["Masih","Sadri"]
        return thisNoArray
    }()
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataToReloadThisTable.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var isContainQuestionWord = Bool()
        if dataToReloadThisTable[indexPath.row].contains("QuestionCell") {
            isContainQuestionWord = true
        } else {
            isContainQuestionWord = false
        }
        
        if isContainQuestionWord {
            let cell = tableView.dequeueReusableCell(withIdentifier: "cellButton", for: indexPath) as! MainTableQuestionCell
            let yesTitle = findButtonNames(inThis: dataToReloadThisTable[indexPath.row]).yesButton
            let noTitle = findButtonNames(inThis: dataToReloadThisTable[indexPath.row]).noButton
            cell.yesButtonM.setTitle(yesTitle, for: .normal)
            cell.noButtonM.setTitle(noTitle, for: .normal)
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
            cell.textLabel?.text = dataToReloadThisTable[indexPath.row]
            return cell
        }
    }
    
    @IBAction func yesButton(_ sender: UIButton) {
        dataToReloadThisTable.append("___________")
        for i in 0...yesArray.count - 1 {
            dataToReloadThisTable.append(yesArray[i])
        }
    }
    
    @IBAction func noButton(_ sender: UIButton) {
        dataToReloadThisTable.append("___________")
        for i in 0...noArray.count - 1 {
            dataToReloadThisTable.append(noArray[i])
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.mainTableView.delegate = self
        self.mainTableView.dataSource = self
        self.dataToReloadThisTable = enteryDataToThisPage
        StoryDataProvider.sharedObject
        
    }
    
    func autoScroll(toWhere: Int) {
        let item = IndexPath.init(row: toWhere, section: 0)
        self.mainTableView.scrollToRow(at: item, at: UITableView.ScrollPosition.bottom, animated: true)
        
    }
    
    func findButtonNames(inThis: String ) -> (yesButton: String, noButton: String) {
    let input = Array(inThis)
    print(input)
    var positionOfFirstStarts = [Int]()
    var positionOfFirstEnds = [Int]()
    
    for i in 0...input.count - 1 {
    if input[i] == "[" {
    positionOfFirstStarts.append(i)
    }
    if input[i] == "]" {
    positionOfFirstEnds.append(i)
    }
    }
    
    var returner : (yesButton: String, noButton: String) = (yesButton: "", noButton: "")
    print("Starts: \t\(positionOfFirstStarts)")
    print("Ends: \t\(positionOfFirstEnds)")
    
    for i in positionOfFirstStarts[0]+1...positionOfFirstEnds[0]-1 {
    returner.yesButton.append(input[i])
    }
    for i in positionOfFirstStarts[1]+1...positionOfFirstEnds[1]-1 {
    returner.noButton.append(input[i])
    }
    return returner
    }
    
}

