import SwiftUI

struct TaskFormView: View {
    @ObservedObject var taskManager: TaskManager
    @State var task: Task // Will either edit an existing task or create a new one
    @Environment(\.presentationMode) var presentationMode // To dismiss the view
    
    var body: some View {
        Form {
            TextField("Task Title", text: $task.title)
            TextField("Description", text: $task.description)
            DatePicker("Due Date", selection: $task.dueDate, displayedComponents: .date)
            Picker("Priority", selection: $task.priority) {
                ForEach(PriorityLevel.allCases, id: \.self) { priority in
                    Text(priority.rawValue.capitalized)
                }
            }
            Toggle("Completed", isOn: $task.isCompleted)

            // Save Task Button
            Button(action: {
                if let existingTaskIndex = taskManager.tasks.firstIndex(where: { $0.id == task.id }) {
                    // Update existing task
                    taskManager.tasks[existingTaskIndex] = task
                } else {
                    // Add new task
                    taskManager.tasks.append(task)
                }
                // Dismiss the sheet after saving
                presentationMode.wrappedValue.dismiss()
            }) {
                Text("Save Task")
                    .frame(maxWidth: .infinity, alignment: .center)
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(8)
            }
            
            // Delete Task Button
            if taskManager.tasks.firstIndex(where: { $0.id == task.id }) != nil {
                Button(action: {
                    taskManager.deleteTask(task: task) // Delete the task
                    presentationMode.wrappedValue.dismiss()
                }) {
                    Text("Delete Task")
                        .frame(maxWidth: .infinity, alignment: .center)
                        .padding()
                        .background(Color.red)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                }
            }
        }
        .navigationTitle(task.title.isEmpty ? "Add Task" : "Edit Task")
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
            }
        }
    }
}
