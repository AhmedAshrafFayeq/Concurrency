//
//  ViewController.swift
//  Concurreny_Async-Sync
//
//  Created by Ahmed Fayek on 17/06/2023.
//

import UIKit
import Foundation

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
//        createAsyncThread()
//        shouldBackToMainThread()
        workWithAsyncAfter()
    }

    
    
    //it means that the thread is gonna work concurrently
    func createAsyncThread() {
        DispatchQueue.global().async {
          for i in 0...10 {
            Thread.sleep(forTimeInterval: 1)
            let res = repeatElement("***", count: i)
            print(res.joined())
          }
        }
        print("Finished")
    }
    
    
    
    func shouldBackToMainThread() {
        DispatchQueue.global().async {

          for i in 0...10 {

            Thread.sleep(forTimeInterval: 0.5)

            let res = repeatElement("***", count: i)

            print(res.joined())

          }

           

          DispatchQueue.main.async {
              print("Current thread is", Thread.current)
              print("Hello from main thread ")

          }

        }
        print("Finished")
    }
    
    func workWithAsyncAfter() {
        // Global Queue (Background Threads)
        DispatchQueue.global().asyncAfter(deadline: .now() + 2) {

            print("Hello after 2 seconds")

        }

        // MainQueue (Main Thread)
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {

            print("Hello after 2 seconds")

        }

        // Custom Queue (Background Threads) will explain later in next article
        DispatchQueue(label: "com.fayeq.ahmed").asyncAfter(deadline: .now() + 2) {

            print("Hello after 2 seconds")
            print("Current thread is", Thread.current)

        }

    }
    

}

