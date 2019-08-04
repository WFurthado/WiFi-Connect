//
//  ViewController.swift
//  WiFiConnect
//
//  Created by Wilfred Furthado M on 06/05/19.
//  Copyright © 2019 Pervacio. All rights reserved.
//

import UIKit
import NetworkExtension

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Add SSID AND PASSWORD BELOW
        let hotspotConfig = NEHotspotConfiguration(ssid: "", passphrase: "", isWEP: false)

        hotspotConfig.joinOnce = false
        NEHotspotConfigurationManager.shared.apply(hotspotConfig) {[unowned self] (error) in
            if let error = error {
                print("error = ",error)
                self.perform(#selector(self.removeProfile), with: nil, afterDelay: 10.0)

            }
            else {
                print("Success!")
                self.perform(#selector(self.removeProfile), with: nil, afterDelay: 10.0)
            }
        }
    }


    @objc func removeProfile() {
        print("Removing!")

        NEHotspotConfigurationManager.shared.removeConfiguration(forSSID: "PVCO_Robotics")
    }
}

