const Parse = require('parse/node');



Parse.initialize(Parse.applicationId = "ihzu049k4lkpefeqFXYxwCn6kuo7qph3scKcq1sE",javaScriptKey= "zggqV0XYpXvBSE6hYidabBVK6ulCBujgGlscMT4t", masterKey="984yh9uosBGDkVpj5bCEGdnWMSI2Kty6LXHOKkWJ");
Parse.serverURL = 'https://parseapi.back4app.com/parse';

// Define Course class
// const Course = Parse.Object.extend("Course");
// const courseSchema = new Parse.Schema("Course");
// courseSchema.addString("courseId");
// courseSchema.addString("title");
// courseSchema.addString("description");
// courseSchema.addRelation("modules", "Module");

// // Define Module class
// const Module = Parse.Object.extend("Module");
// const moduleSchema = new Parse.Schema("Module");
// moduleSchema.addString("moduleId");
// moduleSchema.addPointer("course", "Course");
// moduleSchema.addString("title");
// moduleSchema.addString("content");
// moduleSchema.addPointer("quiz", "QuizV2");
// moduleSchema.addNumber("order");

// // Define QuizV2 class
// const QuizV2 = Parse.Object.extend("QuizV2");
// const quizV2Schema = new Parse.Schema("QuizV2");
// quizV2Schema.addString("quizId");
// quizV2Schema.addPointer("module", "Module");
// quizV2Schema.addArray("questions");
// quizV2Schema.addNumber("passingScore");

// // Define QuestionV2 class
// const QuestionV2 = Parse.Object.extend("QuestionV2");
// const questionV2Schema = new Parse.Schema("QuestionV2");
// questionV2Schema.addString("questionId");
// questionV2Schema.addPointer("quiz", "QuizV2");
// questionV2Schema.addString("text");
// questionV2Schema.addArray("options");
// questionV2Schema.addString("correctAnswer");

// // Define Milestone class
// const Milestone = Parse.Object.extend("Milestone");
// const milestoneSchema = new Parse.Schema("Milestone");
// milestoneSchema.addString("milestoneId");
// milestoneSchema.addPointer("course", "Course");
// milestoneSchema.addString("title");
// milestoneSchema.addString("description");
// milestoneSchema.addArray("requiredModules");
// milestoneSchema.addNumber("rewardPoints");

// // Define UserCourseActivity class
// const UserCourseActivity = Parse.Object.extend("UserCourseActivity");
// const userCourseActivitySchema = new Parse.Schema("UserCourseActivity");
// userCourseActivitySchema.addRelation("user", "_User");
// userCourseActivitySchema.addRelation("courses", "Course");
// userCourseActivitySchema.addRelation("completedModules", "Module");
// userCourseActivitySchema.addNumber("rewardPoints");

// // Define UserProgress class
// const UserProgress = Parse.Object.extend("UserProgress");
// const userProgressSchema = new Parse.Schema("UserProgress");
// userProgressSchema.addPointer("user", "UserCourseActivity");
// userProgressSchema.addPointer("course", "Course");
// userProgressSchema.addPointer("currentModule", "Module");
// userProgressSchema.addRelation("completedModules", "Module");
// userProgressSchema.addRelation("milestonesAchieved", "Milestone");
// userProgressSchema.addNumber("rewardPoints");

// // Create the schemas
// async function createSchemas() {
//   try {
//     await courseSchema.save();
//     await moduleSchema.save();
//     await quizV2Schema.save();
//     await questionV2Schema.save();
//     await milestoneSchema.save();
//     await userCourseActivitySchema.save();
//     await userProgressSchema.save();
//     console.log("Schemas created successfully!");
//   } catch (error) {
//     console.error("Error creating schemas: ", error);
//   }
// }

