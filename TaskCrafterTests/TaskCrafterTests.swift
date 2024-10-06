import XCTest
@testable import TaskCrafter 

class TaskManagerTests: XCTestCase {
    var taskManager: TaskManager!

    override func setUp() {
        super.setUp()
        taskManager = TaskManager()
        taskManager.tasks = [] // Reset tasks before each test
    }

    override func tearDown() {
        taskManager = nil
        super.tearDown()
    }

    // Test adding a task
    func testAddTask() {
        let initialCount = taskManager.tasks.count
        let newTask = Task(title: "Test Task", description: "This is a test task.", dueDate: Date(), priority: .medium, isCompleted: false)
        
        taskManager.addTask(task: newTask)
        
        XCTAssertEqual(taskManager.tasks.count, initialCount + 1)
        XCTAssertEqual(taskManager.tasks.last?.title, "Test Task")
    }

    // Test deleting a task
    func testDeleteTask() {
        let taskToDelete = Task(title: "Task to Delete", description: "This task will be deleted.", dueDate: Date(), priority: .low, isCompleted: false)
        taskManager.addTask(task: taskToDelete)

        let initialCount = taskManager.tasks.count
        taskManager.deleteTask(task: taskToDelete)
        
        XCTAssertEqual(taskManager.tasks.count, initialCount - 1)
        XCTAssertFalse(taskManager.tasks.contains(where: { $0.id == taskToDelete.id }))
    }

    // Test updating a task
    func testUpdateTask() {
        let taskToUpdate = Task(title: "Old Title", description: "Old description.", dueDate: Date(), priority: .low, isCompleted: false)
        taskManager.addTask(task: taskToUpdate)
        
        // Create an updated task instance with the same ID
        var updatedTask = taskToUpdate
        updatedTask.title = "New Title"
        updatedTask.description = "New description."
        updatedTask.priority = .high
        updatedTask.isCompleted = true
        
        taskManager.updateTask(updatedTask: updatedTask)

        // Check that the task was updated
        if let updatedTaskInManager = taskManager.tasks.first(where: { $0.id == taskToUpdate.id }) {
            XCTAssertEqual(updatedTaskInManager.title, "New Title")
            XCTAssertEqual(updatedTaskInManager.description, "New description.")
            XCTAssertEqual(updatedTaskInManager.priority, .high)
            XCTAssertTrue(updatedTaskInManager.isCompleted)
        } else {
            XCTFail("Updated task not found in task manager")
        }
    }

    // Test loading tasks
    func testLoadTasks() {
        let task1 = Task(title: "Task 1", description: "First task", dueDate: Date(), priority: .high, isCompleted: false)
        let task2 = Task(title: "Task 2", description: "Second task", dueDate: Date(), priority: .medium, isCompleted: true)

        // Manually saving tasks to UserDefaults
        taskManager.addTask(task: task1)
        taskManager.addTask(task: task2)

        // Create a new TaskManager instance to simulate loading from UserDefaults
        let newTaskManager = TaskManager()

        // Check if tasks are loaded correctly
        XCTAssertEqual(newTaskManager.tasks.count, 2)
        XCTAssertTrue(newTaskManager.tasks.contains(where: { $0.title == "Task 1" }))
        XCTAssertTrue(newTaskManager.tasks.contains(where: { $0.title == "Task 2" }))
    }
}
