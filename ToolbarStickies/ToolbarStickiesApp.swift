//
//  ToolbarStickiesApp.swift
//  ToolbarStickies
//
//  Created by Aniruddha Deb on 05/11/23.
//

import SwiftUI

@main
struct ToolbarStickiesApp: App {
    
    @AppStorage("showMenuBarExtra") private var showMenuBarExtra = true
    @State private var notes = ""

    var body: some Scene {
        MenuBarExtra(
            "App Menu Bar Extra", systemImage: "pencil",
            isInserted: $showMenuBarExtra)
        {
            VStack {
                Spacer();
                TextEditor(text: $notes).font(.custom("menlo", size: 12));
                HStack(spacing: 50){
                    Button("save") {
                        let dialog = NSSavePanel()
                        let result = dialog.runModal()
                        
                        if result == .OK {
                            let url = dialog.url!
                            try! self.notes.write(to: url, atomically: true, encoding: .utf8)
                        }
                    }.buttonStyle(PlainButtonStyle()).keyboardShortcut("s", modifiers: .command) ;
                    Button("clear") {
                        self.notes = ""
                    }.buttonStyle(PlainButtonStyle()).foregroundColor(.white).keyboardShortcut("w", modifiers: .command) ;
                    Button("quit") {
                        NSApp.terminate(nil)
                    }.buttonStyle(PlainButtonStyle()).foregroundColor(.white).keyboardShortcut("q", modifiers: .command)
                }
                Spacer();
            }.frame(width: 300, height: 300)
        }
        .menuBarExtraStyle(.window)
    }
}
