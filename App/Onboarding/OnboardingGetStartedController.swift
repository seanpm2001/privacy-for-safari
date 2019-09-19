//
//  OnboardingGetStartedController.swift
//  DuckDuckGo Privacy Essentials
//
//
//  Copyright © 2019 DuckDuckGo. All rights reserved.
//
//  Licensed under the Apache License, Version 2.0 (the "License");
//  you may not use this file except in compliance with the License.
//  You may obtain a copy of the License at
//
//  http://www.apache.org/licenses/LICENSE-2.0
//
//  Unless required by applicable law or agreed to in writing, software
//  distributed under the License is distributed on an "AS IS" BASIS,
//  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
//  See the License for the specific language governing permissions and
//  limitations under the License.
//

import AppKit
import Statistics

class OnboardingGetStartedController: OnboardingScreen {
    
    @IBOutlet var versionLabel: NSTextField!

    private let pixel = Dependencies.shared.pixel
    private let slideShownPixel = FireOncePixel(pixel: Dependencies.shared.pixel, pixelName: .onboardingGetStartedShown)

    override func viewDidLoad() {
        super.viewDidLoad()
        versionLabel.attributedStringValue = Utils.versionLabelAttributedString()
    }
    
    override func viewDidAppear() {
        super.viewDidAppear()
        slideShownPixel.fire()
    }
    
    @IBAction func getStarted(sender: Any) {
        pixel.fire(PixelName.onboardingGetStartedPressed)
        delegate?.navigateForward(self)
    }
    
}
