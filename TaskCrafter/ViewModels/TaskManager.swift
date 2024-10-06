import Foundation

class TaskManager: ObservableObject {
    @Published var tasks: [Task] = []
    
    init() {
        loadTasks()
    }

    // Save tasks to UserDefaults (for data persistence)
    func saveTasks() {
        if let encoded = try? JSONEncoder().encode(tasks) {
            UserDefaults.standard.set(encoded, forKey: "tasks")
        }
    }

    // Load tasks from UserDefaults
    func loadTasks() {
        if let savedData = UserDefaults.standard.data(forKey: "tasks"),
           let decodedTasks = try? JSONDecoder().decode([Task].self, from: savedData) {
            tasks = decodedTasks
        }
    }

    // Add a new task
    func addTask(task: Task) {
        tasks.append(task)
        saveTasks()
    }

    // Delete a task
    func deleteTask(task: Task) {
        tasks.removeAll { $0.id == task.id }
        saveTasks()
    }

    // Update an existing task
    func updateTask(updatedTask: Task) {
        if let index = tasks.firstIndex(where: { $0.id == updatedTask.id }) {
            tasks[index] = updatedTask
            saveTasks()
        }
    }
    
    func deleteTask(at offsets: IndexSet) {
        tasks.remove(atOffsets: offsets)
    }
}
