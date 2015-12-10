//
// Bool.swift
//
// Created by Mike Henson on 12/9/2015.
// Copyright © 2015 Mike Henson. All rights reserved.
//

// Self-documenting helper method to avoid typing and note the purpose of the
//  dispatched block.
//
public func dispatch_async_ui(block:()->Void) {
    // If we explicitly want async scheduling, it doesn't matter if we're already
    // on the main queue.
    dispatch_async(dispatch_get_main_queue(), block)
}

public func dispatch_sync_ui(block:()->Void) {
    dispatch_sync(dispatch_get_main_queue(), block)
}
