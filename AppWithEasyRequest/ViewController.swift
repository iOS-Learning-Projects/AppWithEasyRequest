//
//  ViewController.swift
//  AppWithEasyRequest
//
//  Created by Eduardo Vital Alencar Cunha on 19/06/17.
//  Copyright © 2017 BEPiD. All rights reserved.
//

import UIKit
import EasyRequest

class ViewController: UIViewController {
    @IBOutlet weak var getErrorButton: UIButton!
    @IBOutlet weak var getOkButton: UIButton!
    @IBOutlet weak var bodyTextView: UITextView!

    override func viewDidLoad() {
        super.viewDidLoad()

        let server = EasyRequest(baseUrl: "localhost:3000")

        server.delegate = self

        var params = [[String: String]]()
        params.append(["id":"2"])


        server.executeRequest(to: "/ok", withParameters: params, usingMethod: .get, andSpecificHeaders: [], sendingBody: nil)

        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension ViewController: EasyRequestDelegate {

    func delegateEasyRequestSuccess(body: Data?, headers: [AnyHashable : Any], status: Int) {
        self.bodyTextView.text = body as! String
    }

    func delegateEasyRequestError(error: Error) {

    }
}

