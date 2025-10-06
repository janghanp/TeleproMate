//
//  CustomScrollArea.swift
//  TeleproMate
//
//  Created by Jnaghan Park on 6/10/2025.
//

import Foundation
import SwiftUI
import UIKit

// Wrapper to use UIViewController in SwiftUI
struct CustomScrollAreaWrapper: UIViewControllerRepresentable {
    func makeUIViewController(context: Context) -> CustomScrollAreaController {
        return CustomScrollAreaController()
    }

    func updateUIViewController(
        _ uiViewController: CustomScrollAreaController,
        context: Context
    ) {
        // Update the view controller if needed
    }
}

class CustomScrollAreaController: UIViewController {
    let scrollView = UIScrollView()
    let toolbar = UIToolbar()
    var scrollTimer: Timer?
    var isPlaying: Bool = false
    var maxOffsetY: CGFloat = 0

    func startAutoScroll(speed: CGFloat = 5.0) {
        scrollTimer?.invalidate()
        scrollTimer = Timer.scheduledTimer(
            withTimeInterval: 0.016,
            repeats: true
        ) { [weak self] _ in
            guard let self = self else { return }

            if self.scrollView.contentOffset.y >= maxOffsetY {
                isPlaying = false
                stopAutoScroll()
                updateToolbar()
                return
            }

            let newY = self.scrollView.contentOffset.y + speed

            if newY >= maxOffsetY {
                isPlaying = false
                stopAutoScroll()
                updateToolbar()
            }

            self.scrollView.setContentOffset(
                CGPoint(x: 0, y: newY),
                animated: false
            )
        }
    }

    func stopAutoScroll() {
        scrollTimer?.invalidate()
        scrollTimer = nil
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        let contentHeight = scrollView.contentSize.height
        let visibleHeight = scrollView.bounds.height
        let max = contentHeight - visibleHeight

        maxOffsetY = max
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(scrollView)

        scrollView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(
                equalTo: view.topAnchor
            ),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])

        // Add content to scroll view
        setupContent()
        setupToolbar()
    }

    func setupContent() {
        let contentView = UIView()
        scrollView.addSubview(contentView)

        contentView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.leadingAnchor.constraint(
                equalTo: scrollView.leadingAnchor
            ),
            contentView.trailingAnchor.constraint(
                equalTo: scrollView.trailingAnchor
            ),
            contentView.bottomAnchor.constraint(
                equalTo: scrollView.bottomAnchor
            ),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),  // vertical scroll only
        ])

        // Spacer before label
        let topSpacer = UIView()
        topSpacer.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(topSpacer)
        NSLayoutConstraint.activate([
            topSpacer.topAnchor.constraint(equalTo: contentView.topAnchor),
            topSpacer.leadingAnchor.constraint(
                equalTo: contentView.leadingAnchor
            ),
            topSpacer.trailingAnchor.constraint(
                equalTo: contentView.trailingAnchor
            ),
            topSpacer.heightAnchor.constraint(equalToConstant: 300),
        ])

        // Label
        let label = UILabel()
        label.text = """
            Hello, and welcome!

            Today, we’re giving you a quick demonstration of how a teleprompter works—and how it can elevate your presentations.

            Whether you’re delivering a news report, recording a video message, or leading a live broadcast, a teleprompter helps you stay confident, clear, and on track.

            The words you see here are scrolling at a steady pace, matching the rhythm of natural speech.

            You don’t need to memorize anything, and you won’t lose your place. Just follow along with your eyes—and keep your delivery smooth.

            As you speak, remember to maintain eye contact with the camera.

            This creates a natural connection with your audience—even though you're reading from a screen.

            Need to slow down or speed up?

            No problem. The scrolling speed can be adjusted to match your speaking pace.

            With a teleprompter, your message stays sharp, professional, and easy to follow.

            Thank you for watching this demo—and happy presenting!
            """
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 30, weight: .medium)
        label.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(label)
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: topSpacer.bottomAnchor),
            label.leadingAnchor.constraint(
                equalTo: contentView.leadingAnchor,
                constant: 20
            ),
            label.trailingAnchor.constraint(
                equalTo: contentView.trailingAnchor,
                constant: -20
            ),
        ])

        // Spacer after label
        let bottomSpacer = UIView()
        bottomSpacer.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(bottomSpacer)
        NSLayoutConstraint.activate([
            bottomSpacer.topAnchor.constraint(equalTo: label.bottomAnchor),
            bottomSpacer.leadingAnchor.constraint(
                equalTo: contentView.leadingAnchor
            ),
            bottomSpacer.trailingAnchor.constraint(
                equalTo: contentView.trailingAnchor
            ),
            bottomSpacer.heightAnchor.constraint(equalToConstant: 300),
            bottomSpacer.bottomAnchor.constraint(
                equalTo: contentView.bottomAnchor
            ),  // this is critical
        ])
    }

    func setupToolbar() {
        view.addSubview(toolbar)

        toolbar.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            toolbar.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            toolbar.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            toolbar.bottomAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.bottomAnchor
            ),
        ])

        // Create buttons
        let button = UIBarButtonItem(
            barButtonSystemItem: isPlaying ? .pause : .play,
            target: self,
            action: isPlaying ? #selector(pauseTapped) : #selector(playTapped)
        )

        toolbar.items = [
            button
        ]

        updateToolbar()

    }

    func updateToolbar() {
        let button = UIBarButtonItem(
            barButtonSystemItem: isPlaying ? .pause : .play,
            target: self,
            action: isPlaying ? #selector(pauseTapped) : #selector(playTapped)
        )
        toolbar.items = [button]
    }

    @objc func playTapped() {
        isPlaying = true
        startAutoScroll()
        updateToolbar()
    }

    @objc func pauseTapped() {
        isPlaying = false
        stopAutoScroll()
        updateToolbar()
    }
}

#Preview {
    CustomScrollAreaWrapper()
        .ignoresSafeArea(.all)
}