// createSchemas();
// Function to create and save data
async function createSolarSystemCourse() {
    try {
      // Create Course
      const Course = Parse.Object.extend("Course");
      const solarSystemCourse = new Course();
      solarSystemCourse.set("courseId", "SOLAR_SYSTEM_101");
      solarSystemCourse.set("title", "Advanced Solar System Studies");
      solarSystemCourse.set("description", "An in-depth course on the solar system, covering celestial mechanics, planetary science, and astrobiology.");
  
      // Create Modules
      const Module = Parse.Object.extend("Module");
      const modules = [];
  
      const module1 = new Module();
      module1.set("moduleId", "SOLAR_SYSTEM_MODULE_1");
      module1.set("course", solarSystemCourse);
      module1.set("title", "Celestial Mechanics");
      module1.set("content", {
        topics: ["Kepler's Laws", "Newtonian Mechanics", "Orbital Dynamics"],
        assignments: ["Problem Set 1", "Simulation Project"]
      });
      module1.set("order", 1);
      modules.push(module1);
  
      const module2 = new Module();
      module2.set("moduleId", "SOLAR_SYSTEM_MODULE_2");
      module2.set("course", solarSystemCourse);
      module2.set("title", "Planetary Science");
      module2.set("content", {
        topics: ["Planetary Formation", "Geology of Planets", "Atmospheric Science"],
        assignments: ["Research Paper", "Field Study"]
      });
      module2.set("order", 2);
      modules.push(module2);
  
      const module3 = new Module();
      module3.set("moduleId", "SOLAR_SYSTEM_MODULE_3");
      module3.set("course", solarSystemCourse);
      module3.set("title", "Astrobiology");
      module3.set("content", {
        topics: ["Origin of Life", "Habitability", "Search for Extraterrestrial Life"],
        assignments: ["Lab Experiment", "Presentation"]
      });
      module3.set("order", 3);
      modules.push(module3);
  
      const module4 = new Module();
      module4.set("moduleId", "SOLAR_SYSTEM_MODULE_4");
      module4.set("course", solarSystemCourse);
      module4.set("title", "Advanced Topics in Solar System Studies");
      module4.set("content", {
        topics: ["Exoplanetary Systems", "Solar System Exploration Missions", "Future of Space Exploration"],
        assignments: ["Capstone Project", "Oral Exam"]
      });
      module4.set("order", 4);
      modules.push(module4);
  
      const module5 = new Module();
      module5.set("moduleId", "SOLAR_SYSTEM_MODULE_5");
      module5.set("course", solarSystemCourse);
      module5.set("title", "Stellar Astrophysics");
      module5.set("content", {
        topics: ["Stellar Evolution", "Nucleosynthesis", "Stellar Remnants"],
        assignments: ["Research Project", "Data Analysis"]
      });
      module5.set("order", 5);
      modules.push(module5);
  
      const module6 = new Module();
      module6.set("moduleId", "SOLAR_SYSTEM_MODULE_6");
      module6.set("course", solarSystemCourse);
      module6.set("title", "Cosmology");
      module6.set("content", {
        topics: ["Big Bang Theory", "Dark Matter and Dark Energy", "Cosmic Microwave Background"],
        assignments: ["Essay", "Group Discussion"]
      });
      module6.set("order", 6);
      modules.push(module6);
  
      const module7 = new Module();
      module7.set("moduleId", "SOLAR_SYSTEM_MODULE_7");
      module7.set("course", solarSystemCourse);
      module7.set("title", "Space Technology");
      module7.set("content", {
        topics: ["Satellite Technology", "Spacecraft Design", "Robotics in Space"],
        assignments: ["Design Project", "Technical Report"]
      });
      module7.set("order", 7);
      modules.push(module7);
  
      // Save Course and Modules
      await solarSystemCourse.save();
      for (const module of modules) {
        await module.save();
      }
  
      console.log("Solar system course and modules created successfully!");
    } catch (error) {
      console.error("Error creating solar system course data: ", error);
    }
  }

  createSolarSystemCourse();


