//
//  buildmanager.swift
//

import Foundation

guard CommandLine.argc > 0 else { exit(1) }

let action = CommandLine.arguments[1]

switch action {
    case "--increment":
        guard CommandLine.argc >= 3 else { exit(1) }
        let arg1 = CommandLine.arguments[2]
        let value = (UserDefaults.standard.object(forKey: arg1) as? Int ?? 0) + 1
        UserDefaults.standard.set(value, forKey: arg1)
        UserDefaults.standard.synchronize()
        print(value)
        break
    case "--reset":
        guard CommandLine.argc >= 3 else { exit(1) }
        let arg1 = CommandLine.arguments[2]
        UserDefaults.standard.removeObject(forKey: arg1)
        UserDefaults.standard.synchronize()
        break
    case "--get":
        guard CommandLine.argc >= 3 else { exit(1) }
        let arg1 = CommandLine.arguments[2]
        print(UserDefaults.standard.integer(forKey: arg1))
        break
    case "--set":
        guard CommandLine.argc >= 4 else { exit(1) }
        let arg1 = CommandLine.arguments[2]
        let arg2 = CommandLine.arguments[3]
        UserDefaults.standard.set(Int(arg2), forKey: arg1)
        UserDefaults.standard.synchronize()
        break
    default:
        exit(1)
}
