//
//  ViewController.swift
//  Concurrency
//
//  Created by Ahmed Fayek on 10/06/2023.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

        
    }
}


func createDifferentThreadsType() {
    
    //third priority
    DispatchQueue.global(qos: .utility).async {
        Thread.sleep(forTimeInterval: 1)
        print("Current Thread is ", Thread.current)
        print("Doing some utility work ⛈️")
        print("----------------------------------------------")
    }
    
    //lowest priority
    DispatchQueue.global(qos: .background).async {
        Thread.sleep(forTimeInterval: 1)
        print("Current Thread is ", Thread.current)
        print("Doing some background work 🚧")
        print("----------------------------------------------")
    }
    
    //second priority
    DispatchQueue.global(qos: .userInitiated).async {
        Thread.sleep(forTimeInterval: 1)
        print("Current Thread is ", Thread.current)
        print("Doing some Initiated work 🤨")
        print("----------------------------------------------")
    }
    
    //first priority
    DispatchQueue.global(qos: .userInteractive).async {
        Thread.sleep(forTimeInterval: 1)
        print("Current Thread is ", Thread.current)
        print("Doing an Interactive task 😎")
        print("----------------------------------------------")
    }
    
    // Custom thread
    DispatchQueue(label: "com.fayeq.concrrency", qos: .userInteractive).async {
      Thread.sleep(forTimeInterval: 1)
      print("Current Thread is ", Thread.current)
      print("Doing some userInterActive work 😎")
      print("----------------------------------------------")
    }
}
