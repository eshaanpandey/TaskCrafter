import SwiftUI

struct TaskListView: View {
    @EnvironmentObject var taskManager: TaskManager
    @State private var isDarkMode = false
    @State private var showAddTaskView = false // To show the Add Task View

    var body: some View {
        NavigationView {
            VStack {
                // Light/Dark mode toggle
                Toggle(isOn: $isDarkMode) {
                    Text(isDarkMode ? "Switch to Light Mode" : "Switch to Dark Mode")
                        .font(.headline)
                }
                .padding()

                List {
                    ForEach(taskManager.tasks) { task in
                        NavigationLink(destination: TaskDetailView(task: task)) {
                            TaskRowView(task: task) // Display the task row
                        }
                    }
                    .onDelete(perform: taskManager.deleteTask) // Handle task deletion
                }
                .navigationTitle("Tasks")
                .toolbar {
                    // Add Task button
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button(action: {
                            showAddTaskView = true // Show the Add Task sheet
                        }) {
                            Text("Add Task")
                        }
                    }
                }
            }
            .preferredColorScheme(isDarkMode ? .dark : .light) // Light/Dark mode toggle
            .sheet(isPresented: $showAddTaskView) {
                TaskFormView(taskManager: taskManager, task: Task(title: "", description: "", dueDate: Date(), priority: .medium, isCompleted: false)) // Create a new task when adding
            }
        }
    }
}
