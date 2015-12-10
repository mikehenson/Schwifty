//
// Bool.swift
//
// Created by Mike Henson on 12/9/2015.
// Copyright © 2015 Mike Henson. All rights reserved.
//

// Self-documenting helper method to avoid typing and note the purpose of the
//  dispatched block.
//
func dispatch_async_ui(block:()->Void) {
  // If we explicitly want async scheduling, it doesn't matter if we're already
  // on the main queue.
  dispatch_async(dispatch_get_main_queue(), block)
}

func dispatch_sync_ui(block:()->Void) {
  // If we explicitly want sync scheduling, we shouldn't dispatch if we don't
  // need to.
  if current_queue_is_main_queue() {
    block()
  } else {
    dispatch_sync(dispatch_get_main_queue(), block)
  }
}

// Debugging helpers for async code
func assert_main_queue() {
  assert(dispatch_get_current_queue() == dispatch_get_main_queue(),
         "Context reached from a non-main queue")
}

// Shorten the check with a more descriptive name
func current_queue_is_main_queue() -> Bool {
  return dispatch_get_current_queue() == dispatch_get_main_queue()
}

