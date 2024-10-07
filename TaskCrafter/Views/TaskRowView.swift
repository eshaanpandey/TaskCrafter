import SwiftUI

struct TaskRowView: View {
    var task: Task
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(task.title)
                    .font(.headline)
                    .strikethrough(task.isCompleted, color: .gray)
            }
            Spacer()
            Text(task.dueDate, style: .date)
                .font(.caption)
            Text(task.priority.rawValue.capitalized)
                .foregroundColor(priorityColor(for: task.priority))
                .padding(4)
                .background(priorityBackgroundColor(for: task.priority))
                .cornerRadius(5)
            
            if task.isCompleted {
                Image(systemName: "checkmark.circle.fill")
                    .foregroundColor(.green)
            } else {
                Image(systemName: "circle")
                    .foregroundColor(.gray)
            }
        }
        .padding()
        .onTapGesture {
            var updatedTask = task
            updatedTask.isCompleted.toggle()
        }
    }


    private func priorityColor(for priority: PriorityLevel) -> Color {
        switch priority {
        case .low:
            return .green
        case .medium:
            return .yellow
        case .high:
            return .red
        }
    }
    
    private func priorityBackgroundColor(for priority: PriorityLevel) -> Color {
        switch priority {
        case .low:
            return Color.green.opacity(0.2)
        case .medium:
            return Color.yellow.opacity(0.2)
        case .high:
            return Color.red.opacity(0.2)
        }
    }
}

//struct TaskRowView_Previews: PreviewProvider {
//    static var previews: some View {
//        // Create a mock TaskManager and add a sample task
//        let mockTaskManager = TaskManager()
//        mockTaskManager.tasks = [
//            Task(title: "Sample Task", description: "This is a sample task", dueDate: Date(), priority: .medium, isCompleted: false)
//        ]
//        
//        return TaskRowView(task: mockTaskManager.tasks[0])
//            .environmentObject(mockTaskManager) // Inject the mock TaskManager
//    }
//}
