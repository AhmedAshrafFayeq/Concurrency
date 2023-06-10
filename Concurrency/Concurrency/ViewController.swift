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
        
//        createDifferentThreadsType()
//        createDispatchGroupWithEnterAndLeave()
        createQueusAssignedToSpecificDispatchGroup()
        
    }
}

func createQueusAssignedToSpecificDispatchGroup() {
    let group = DispatchGroup()
    
    DispatchQueue.global(qos: .userInitiated).async(group: group) {
      print("Current Thread is ", Thread.current)
      print("Doing some userInitiated work 🤨")
     }
    
    DispatchQueue.global(qos: .userInitiated).async(group: group) {
        print("Current Thread is ", Thread.current)
        print("Doing some userInitiated work ⚡️")
    }
    
    group.notify(queue: DispatchQueue.main) {
        print("finished")
    }

}

func createDispatchGroupWithEnterAndLeave() {
    let group = DispatchGroup()
    
    group.enter()
    DispatchQueue.global(qos: .userInteractive).async {
        print("Current Thread is ", Thread.current)
        print("Hello From first entered queue 🌝")
        print("----------------------------------------------")
        group.leave()
    }
    
    group.enter()
    DispatchQueue.global(qos: .userInteractive).async {
        print("Current Thread is ", Thread.current)
        print("Hello From second entered queue 🌚")
        print("----------------------------------------------")
        group.leave()
    }
    
    group.notify(queue: DispatchQueue.main) {
       print("All tasks completed")
      // Do the work here
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
