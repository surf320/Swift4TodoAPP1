//
//  AddViewController.swift
//  Swift4TodoApp1
//
//  Created by 服部　光男 on 2017/12/25.
//  Copyright © 2017年 Hattori. All rights reserved.
//

import UIKit

class AddViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet var imageView: UIImageView!

    var array = [UIImage]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        imageView.image = UIImage(named: "default.png")
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func sentaku(_ sender: Any) {
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
            // 写真を選ぶビュー
            let pickerView = UIImagePickerController()
            // 写真の選択元
            pickerView.sourceType = .photoLibrary
            pickerView.delegate = self
            self.present(pickerView, animated: true)
        }
    }
    
    // 写真を選んだ後の処理
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        // 選択した写真を取得
        let image = info[UIImagePickerControllerOriginalImage] as! UIImage
        // ビューに表示
        self.imageView.image = image
        // ビューを閉じる
        self.dismiss(animated: true)
    }
    
    
    @IBAction func add(_ sender: Any) {
        if UserDefaults.standard.object(forKey: "douga") != nil{
           array = UserDefaults.standard.object(forKey: "douga") as! [UIImage]
        }
        
        array.append(imageView.image!)
        
        UserDefaults.standard.set(array, forKey: "douga")
    self.navigationController?.popViewController(animated: true)
        
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
