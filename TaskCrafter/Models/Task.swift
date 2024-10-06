import Foundation

// Enum to define task priority levels
enum PriorityLevel: String, CaseIterable, Identifiable, Codable {
    case low, medium, high
    var id: String { self.rawValue }
}

// Task model
struct Task: Identifiable, Codable {
    var id = UUID()
    var title: String
    var description: String
    var dueDate: Date
    var priority: PriorityLevel
    var isCompleted: Bool
}
