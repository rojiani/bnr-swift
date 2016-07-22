//
//  ViewController.swift
//  VocalTextEdit
//
//  Created by Rojiani, Navid on 7/18/16.
//  Copyright © 2016 Rojiani, Navid. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {

    let speechSynthesizer = NSSpeechSynthesizer()

    weak var delegate: NSSpeechSynthesizerDelegate?

    @IBOutlet var textView: NSTextView!
    @IBOutlet var speakButton: NSButton!
    @IBOutlet var stopButton: NSButton!
    @IBOutlet var progressIndicator: NSProgressIndicator!

    var contents: String? {
        get { return textView.string }
        set { textView.string = newValue }
    }

    var contentsLength: Double { return Double(contents?.characters.count ?? 0) }

    let emptyDocumentAnimationLength = Double("The document is empty.".characters.count)

    var documentEmpty: Bool {
        return self.contents?.isEmpty ?? true
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.speechSynthesizer.delegate = self
        setInititalButtonAndIndicatorStates()
        setProgressIndicatorAppearance()
    }

    @IBAction func speakButtonClicked(sender: NSButton) {
        if let enteredText = self.contents where !enteredText.isEmpty {
            speechSynthesizer.startSpeakingString(enteredText)
            swapSpeakButtonAndProgressIndicator()
            toggleSpeakButtonAndStopButtonEnabled()
            startProgressAnimation()
        } else {
            speechSynthesizer.startSpeakingString("The document is empty.")
            swapSpeakButtonAndProgressIndicator()
            toggleSpeakButtonAndStopButtonEnabled()
            startProgressAnimation()
        }
    }

    @IBAction func stopButtonClicked(sender: NSButton) {
        speechSynthesizer.stopSpeaking()
    }

}

// MARK: Buttons & Progress Indicator
extension ViewController {

    private func setInititalButtonAndIndicatorStates() {
        speakButton.enabled = true
        stopButton.enabled = false
        progressIndicator.hidden = true
    }


    private func toggleSpeakButtonAndStopButtonEnabled() {
        speakButton.enabled = !speakButton.enabled
        stopButton.enabled = !stopButton.enabled
    }


    private func swapSpeakButtonAndProgressIndicator() {
        speakButton.hidden = !speakButton.hidden
        progressIndicator.hidden = !progressIndicator.hidden
    }

    private func setProgressIndicatorAppearance() {
        progressIndicator.style = NSProgressIndicatorStyle.SpinningStyle
        progressIndicator.indeterminate = false
        progressIndicator.displayedWhenStopped = false
        progressIndicator.bezeled = false
    }

    private func startProgressAnimation() {
        progressIndicator.minValue = 0
        progressIndicator.maxValue = documentEmpty ? emptyDocumentAnimationLength : contentsLength

        progressIndicator.startAnimation(nil)
    }

    private func stopProgressAnimation() {
        progressIndicator.incrementBy(-contentsLength)
        progressIndicator.stopAnimation(nil)
    }

}


extension ViewController: NSSpeechSynthesizerDelegate {

    func speechSynthesizer(sender: NSSpeechSynthesizer, willSpeakWord characterRange: NSRange, ofString string: String) {
        progressIndicator.incrementBy(Double(characterRange.length + 1))
    }

    func speechSynthesizer(sender: NSSpeechSynthesizer, didFinishSpeaking finishedSpeaking: Bool) {
        stopProgressAnimation()
        toggleSpeakButtonAndStopButtonEnabled()
        swapSpeakButtonAndProgressIndicator()
    }
}