async function addQuizToCelestialMechanicsModule() {
    try {
      // Find the module
      const Module = Parse.Object.extend("Module");
      const query = new Parse.Query(Module);
      query.equalTo("moduleId", "SOLAR_SYSTEM_MODULE_1");
      const module1 = await query.first();
  
      if (module1) {
        // Create QuizV2
        const QuizV2 = Parse.Object.extend("QuizV2");
        const quiz = new QuizV2();
        quiz.set("quizId", "CELESTIAL_MECHANICS_QUIZ_1");
        quiz.set("module", module1);
        quiz.set("passingScore", 6);
  
        // Create Questions
        const QuestionV2 = Parse.Object.extend("QuestionV2");
        const questions = [];
  
        const question1 = new QuestionV2();
        question1.set("questionId", "CELESTIAL_MECHANICS_Q1");
        question1.set("quiz", quiz);
        question1.set("text", "What is Kepler's First Law?");
        question1.set("options", ["Planets move in circular orbits", "Planets move in elliptical orbits", "Planets move in parabolic orbits", "Planets move in hyperbolic orbits"]);
        question1.set("correctAnswer", "Planets move in elliptical orbits");
        questions.push(question1);
  
        const question2 = new QuestionV2();
        question2.set("questionId", "CELESTIAL_MECHANICS_Q2");
        question2.set("quiz", quiz);
        question2.set("text", "What is the formula for gravitational force?");
        question2.set("options", ["F = ma", "F = G(m1m2)/r^2", "F = mv^2/r", "F = kq1q2/r^2"]);
        question2.set("correctAnswer", "F = G(m1m2)/r^2");
        questions.push(question2);
  
        const question3 = new QuestionV2();
        question3.set("questionId", "CELESTIAL_MECHANICS_Q3");
        question3.set("quiz", quiz);
        question3.set("text", "What is the escape velocity from Earth?");
        question3.set("options", ["7.9 km/s", "11.2 km/s", "9.8 km/s", "12.5 km/s"]);
        question3.set("correctAnswer", "11.2 km/s");
        questions.push(question3);
  
        const question4 = new QuestionV2();
        question4.set("questionId", "CELESTIAL_MECHANICS_Q4");
        question4.set("quiz", quiz);
        question4.set("text", "What is the period of a geostationary orbit?");
        question4.set("options", ["12 hours", "24 hours", "48 hours", "6 hours"]);
        question4.set("correctAnswer", "24 hours");
        questions.push(question4);
  
        const question5 = new QuestionV2();
        question5.set("questionId", "CELESTIAL_MECHANICS_Q5");
        question5.set("quiz", quiz);
        question5.set("text", "What is the significance of the Roche limit?");
        question5.set("options", ["It is the distance within which a celestial body will disintegrate due to tidal forces", "It is the distance at which a satellite can maintain a stable orbit", "It is the distance at which gravitational forces balance out", "It is the distance at which a planet can form rings"]);
        question5.set("correctAnswer", "It is the distance within which a celestial body will disintegrate due to tidal forces");
        questions.push(question5);
  
        // Save Quiz and Questions
        await quiz.save();
        for (const question of questions) {
          await question.save();
        }
  
        console.log("Celestial Mechanics quiz and questions created successfully!");
      } else {
        console.log("Module not found!");
      }
    } catch (error) {
      console.error("Error creating quiz and questions: ", error);
    }
  }

  
  addQuizToCelestialMechanicsModule();

  async function addQuizToPlanetaryScienceModule() {
    try {
      // Find the module
      const Module = Parse.Object.extend("Module");
      const query = new Parse.Query(Module);
      query.equalTo("moduleId", "SOLAR_SYSTEM_MODULE_2");
      const module2 = await query.first();
  
      if (module2) {
        // Create QuizV2
        const QuizV2 = Parse.Object.extend("QuizV2");
        const quiz = new QuizV2();
        quiz.set("quizId", "PLANETARY_SCIENCE_QUIZ_1");
        quiz.set("module", module2);
        quiz.set("passingScore", 6);
  
        // Create Questions
        const QuestionV2 = Parse.Object.extend("QuestionV2");
        const questions = [];
  
        const question1 = new QuestionV2();
        question1.set("questionId", "PLANETARY_SCIENCE_Q1");
        question1.set("quiz", quiz);
        question1.set("text", "What is the primary component of the Earth's atmosphere?");
        question1.set("options", ["Oxygen", "Nitrogen", "Carbon Dioxide", "Argon"]);
        question1.set("correctAnswer", "Nitrogen");
        questions.push(question1);
  
        const question2 = new QuestionV2();
        question2.set("questionId", "PLANETARY_SCIENCE_Q2");
        question2.set("quiz", quiz);
        question2.set("text", "Which planet is known as the 'Red Planet'?");
        question2.set("options", ["Venus", "Mars", "Jupiter", "Saturn"]);
        question2.set("correctAnswer", "Mars");
        questions.push(question2);
  
        const question3 = new QuestionV2();
        question3.set("questionId", "PLANETARY_SCIENCE_Q3");
        question3.set("quiz", quiz);
        question3.set("text", "What is the largest planet in our solar system?");
        question3.set("options", ["Earth", "Mars", "Jupiter", "Saturn"]);
        question3.set("correctAnswer", "Jupiter");
        questions.push(question3);
  
        const question4 = new QuestionV2();
        question4.set("questionId", "PLANETARY_SCIENCE_Q4");
        question4.set("quiz", quiz);
        question4.set("text", "What is the main component of Saturn's rings?");
        question4.set("options", ["Rock", "Ice", "Dust", "Gas"]);
        question4.set("correctAnswer", "Ice");
        questions.push(question4);
  
        const question5 = new QuestionV2();
        question5.set("questionId", "PLANETARY_SCIENCE_Q5");
        question5.set("quiz", quiz);
        question5.set("text", "Which planet has the most moons?");
        question5.set("options", ["Earth", "Mars", "Jupiter", "Saturn"]);
        question5.set("correctAnswer", "Saturn");
        questions.push(question5);
  
        // Save Quiz and Questions
        await quiz.save();
        for (const question of questions) {
          await question.save();
        }
  
        console.log("Planetary Science quiz and questions created successfully!");
      } else {
        console.log("Module not found!");
      }
    } catch (error) {
      console.error("Error creating quiz and questions: ", error);
    }
  }

  addQuizToPlanetaryScienceModule()


  async function createPlanetaryScienceMilestone() {
    try {
      // Find the course
      const Course = Parse.Object.extend("Course");
      const courseQuery = new Parse.Query(Course);
      courseQuery.equalTo("courseId", "SOLAR_SYSTEM_101");
      const solarSystemCourse = await courseQuery.first();
  
      if (solarSystemCourse) {
        // Find the required modules
        const Module = Parse.Object.extend("Module");
        const moduleQuery = new Parse.Query(Module);
        moduleQuery.equalTo("course", solarSystemCourse);
        moduleQuery.equalTo("moduleId", "SOLAR_SYSTEM_MODULE_2");
        const modules = await moduleQuery.find();
  
        // Create Milestone
        const Milestone = Parse.Object.extend("Milestone");
        const milestone = new Milestone();
        milestone.set("milestoneId", "SOLAR_SYSTEM_MILESTONE_2");
        milestone.set("course", solarSystemCourse);
        milestone.set("title", "Planetary Science Expert");
        milestone.set("description", "Complete the Planetary Science module to become an expert in planetary science.");
        milestone.set("requiredModules", modules);
        milestone.set("rewardPoints", 150);
  
        // Save Milestone
        await milestone.save();
        console.log("Planetary Science Milestone created successfully!");
      } else {
        console.log("Course not found!");
      }
    } catch (error) {
      console.error("Error creating milestone: ", error);
    }
  }

  createPlanetaryScienceMilestone();

  async function createCelestialMechanicsMilestone() {
    try {
      // Find the course
      const Course = Parse.Object.extend("Course");
      const courseQuery = new Parse.Query(Course);
      courseQuery.equalTo("courseId", "SOLAR_SYSTEM_101");
      const solarSystemCourse = await courseQuery.first();
  
      if (solarSystemCourse) {
        // Find the required modules
        const Module = Parse.Object.extend("Module");
        const moduleQuery = new Parse.Query(Module);
        moduleQuery.equalTo("course", solarSystemCourse);
        moduleQuery.equalTo("moduleId", "SOLAR_SYSTEM_MODULE_1");
        const modules = await moduleQuery.find();
  
        // Create Milestone
        const Milestone = Parse.Object.extend("Milestone");
        const milestone = new Milestone();
        milestone.set("milestoneId", "SOLAR_SYSTEM_MILESTONE_1");
        milestone.set("course", solarSystemCourse);
        milestone.set("title", "Celestial Mechanics Mastery");
        milestone.set("description", "Complete the Celestial Mechanics module to master the concepts of celestial mechanics.");
        milestone.set("requiredModules", modules);
        milestone.set("rewardPoints", 100);
  
        // Save Milestone
        await milestone.save();
        console.log("Celestial Mechanics Milestone created successfully!");
      } else {
        console.log("Course not found!");
      }
    } catch (error) {
      console.error("Error creating milestone: ", error);
    }
  }
  
  async function executeCourseCreation() {
    await createSolarSystemCourse();
    await addQuizToCelestialMechanicsModule();
    await addQuizToPlanetaryScienceModule();
    await createCelestialMechanicsMilestone();
    await createPlanetaryScienceMilestone();
  }
  
  executeCourseCreation();