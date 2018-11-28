//
//  ViewController.swift
//  CoreDataSaveString
//
//  Created by admin on 11/24/18.
//  Copyright © 2018 admin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBAction func saveAction(_ sender: UIBarButtonItem) {
        guard textField.text != "" else {
            return
        }
        let context = Entity(context: AppDelegate.context)
        context.name = textField.text
        AppDelegate.saveContext()
    }
    @IBOutlet weak var textField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let entity = try? AppDelegate.context.fetch(Entity.fetchRequest()) as? [Entity] {
            textField.text = entity?.last?.name
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

