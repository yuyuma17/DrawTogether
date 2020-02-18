//
//  SocketHelper.swift
//  DrawTogether
//
//  Created by 黃士軒 on 2020/2/15.
//  Copyright © 2020 Lacie. All rights reserved.
//

import SocketIO

final class SocketHelper {
    
    static let shared = SocketHelper()
    
    private var socket: SocketIOClient!
    private let manager = SocketManager(socketURL: URL(string: "http://35.236.181.110:3000/")!)
    
    private init() {
        socket = manager.defaultSocket
    }
    
    func connect() {
        socket.connect()
    }
    
    func listen(_ event: String, completion: @escaping ([Any], SocketAckEmitter ) -> Void) {
        socket.on(event, callback: completion)
    }
    
    func emit(lines: Data) {
        socket.emit("newDraw", lines)
    }
    
    func connectionStatus() -> String {
        switch socket.status {
        case .notConnected:
            return "Not Connected"
        case .disconnected:
            return "Disconnected"
        case .connecting:
            return "Connecting"
        case .connected:
            return "Connected"
        @unknown default:
            return "Not Connected"
        }
    }
}
