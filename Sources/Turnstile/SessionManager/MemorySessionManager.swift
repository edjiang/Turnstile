//
//  MemorySessionManager.swift
//  VaporTurnstile
//
//  Created by Edward Jiang on 7/26/16.
//
//

import TurnstileCrypto

/**
 MemorySessionManager manages sessions in-memory and is great for development
 purposes.
 */
public class MemorySessionManager: SessionManager {
    /// Dictionary of sessions
    private var sessions = [String: User]()
    
    /// Initializes the Session Manager. No config needed!
    public init() {}
    
    /// Gets the user for the current session identifier.
    public func getUser(identifier: String) -> User? {
        return sessions[identifier]
    }
    
    /// Creates a session for a given User object and returns the identifier.
    public func createSession(user: User) -> String {
        // TODO: Use a 128 bit session ID (base64/62 encoded)
        let random: Random = URandom()
        
        let identifier = String(random.int64)
        sessions[identifier] = user
        return identifier
    }
    
    /// Deletes the session for a session identifier. 
    public func deleteSession(identifier: String) {
        sessions.removeValue(forKey: identifier)
    }
}