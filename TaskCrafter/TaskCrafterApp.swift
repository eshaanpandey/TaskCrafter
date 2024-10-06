import SwiftUI

@main
struct TaskCrafterApp: App {
    @StateObject var taskManager = TaskManager()

    var body: some Scene {
        WindowGroup {
            TaskListView()
                .environmentObject(taskManager) // Inject the taskManager into the environment
        }
    }
}
