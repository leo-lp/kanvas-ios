//
// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at https://mozilla.org/MPL/2.0/.
//

import Foundation
import UIKit

/// Protocol for confirming the media drawer
protocol MediaDrawerControllerDelegate: class {
    func didDismissMediaDrawer()
}

/// Constants for MediaDrawerController
private struct Constants {
    static let animationDuration: TimeInterval = 0.25
}

/// A view controller that contains the text tools menu
final class MediaDrawerController: UIViewController, UITabBarControllerDelegate, MediaDrawerViewDelegate, StickerCollectionControllerDelegate {
    
    weak var mediaDrawerDelegate: MediaDrawerControllerDelegate?
    
    private lazy var stickerCollectionController: StickerCollectionController = {
        let controller = StickerCollectionController()
        controller.delegate = self
        return controller
    }()
    
    private lazy var mediaDrawerView: MediaDrawerView = {
        let view = MediaDrawerView()
        view.delegate = self
        return view
    }()
    
    // MARK: - Initializers
    
    init() {
        super.init(nibName: .none, bundle: .none)
    }
    
    @available(*, unavailable, message: "use init(settings:, segments:) instead")
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @available(*, unavailable, message: "use init(settings:, segments:) instead")
    public override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        fatalError("init(nibName:bundle:) has not been implemented")
    }
    
    // MARK: - View life cycle
    
    override func loadView() {
        view = mediaDrawerView
    }
    
    override public func viewDidLoad() {
        super.viewDidLoad()
        setUpView()
        
        load(childViewController: stickerCollectionController, into: mediaDrawerView.childContainer)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        mediaDrawerDelegate?.didDismissMediaDrawer()
    }
    
    // MARK: - Layout
    
    private func setUpView() {
        
    }
    
    // MARK: - StickerCollectionControllerDelegate
    
    func didSelectSticker(_ sticker: Sticker) {
        
    }
}
