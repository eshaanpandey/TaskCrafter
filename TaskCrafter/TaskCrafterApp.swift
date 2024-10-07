import SwiftUI

@main
struct TaskCrafterApp: App {
    @StateObject var taskManager = TaskManager()

    var body: some Scene {
        WindowGroup {
            TaskListView()
                .environmentObject(taskManager)
        }
    }
}
