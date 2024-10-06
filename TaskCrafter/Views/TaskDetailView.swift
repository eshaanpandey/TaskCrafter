import SwiftUI

struct TaskDetailView: View {
    var task: Task

    var body: some View {
        VStack {
            Text(task.title)
                .font(.largeTitle)
            Text(task.description)
            Text("Due: \(task.dueDate, style: .date)")
            Text("Priority: \(task.priority.rawValue.capitalized)")
            Text(task.isCompleted ? "Completed" : "Not Completed")
        }
        .navigationTitle(task.title)
    }
}
