//
//  ListViewController.swift
//  UITableViewSample01_UITableViewRowAction
//
//  Created by shigeki yamamoto on 2019/04/29.
//  Copyright © 2019 shigeki yamamoto. All rights reserved.
//

import UIKit

class ListViewController: UIViewController {

    @IBOutlet var tableViewList: UITableView!
    
    // データ
    var list: [Line] = [Line]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // table
        tableViewList.register(UINib(nibName: "CustomTableViewCell", bundle: nil), forCellReuseIdentifier: "CustomCell")
        tableViewList.delegate = self
        tableViewList.dataSource = self
        
        // navigation
        navigationItem.rightBarButtonItem = editButtonItem
        
        // init
        if (list.count < 1) {
            addListRandom(number: 5)
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        tableViewList.reloadData()
    }
    
    override func setEditing(_ editing: Bool, animated: Bool) {
        super.setEditing(editing, animated: animated)
        tableViewList.isEditing = editing
    }
    
}

extension ListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let deleteAction = UITableViewRowAction(style: .default, title: "削除") { action, index in
            self.tapDeleteAction(index: index)
        }
        let checkAction = UITableViewRowAction(style: .default, title: "チェック") { action, index in
            self.tapCheckAction(index: index)
        }
        let invalidAction = UITableViewRowAction(style: .default, title: "無効") { action, index in
            self.tapInvalidAction(index: index)
        }

        deleteAction.backgroundColor = .red
        checkAction.backgroundColor = .blue
        invalidAction.backgroundColor = .gray

        return [deleteAction, checkAction, invalidAction]
    }
    
    func tapDeleteAction(index: IndexPath) -> Void{
        // 削除処理の記述
        list.remove(at: index.row)
        tableViewList.deleteRows(at: [index], with: .automatic)
    }

    func tapCheckAction(index: IndexPath) -> Void{
        // チェック処理の記述
        let isCheckCurrent = list[index.row].isCheck
        list[index.row].isCheck = (isCheckCurrent) ? false : true
        tableViewList.reloadData()
    }
    
    func tapInvalidAction(index: IndexPath) -> Void{
        // 無効化処理の記述(本アプリでは背景色を灰色にするのみ。有効化する手段も実装していない)
        list[index.row].isValid = false
        tableViewList.reloadData()
    }

}

extension ListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CustomCell", for: indexPath) as! CustomTableViewCell
        let line = list[indexPath.row] as! Line
        cell.labelTitle.text = line.str
        cell.imageCheck.isHidden = true
        if (line.isCheck) {
            cell.imageCheck.isHidden = false
        }
        if (!line.isValid) {
            cell.backgroundColor = .gray
        }
        return cell
    }
    
}

extension ListViewController: ListMakeDelegate {
    func addListRandom(number: Int) -> Void{
        // ランダムな文字列を指定の数だけ追加する
        for i in 0 ..< number {
            // 長さ12の文字列を取得
            let str = randomString(length:12)
            var line = Line(str: str, isCheck: false)
            list.append(line)
        }
    }
    
    func randomString(length: Int) -> String {
        let letters : NSString = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
        let len = UInt32(letters.length)
        var str = ""
        for _ in 0 ..< length {
            let rand = arc4random_uniform(len)
            var nextChar = letters.character(at: Int(rand))
            str += NSString(characters: &nextChar, length: 1) as String
        }
        return str
    }
}
