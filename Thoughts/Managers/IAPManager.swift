//
//  IAPManager.swift
//  Thoughts
//
//  Created by Giorgi Meqvabishvili on 23.05.23.
//

//f6cd7c0d69bf460283cf33286c3bd1fb


import Foundation

final class IAPManager {
    static let shared = IAPManager()

    static let formatter = ISO8601DateFormatter()

    private var postEligibleViewDate: Date? {
        get {
            guard let string = UserDefaults.standard.string(forKey: "postEligibleViewDate") else {
                return nil
            }
            return IAPManager.formatter.date(from: string)
        }
        set {
            guard let date = newValue else {
                return
            }
            let string = IAPManager.formatter.string(from: date)
            UserDefaults.standard.set(string, forKey: "postEligibleViewDate")
        }
    }

    private init() {}

    func isPremium() -> Bool {
        return UserDefaults.standard.bool(forKey: "premium")
    }

    public func getSubscriptionStatus(completion: ((Bool) -> Void)?) {
        let status = isPremium()
        completion?(status)
    }

    public func fetchPackages(completion: @escaping (Any?) -> Void) {
        // Not applicable for this version without purchase functionality
        completion(nil)
    }

    public func subscribe(
        package: Any,
        completion: @escaping (Bool) -> Void
    ) {
        // Not applicable for this version without purchase functionality
        completion(false)
    }

    public func restorePurchases(completion: @escaping (Bool) -> Void) {
        // Not applicable for this version without purchase functionality
        completion(false)
    }
}

// MARK: - Track Post Views

extension IAPManager {
    var canViewPost: Bool {
        if isPremium() {
            return true
        }

        guard let date = postEligibleViewDate else {
            return true
        }
        UserDefaults.standard.set(0, forKey: "post_views")
        return Date() >= date
    }

    public func logPostViewed() {
        let total = UserDefaults.standard.integer(forKey: "post_views")
        UserDefaults.standard.set(total + 1, forKey: "post_views")

        if total == 2 {
            let hour: TimeInterval = 60 * 60
            postEligibleViewDate = Date().addingTimeInterval(hour * 24)
        }
    }
}
