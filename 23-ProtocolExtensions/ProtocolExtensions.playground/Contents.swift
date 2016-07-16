import Cocoa


protocol ExerciseType: CustomStringConvertible {
    var name: String { get }
    var caloriesBurned: Double { get }
    var minutes: Double { get }
    var title: String { get }
}

// Protocol extension
extension ExerciseType {
    // Default implementation - must be in a protocol *extension*
    var description: String {
        return "Exercise(\(name), burned \(caloriesBurned) calories in \(minutes) minutes)"
    }
}

extension ExerciseType {
    var title: String {
        return "\(name) - \(minutes) minutes"
    }
}

struct EllipticalTrainer: ExerciseType {
    let name = "Elliptical Machine"
    let title = "Go Fast Elliptical Machine 3000"
    let caloriesBurned: Double
    let minutes: Double
}

let ellipticalWorkout = EllipticalTrainer(caloriesBurned: 335,
                                          minutes: 30)

struct Treadmill: ExerciseType {
    let name = "Treadmill"
    let caloriesBurned: Double
    let minutes: Double
    
    let distanceInMiles: Double

    // Default implementation for 'description' can be overridden
    var description: String {
        return "Treadmill (\(caloriesBurned) calories and \(distanceInMiles) miles in \(minutes) minutes)"
    }
}

let runningWorkout = Treadmill(caloriesBurned: 350,
                               minutes: 25,
                               distanceInMiles: 4.2)

//
//func caloriesBurnedPerMinute<Exercise: ExerciseType>(exercise: Exercise) -> Double {
//    return exercise.caloriesBurned / exercise.minutes
//}
//print(caloriesBurnedPerMinute(ellipticalWorkout))
//print(caloriesBurnedPerMinute(runningWorkout))

// Better as a property in an extension
extension ExerciseType {
    var caloriesBurnedPerMinute: Double {
        return caloriesBurned / minutes
    }
}

print(ellipticalWorkout.caloriesBurnedPerMinute)
print(runningWorkout.caloriesBurnedPerMinute)

print(ellipticalWorkout)
print(runningWorkout)

// Enable a Sequence of Exercises to sum the total calories
extension SequenceType where Generator.Element == ExerciseType {
    func totalCaloriesBurned() -> Double {
        var total: Double = 0
        for exercise in self {
            total += exercise.caloriesBurned
        }
        return total
    }
}

let mondayWorkout: [ExerciseType] = [ellipticalWorkout, runningWorkout]
print(mondayWorkout.totalCaloriesBurned())

for exercise in mondayWorkout {
    print(exercise.title)
}

print(ellipticalWorkout.title)
