import SwiftUI

struct ContentView: View {
    @ObservedObject var taskManager = TaskManager()
    @State private var showAddTaskView = false
    @State private var isDarkMode = false

    var body: some View {
        NavigationView {
            List {
                ForEach(taskManager.tasks) { task in
                    NavigationLink(destination: TaskFormView(taskManager: taskManager, task: task)) {
                        TaskRowView(task: task)
                    }
                }
                .onDelete { indexSet in
                    indexSet.forEach { index in
                        let task = taskManager.tasks[index]
                        taskManager.deleteTask(task: task)
                    }
                }
            }
            .navigationTitle("TaskCrafter")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button(action: {
                        isDarkMode.toggle()
                    }) {
                        Image(systemName: isDarkMode ? "sun.max.fill" : "moon.fill")
                    }
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: { showAddTaskView = true }) {
                        Image(systemName: "plus")
                    }
                }
            }
            .sheet(isPresented: $showAddTaskView) {
                TaskFormView(taskManager: taskManager, task: Task(title: "", description: "", dueDate: Date(), priority: .medium, isCompleted: false)) // Pass a new task
            }
        }
        .environment(\.colorScheme, isDarkMode ? .dark : .light)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
