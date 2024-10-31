
const Parse = require('parse/node');



// Parse.initialize("myappID", "mymasterKey");
Parse.initialize(Parse.applicationId = "ihzu049k4lkpefeqFXYxwCn6kuo7qph3scKcq1sE",javaScriptKey= "zggqV0XYpXvBSE6hYidabBVK6ulCBujgGlscMT4t", masterKey="984yh9uosBGDkVpj5bCEGdnWMSI2Kty6LXHOKkWJ");
Parse.serverURL = 'https://parseapi.back4app.com/parse';
// Parse.setAsyncStorage(AsyncLocalStorage);
// Parse.user
const Question = Parse.Object.extend("Question");

const Quiz = Parse.Object.extend("Quiz");



function load_data(data) {
    var list_data = [];
    for (const item of data) {

        const _questions = new Question();
        const _quiz = new Quiz()
        _quiz.id = item['_p_quiz'];

        // do stuff with your user

        _questions
            .set('quiz', _quiz)
            .set('question', item['question'])
            .set('options', item['options'])
            .set('correct_answer', item['correct_answer'])
            ;
        list_data.push(_questions)
        // break;
    }
    Parse.Object.saveAll(list_data).then(() => {
        console.log('save batch:-');
    }).catch((err) => {
        console.log('error:-', err.toString());
    });

    // console.log(list_data[2].get('correct_answer'));
    
}

var question_data =
[{
    "_id": "MQaSNTcVCZ",
    "options": [
      "50 J",
      "15 J",
      "0 J",
      "25 J"
    ],
    "_p_quiz": "EdlvPGEeO9",
    "question": "What is the work done by a force of 10 N moving an object 5 meters in the direction of the force?",
    "correct_answer": "50 J",
    "_created_at": {
      "$date": "2024-10-23T05:35:48.922Z"
    },
    "_updated_at": {
      "$date": "2024-10-23T05:35:48.922Z"
    },
    "usedTimes": 0
  },
  {
    "_id": "gOv1nvIamM",
    "options": [
      "15 V",
      "1.5 V",
      "30 V",
      "10 V"
    ],
    "_p_quiz": "EdlvPGEeO9",
    "question": "What is the potential difference across a 5-ohm resistor carrying a current of 3 amperes?",
    "correct_answer": "15 V",
    "_created_at": {
      "$date": "2024-10-23T05:35:48.922Z"
    },
    "_updated_at": {
      "$date": "2024-10-23T05:35:48.922Z"
    },
    "usedTimes": 0
  },
  {
    "_id": "hTeBTGCtju",
    "options": [
      "9 J",
      "18 J",
      "27 J",
      "6 J"
    ],
    "_p_quiz": "EdlvPGEeO9",
    "question": "What is the kinetic energy of a 2 kg object moving at 3 m/s?",
    "correct_answer": "9 J",
    "_created_at": {
      "$date": "2024-10-23T05:35:48.922Z"
    },
    "_updated_at": {
      "$date": "2024-10-23T05:35:48.922Z"
    },
    "usedTimes": 0
  },
  {
    "_id": "LwZATM5AUx",
    "options": [
      "F = -kx",
      "F = ma",
      "F = mv²/r",
      "F = mg"
    ],
    "_p_quiz": "EdlvPGEeO9",
    "question": "What is Hooke’s Law?",
    "correct_answer": "F = -kx",
    "_created_at": {
      "$date": "2024-10-23T05:35:48.922Z"
    },
    "_updated_at": {
      "$date": "2024-10-23T05:35:48.922Z"
    },
    "usedTimes": 0
  },
  {
    "_id": "TIWjVejbDG",
    "options": [
      "The total linear momentum of an isolated system remains constant.",
      "Energy cannot be created or destroyed.",
      "The force on an object is equal to its mass times acceleration.",
      "For every action, there is an equal and opposite reaction."
    ],
    "_p_quiz": "EdlvPGEeO9",
    "question": "What is the principle of conservation of linear momentum?",
    "correct_answer": "The total linear momentum of an isolated system remains constant.",
    "_created_at": {
      "$date": "2024-10-23T05:35:48.922Z"
    },
    "_updated_at": {
      "$date": "2024-10-23T05:35:48.922Z"
    },
    "usedTimes": 0
  },
  {
    "_id": "PmqhvK0hTk",
    "options": [
      "Ohm",
      "Watt",
      "Volt",
      "Coulomb"
    ],
    "_p_quiz": "EdlvPGEeO9",
    "question": "What is the unit of electric resistance?",
    "correct_answer": "Ohm",
    "_created_at": {
      "$date": "2024-10-23T05:35:48.922Z"
    },
    "_updated_at": {
      "$date": "2024-10-23T05:35:48.922Z"
    },
    "usedTimes": 0
  },
  {
    "_id": "Fip2rrKDGW",
    "options": [
      "Temperature is directly proportional to the average kinetic energy.",
      "Temperature is inversely proportional to the average kinetic energy.",
      "Temperature is equal to the average kinetic energy.",
      "Temperature is unrelated to the average kinetic energy."
    ],
    "_p_quiz": "EdlvPGEeO9",
    "question": "What is the relationship between temperature and kinetic energy of particles?",
    "correct_answer": "Temperature is directly proportional to the average kinetic energy.",
    "_created_at": {
      "$date": "2024-10-23T05:35:48.923Z"
    },
    "_updated_at": {
      "$date": "2024-10-23T05:35:48.923Z"
    },
    "usedTimes": 0
  },
  {
    "_id": "HD2jknFJeU",
    "options": [
      "F = G(m₁m₂)/r²",
      "F = ma",
      "F = mv²/r",
      "F = mg"
    ],
    "_p_quiz": "EdlvPGEeO9",
    "question": "What is the formula for gravitational force between two masses?",
    "correct_answer": "F = G(m₁m₂)/r²",
    "_created_at": {
      "$date": "2024-10-23T05:35:48.922Z"
    },
    "_updated_at": {
      "$date": "2024-10-23T05:35:48.922Z"
    },
    "usedTimes": 0
  },
  {
    "_id": "VjeWAPccyo",
    "options": [
      "20 kg·m/s",
      "5 kg·m/s",
      "10 kg·m/s",
      "30 kg·m/s"
    ],
    "_p_quiz": "EdlvPGEeO9",
    "question": "What is the momentum of a 10 kg object moving at 2 m/s?",
    "correct_answer": "20 kg·m/s",
    "_created_at": {
      "$date": "2024-10-23T05:35:48.922Z"
    },
    "_updated_at": {
      "$date": "2024-10-23T05:35:48.922Z"
    },
    "usedTimes": 0
  },
  {
    "_id": "emBtg7CkBJ",
    "options": [
      "343 m/s",
      "300 m/s",
      "400 m/s",
      "500 m/s"
    ],
    "_p_quiz": "EdlvPGEeO9",
    "question": "What is the speed of sound in air at room temperature?",
    "correct_answer": "343 m/s",
    "_created_at": {
      "$date": "2024-10-23T05:35:48.923Z"
    },
    "_updated_at": {
      "$date": "2024-10-23T05:35:48.923Z"
    },
    "usedTimes": 0
  },
  {
    "_id": "kj9wGkrzOP",
    "options": [
      "9.8 m/s²",
      "10 m/s²",
      "9 m/s²",
      "8.9 m/s²"
    ],
    "_p_quiz": "EdlvPGEeO9",
    "question": "What is the acceleration due to gravity on Earth?",
    "correct_answer": "9.8 m/s²",
    "_created_at": {
      "$date": "2024-10-23T05:35:48.922Z"
    },
    "_updated_at": {
      "$date": "2024-10-23T05:35:48.922Z"
    },
    "usedTimes": 0
  },
  {
    "_id": "AVewM4LAyJ",
    "options": [
      "a = v²/r",
      "a = r²/v",
      "a = vr",
      "a = v/r"
    ],
    "_p_quiz": "EdlvPGEeO9",
    "question": "What is the formula for centripetal acceleration?",
    "correct_answer": "a = v²/r",
    "_created_at": {
      "$date": "2024-10-23T05:35:48.923Z"
    },
    "_updated_at": {
      "$date": "2024-10-23T05:35:48.923Z"
    },
    "usedTimes": 0
  },
  {
    "_id": "imbW66j4V2",
    "options": [
      "11.2 km/s",
      "9.8 km/s",
      "7.9 km/s",
      "15 km/s"
    ],
    "_p_quiz": "EdlvPGEeO9",
    "question": "What is the escape velocity from Earth's surface?",
    "correct_answer": "11.2 km/s",
    "_created_at": {
      "$date": "2024-10-23T05:35:48.923Z"
    },
    "_updated_at": {
      "$date": "2024-10-23T05:35:48.923Z"
    },
    "usedTimes": 0
  },
  {
    "_id": "nZXNlYsQ1f",
    "options": [
      "2 Hz",
      "0.5 Hz",
      "1 Hz",
      "1.5 Hz"
    ],
    "_p_quiz": "EdlvPGEeO9",
    "question": "What is the frequency of a wave with a period of 0.5 seconds?",
    "correct_answer": "2 Hz",
    "_created_at": {
      "$date": "2024-10-23T05:35:48.922Z"
    },
    "_updated_at": {
      "$date": "2024-10-23T05:35:48.922Z"
    },
    "usedTimes": 0
  },
  {
    "_id": "7UmO62uKem",
    "options": [
      "T = 2π√(L/g)",
      "T = 2π√(g/L)",
      "T = L/g",
      "T = g/L"
    ],
    "_p_quiz": "EdlvPGEeO9",
    "question": "What is the formula for the period of a simple pendulum?",
    "correct_answer": "T = 2π√(L/g)",
    "_created_at": {
      "$date": "2024-10-23T05:35:48.922Z"
    },
    "_updated_at": {
      "$date": "2024-10-23T05:35:48.922Z"
    },
    "usedTimes": 0
  },
  {
    "_id": "SVqX7Fymdi",
    "options": [
      "mvr",
      "mv/r",
      "mr/v",
      "m/v"
    ],
    "_p_quiz": "EdlvPGEeO9",
    "question": "What is the angular momentum of a particle with mass m, velocity v, and radius r?",
    "correct_answer": "mvr",
    "_created_at": {
      "$date": "2024-10-23T05:35:48.922Z"
    },
    "_updated_at": {
      "$date": "2024-10-23T05:35:48.922Z"
    },
    "usedTimes": 0
  },
  {
    "_id": "Uz5Ca9S5So",
    "options": [
      "P = VI",
      "P = V/R",
      "P = IR",
      "P = V²/R"
    ],
    "_p_quiz": "EdlvPGEeO9",
    "question": "What is the formula for electric power?",
    "correct_answer": "P = VI",
    "_created_at": {
      "$date": "2024-10-23T05:35:48.923Z"
    },
    "_updated_at": {
      "$date": "2024-10-23T05:35:48.923Z"
    },
    "usedTimes": 0
  },
  {
    "_id": "Ht3ABVNUjz",
    "options": [
      "25 J",
      "50 J",
      "100 J",
      "10 J"
    ],
    "_p_quiz": "EdlvPGEeO9",
    "question": "What is the potential energy stored in a spring compressed by 0.5 meters with a spring constant of 200 N/m?",
    "correct_answer": "25 J",
    "_created_at": {
      "$date": "2024-10-23T05:35:48.923Z"
    },
    "_updated_at": {
      "$date": "2024-10-23T05:35:48.923Z"
    },
    "usedTimes": 0
  },
  {
    "_id": "PmtSwI6Tlh",
    "options": [
      "4.18 J/g°C",
      "2.09 J/g°C",
      "1.00 J/g°C",
      "3.97 J/g°C"
    ],
    "_p_quiz": "EdlvPGEeO9",
    "question": "What is the specific heat capacity of water?",
    "correct_answer": "4.18 J/g°C",
    "_created_at": {
      "$date": "2024-10-23T05:35:48.922Z"
    },
    "_updated_at": {
      "$date": "2024-10-23T05:35:48.922Z"
    },
    "usedTimes": 0
  },
  {
    "_id": "JGwrON3ppc",
    "options": [
      "P = F/A",
      "P = Fd",
      "P = ma",
      "P = mv"
    ],
    "_p_quiz": "EdlvPGEeO9",
    "question": "What is the formula for calculating pressure?",
    "correct_answer": "P = F/A",
    "_created_at": {
      "$date": "2024-10-23T05:35:48.923Z"
    },
    "_updated_at": {
      "$date": "2024-10-23T05:35:48.923Z"
    },
    "usedTimes": 0
  },
  {
    "_id": "7ChynVF4Fl",
    "options": [
      "Tesla",
      "Newton",
      "Volt",
      "Watt"
    ],
    "_p_quiz": "EdlvPGEeO9",
    "question": "What is the unit of magnetic field strength?",
    "correct_answer": "Tesla",
    "_created_at": {
      "$date": "2024-10-23T05:35:49.111Z"
    },
    "_updated_at": {
      "$date": "2024-10-23T05:35:49.111Z"
    },
    "usedTimes": 0
  },
  {
    "_id": "yAZ37CXhCV",
    "options": [
      "The force between two charges is directly proportional to the product of the charges and inversely proportional to the square of the distance between them.",
      "The force between two masses is directly proportional to the product of the masses.",
      "The energy of a photon is proportional to its frequency.",
      "The pressure of a gas is proportional to its temperature."
    ],
    "_p_quiz": "EdlvPGEeO9",
    "question": "What is Coulomb's law?",
    "correct_answer": "The force between two charges is directly proportional to the product of the charges and inversely proportional to the square of the distance between them.",
    "_created_at": {
      "$date": "2024-10-23T05:35:49.111Z"
    },
    "_updated_at": {
      "$date": "2024-10-23T05:35:49.111Z"
    },
    "usedTimes": 0
  },
  {
    "_id": "ssh4ts5vZb",
    "options": [
      "F = qvB sin(θ)",
      "F = qv/B",
      "F = B/qv",
      "F = q/Bv"
    ],
    "_p_quiz": "EdlvPGEeO9",
    "question": "What is the formula for calculating the magnetic force on a charged particle moving in a magnetic field?",
    "correct_answer": "F = qvB sin(θ)",
    "_created_at": {
      "$date": "2024-10-23T05:35:49.111Z"
    },
    "_updated_at": {
      "$date": "2024-10-23T05:35:49.111Z"
    },
    "usedTimes": 0
  },
  {
    "_id": "fpTQcSfYGi",
    "options": [
      "T = 1/f",
      "T = f/1",
      "T = λf",
      "T = λ/v"
    ],
    "_p_quiz": "EdlvPGEeO9",
    "question": "What is the formula for calculating the period of a wave?",
    "correct_answer": "T = 1/f",
    "_created_at": {
      "$date": "2024-10-23T05:35:49.112Z"
    },
    "_updated_at": {
      "$date": "2024-10-23T05:35:49.112Z"
    },
    "usedTimes": 0
  },
  {
    "_id": "BR0jcYlcry",
    "options": [
      "Efficiency = (Useful energy output / Total energy input) × 100%",
      "Efficiency = (Total energy input / Useful energy output) × 100%",
      "Efficiency = (Useful energy output × Total energy input) × 100%",
      "Efficiency = (Total energy input × Useful energy output) × 100%"
    ],
    "_p_quiz": "EdlvPGEeO9",
    "question": "What is the formula for calculating the efficiency of a machine?",
    "correct_answer": "Efficiency = (Useful energy output / Total energy input) × 100%",
    "_created_at": {
      "$date": "2024-10-23T05:35:49.112Z"
    },
    "_updated_at": {
      "$date": "2024-10-23T05:35:49.112Z"
    },
    "usedTimes": 0
  },
  {
    "_id": "BF5OL6b3FF",
    "options": [
      "When two or more waves overlap, the resulting wave is the sum of the individual waves.",
      "The frequency of the wave is the same as the frequency of the source.",
      "The speed of the wave is determined by the medium.",
      "The amplitude of the wave is proportional to its frequency."
    ],
    "_p_quiz": "EdlvPGEeO9",
    "question": "What is the principle of superposition in waves?",
    "correct_answer": "When two or more waves overlap, the resulting wave is the sum of the individual waves.",
    "_created_at": {
      "$date": "2024-10-23T05:35:49.112Z"
    },
    "_updated_at": {
      "$date": "2024-10-23T05:35:49.112Z"
    },
    "usedTimes": 0
  },
  {
    "_id": "GHepYXEZAo",
    "options": [
      "The time taken to complete one full cycle of oscillation.",
      "The number of oscillations per unit time.",
      "The maximum displacement from the equilibrium position.",
      "The rate at which the oscillation amplitude decreases."
    ],
    "_p_quiz": "EdlvPGEeO9",
    "question": "What is the time period of an oscillation?",
    "correct_answer": "The time taken to complete one full cycle of oscillation.",
    "_created_at": {
      "$date": "2024-10-23T05:35:49.111Z"
    },
    "_updated_at": {
      "$date": "2024-10-23T05:35:49.111Z"
    },
    "usedTimes": 0
  },
  {
    "_id": "Kc6nnF4LR1",
    "options": [
      "The ratio of the speed of light in vacuum to the speed of light in the medium.",
      "The ratio of the frequency of light in vacuum to the frequency in the medium.",
      "The ratio of the wavelength of light in vacuum to the wavelength in the medium.",
      "The ratio of the intensity of light in vacuum to the intensity in the medium."
    ],
    "_p_quiz": "EdlvPGEeO9",
    "question": "What is the refractive index of a medium?",
    "correct_answer": "The ratio of the speed of light in vacuum to the speed of light in the medium.",
    "_created_at": {
      "$date": "2024-10-23T05:35:49.111Z"
    },
    "_updated_at": {
      "$date": "2024-10-23T05:35:49.111Z"
    },
    "usedTimes": 0
  },
  {
    "_id": "QsBSsjS1T6",
    "options": [
      "g = GM/r²",
      "g = G/r²",
      "g = GM²/r",
      "g = GMr²"
    ],
    "_p_quiz": "EdlvPGEeO9",
    "question": "What is the formula for the gravitational field strength at a distance r from a mass M?",
    "correct_answer": "g = GM/r²",
    "_created_at": {
      "$date": "2024-10-23T05:35:49.111Z"
    },
    "_updated_at": {
      "$date": "2024-10-23T05:35:49.111Z"
    },
    "usedTimes": 0
  },
  {
    "_id": "bV75Ll2Sra",
    "options": [
      "Joule",
      "Watt",
      "Newton",
      "Pascal"
    ],
    "_p_quiz": "EdlvPGEeO9",
    "question": "What is the unit of work in the International System of Units (SI)?",
    "correct_answer": "Joule",
    "_created_at": {
      "$date": "2024-10-23T05:35:49.112Z"
    },
    "_updated_at": {
      "$date": "2024-10-23T05:35:49.112Z"
    },
    "usedTimes": 0
  },
  {
    "_id": "gwcOyFvDZr",
    "options": [
      "E = F/q",
      "E = q/F",
      "E = F×q",
      "E = F-q"
    ],
    "_p_quiz": "EdlvPGEeO9",
    "question": "What is the formula for calculating the electric field strength at a point?",
    "correct_answer": "E = F/q",
    "_created_at": {
      "$date": "2024-10-23T05:35:49.112Z"
    },
    "_updated_at": {
      "$date": "2024-10-23T05:35:49.112Z"
    },
    "usedTimes": 0
  },
  {
    "_id": "1CJeOVU2Z8",
    "options": [
      "PE = mgh",
      "PE = 1/2 mgh²",
      "PE = mg/h",
      "PE = m/g"
    ],
    "_p_quiz": "EdlvPGEeO9",
    "question": "What is the potential energy of an object at a height h above the ground?",
    "correct_answer": "PE = mgh",
    "_created_at": {
      "$date": "2024-10-23T05:35:49.112Z"
    },
    "_updated_at": {
      "$date": "2024-10-23T05:35:49.112Z"
    },
    "usedTimes": 0
  },
  {
    "_id": "odYxwd6Dac",
    "options": [
      "A body immersed in a fluid experiences a buoyant force equal to the weight of the fluid displaced by it.",
      "The pressure in a fluid decreases as the speed of the fluid increases.",
      "The volume of a gas is directly proportional to its temperature.",
      "The energy of a photon is proportional to its frequency."
    ],
    "_p_quiz": "EdlvPGEeO9",
    "question": "What is Archimedes' principle?",
    "correct_answer": "A body immersed in a fluid experiences a buoyant force equal to the weight of the fluid displaced by it.",
    "_created_at": {
      "$date": "2024-10-23T05:35:49.112Z"
    },
    "_updated_at": {
      "$date": "2024-10-23T05:35:49.112Z"
    },
    "usedTimes": 0
  },
  {
    "_id": "qkBfGSwDaV",
    "options": [
      "Energy cannot be created or destroyed, only transformed from one form to another.",
      "The total energy of a system remains constant.",
      "For every action, there is an equal and opposite reaction.",
      "The force on an object is equal to its mass times acceleration."
    ],
    "_p_quiz": "EdlvPGEeO9",
    "question": "What is the principle of conservation of energy?",
    "correct_answer": "Energy cannot be created or destroyed, only transformed from one form to another.",
    "_created_at": {
      "$date": "2024-10-23T05:35:49.111Z"
    },
    "_updated_at": {
      "$date": "2024-10-23T05:35:49.111Z"
    },
    "usedTimes": 0
  },
  {
    "_id": "s6m50FtnWT",
    "options": [
      "Candela",
      "Lumen",
      "Lux",
      "Watt"
    ],
    "_p_quiz": "EdlvPGEeO9",
    "question": "What is the unit of luminous intensity?",
    "correct_answer": "Candela",
    "_created_at": {
      "$date": "2024-10-23T05:35:49.112Z"
    },
    "_updated_at": {
      "$date": "2024-10-23T05:35:49.112Z"
    },
    "usedTimes": 0
  },
  {
    "_id": "gCmbQrHzjr",
    "options": [
      "F_friction = μN",
      "F_friction = μg",
      "F_friction = N/μ",
      "F_friction = μ/F"
    ],
    "_p_quiz": "EdlvPGEeO9",
    "question": "What is the formula for the force of friction?",
    "correct_answer": "F_friction = μN",
    "_created_at": {
      "$date": "2024-10-23T05:35:49.111Z"
    },
    "_updated_at": {
      "$date": "2024-10-23T05:35:49.111Z"
    },
    "usedTimes": 0
  },
  {
    "_id": "H6P2HnRZEd",
    "options": [
      "H2O",
      "O2",
      "CO2",
      "NaCl"
    ],
    "_p_quiz": "hBr37xRuFC",
    "question": "What is the chemical symbol for water?",
    "correct_answer": "H2O",
    "_created_at": {
      "$date": "2024-10-23T07:40:41.979Z"
    },
    "_updated_at": {
      "$date": "2024-10-23T07:40:41.979Z"
    },
    "usedTimes": 0
  },
  {
    "_id": "8CzWuFfeil",
    "options": [
      "Gravity",
      "Magnetism",
      "Friction",
      "Electricity"
    ],
    "_p_quiz": "hBr37xRuFC",
    "question": "What force keeps us on the ground?",
    "correct_answer": "Gravity",
    "_created_at": {
      "$date": "2024-10-23T07:40:41.979Z"
    },
    "_updated_at": {
      "$date": "2024-10-23T07:40:41.979Z"
    },
    "usedTimes": 0
  },
  {
    "_id": "lsEI4IxjOu",
    "options": [
      "Gene",
      "Chromosome",
      "DNA",
      "Protein"
    ],
    "_p_quiz": "hBr37xRuFC",
    "question": "What is the basic unit of heredity?",
    "correct_answer": "Gene",
    "_created_at": {
      "$date": "2024-10-23T07:40:41.979Z"
    },
    "_updated_at": {
      "$date": "2024-10-23T07:40:41.979Z"
    },
    "usedTimes": 0
  },
  {
    "_id": "1lLhbYy1ci",
    "options": [
      "Skin",
      "Liver",
      "Heart",
      "Brain"
    ],
    "_p_quiz": "hBr37xRuFC",
    "question": "What is the largest organ in the human body?",
    "correct_answer": "Skin",
    "_created_at": {
      "$date": "2024-10-23T07:40:41.979Z"
    },
    "_updated_at": {
      "$date": "2024-10-23T07:40:41.979Z"
    },
    "usedTimes": 0
  },
  {
    "_id": "MC1wvy2bBi",
    "options": [
      "Gravity",
      "Magnetism",
      "Inertia",
      "Momentum"
    ],
    "_p_quiz": "hBr37xRuFC",
    "question": "What phenomenon causes objects to fall to the ground?",
    "correct_answer": "Gravity",
    "_created_at": {
      "$date": "2024-10-23T07:40:41.979Z"
    },
    "_updated_at": {
      "$date": "2024-10-23T07:40:41.979Z"
    },
    "usedTimes": 0
  },
  {
    "_id": "AVh7B3Ds6E",
    "options": [
      "Mars",
      "Venus",
      "Jupiter",
      "Saturn"
    ],
    "_p_quiz": "hBr37xRuFC",
    "question": "What planet is known as the Red Planet?",
    "correct_answer": "Mars",
    "_created_at": {
      "$date": "2024-10-23T07:40:41.979Z"
    },
    "_updated_at": {
      "$date": "2024-10-23T07:40:41.979Z"
    },
    "usedTimes": 0
  },
  {
    "_id": "AXe4mODSBQ",
    "options": [
      "100°C",
      "0°C",
      "50°C",
      "200°C"
    ],
    "_p_quiz": "hBr37xRuFC",
    "question": "What is the boiling point of water at sea level?",
    "correct_answer": "100°C",
    "_created_at": {
      "$date": "2024-10-23T07:40:41.979Z"
    },
    "_updated_at": {
      "$date": "2024-10-23T07:40:41.979Z"
    },
    "usedTimes": 0
  },
  {
    "_id": "Q1SC35zyXB",
    "options": [
      "Photosynthesis",
      "Respiration",
      "Digestion",
      "Fermentation"
    ],
    "_p_quiz": "hBr37xRuFC",
    "question": "What is the process by which plants make their food?",
    "correct_answer": "Photosynthesis",
    "_created_at": {
      "$date": "2024-10-23T07:40:41.979Z"
    },
    "_updated_at": {
      "$date": "2024-10-23T07:40:41.979Z"
    },
    "usedTimes": 0
  },
  {
    "_id": "lX36f5LUZZ",
    "options": [
      "Nucleus",
      "Cytoplasm",
      "Cell membrane",
      "Mitochondria"
    ],
    "_p_quiz": "hBr37xRuFC",
    "question": "What part of the cell contains genetic material?",
    "correct_answer": "Nucleus",
    "_created_at": {
      "$date": "2024-10-23T07:40:41.979Z"
    },
    "_updated_at": {
      "$date": "2024-10-23T07:40:41.979Z"
    },
    "usedTimes": 0
  },
  {
    "_id": "Ma69mN6ZlM",
    "options": [
      "Nitrogen",
      "Oxygen",
      "Carbon dioxide",
      "Hydrogen"
    ],
    "_p_quiz": "hBr37xRuFC",
    "question": "What is the main gas found in the air we breathe?",
    "correct_answer": "Nitrogen",
    "_created_at": {
      "$date": "2024-10-23T07:40:41.979Z"
    },
    "_updated_at": {
      "$date": "2024-10-23T07:40:41.979Z"
    },
    "usedTimes": 0
  },
  {
    "_id": "C8NxCUXWuC",
    "options": [
      "Diamond",
      "Gold",
      "Iron",
      "Quartz"
    ],
    "_p_quiz": "hBr37xRuFC",
    "question": "What is the hardest natural substance on Earth?",
    "correct_answer": "Diamond",
    "_created_at": {
      "$date": "2024-10-23T07:40:41.979Z"
    },
    "_updated_at": {
      "$date": "2024-10-23T07:40:41.979Z"
    },
    "usedTimes": 0
  },
  {
    "_id": "ZfZAD6uSpJ",
    "options": [
      "Au",
      "Ag",
      "Pb",
      "Fe"
    ],
    "_p_quiz": "hBr37xRuFC",
    "question": "What is the chemical symbol for gold?",
    "correct_answer": "Au",
    "_created_at": {
      "$date": "2024-10-23T07:40:41.979Z"
    },
    "_updated_at": {
      "$date": "2024-10-23T07:40:41.979Z"
    },
    "usedTimes": 0
  },
  {
    "_id": "IvZXV1dPRi",
    "options": [
      "Cell",
      "Molecule",
      "Atom",
      "Organ"
    ],
    "_p_quiz": "hBr37xRuFC",
    "question": "What is the smallest unit of life?",
    "correct_answer": "Cell",
    "_created_at": {
      "$date": "2024-10-23T07:40:41.979Z"
    },
    "_updated_at": {
      "$date": "2024-10-23T07:40:41.979Z"
    },
    "usedTimes": 0
  },
  {
    "_id": "DanN2S7jyR",
    "options": [
      "The Sun",
      "The Moon",
      "The Earth's core",
      "Volcanoes"
    ],
    "_p_quiz": "hBr37xRuFC",
    "question": "What is the primary source of energy for the Earth?",
    "correct_answer": "The Sun",
    "_created_at": {
      "$date": "2024-10-23T07:40:41.979Z"
    },
    "_updated_at": {
      "$date": "2024-10-23T07:40:41.979Z"
    },
    "usedTimes": 0
  },
  {
    "_id": "K1IGw8BwpV",
    "options": [
      "Carbon dioxide",
      "Oxygen",
      "Nitrogen",
      "Hydrogen"
    ],
    "_p_quiz": "hBr37xRuFC",
    "question": "What gas do plants absorb from the atmosphere?",
    "correct_answer": "Carbon dioxide",
    "_created_at": {
      "$date": "2024-10-23T07:40:41.979Z"
    },
    "_updated_at": {
      "$date": "2024-10-23T07:40:41.979Z"
    },
    "usedTimes": 0
  },
  {
    "_id": "2xN09GVkG9",
    "options": [
      "Evaporation",
      "Condensation",
      "Sublimation",
      "Deposition"
    ],
    "_p_quiz": "hBr37xRuFC",
    "question": "What is the process of converting a liquid to a gas called?",
    "correct_answer": "Evaporation",
    "_created_at": {
      "$date": "2024-10-23T07:40:41.979Z"
    },
    "_updated_at": {
      "$date": "2024-10-23T07:40:41.979Z"
    },
    "usedTimes": 0
  },
  {
    "_id": "IsvTrHpsof",
    "options": [
      "Nucleus",
      "Electron",
      "Proton",
      "Neutron"
    ],
    "_p_quiz": "hBr37xRuFC",
    "question": "What is the center of an atom called?",
    "correct_answer": "Nucleus",
    "_created_at": {
      "$date": "2024-10-23T07:40:41.979Z"
    },
    "_updated_at": {
      "$date": "2024-10-23T07:40:41.979Z"
    },
    "usedTimes": 0
  },
  {
    "_id": "HsBfI2MEha",
    "options": [
      "Pollen",
      "Nectar",
      "Sap",
      "Seeds"
    ],
    "_p_quiz": "hBr37xRuFC",
    "question": "What do bees collect from flowers?",
    "correct_answer": "Pollen",
    "_created_at": {
      "$date": "2024-10-23T07:40:41.979Z"
    },
    "_updated_at": {
      "$date": "2024-10-23T07:40:41.979Z"
    },
    "usedTimes": 0
  },
  {
    "_id": "4hfOCYid6R",
    "options": [
      "Jupiter",
      "Saturn",
      "Earth",
      "Mars"
    ],
    "_p_quiz": "hBr37xRuFC",
    "question": "What is the largest planet in our solar system?",
    "correct_answer": "Jupiter",
    "_created_at": {
      "$date": "2024-10-23T07:40:41.979Z"
    },
    "_updated_at": {
      "$date": "2024-10-23T07:40:41.979Z"
    },
    "usedTimes": 0
  },
  {
    "_id": "WNcEhG6LBS",
    "options": [
      "Heart",
      "Liver",
      "Lungs",
      "Kidneys"
    ],
    "_p_quiz": "hBr37xRuFC",
    "question": "What organ is responsible for pumping blood throughout the body?",
    "correct_answer": "Heart",
    "_created_at": {
      "$date": "2024-10-23T07:40:41.979Z"
    },
    "_updated_at": {
      "$date": "2024-10-23T07:40:41.979Z"
    },
    "usedTimes": 0
  },
  {
    "_id": "jSWmPCg51Q",
    "options": [
      "NaCl",
      "KCl",
      "CaCO3",
      "MgSO4"
    ],
    "_p_quiz": "hBr37xRuFC",
    "question": "What is the chemical formula for table salt?",
    "correct_answer": "NaCl",
    "_created_at": {
      "$date": "2024-10-23T07:40:42.185Z"
    },
    "_updated_at": {
      "$date": "2024-10-23T07:40:42.185Z"
    },
    "usedTimes": 0
  },
  {
    "_id": "zWNkkWX7GD",
    "options": [
      "Nitrogen",
      "Oxygen",
      "Carbon dioxide",
      "Argon"
    ],
    "_p_quiz": "hBr37xRuFC",
    "question": "What is the most abundant gas in the Earth's atmosphere?",
    "correct_answer": "Nitrogen",
    "_created_at": {
      "$date": "2024-10-23T07:40:42.185Z"
    },
    "_updated_at": {
      "$date": "2024-10-23T07:40:42.185Z"
    },
    "usedTimes": 0
  },
  {
    "_id": "Ft6QZuHWbA",
    "options": [
      "Photosynthesis",
      "Respiration",
      "Reproduction",
      "Digestion"
    ],
    "_p_quiz": "hBr37xRuFC",
    "question": "What is the main function of leaves?",
    "correct_answer": "Photosynthesis",
    "_created_at": {
      "$date": "2024-10-23T07:40:42.185Z"
    },
    "_updated_at": {
      "$date": "2024-10-23T07:40:42.185Z"
    },
    "usedTimes": 0
  },
  {
    "_id": "8SYde4t7eL",
    "options": [
      "Femur",
      "Tibia",
      "Humerus",
      "Skull"
    ],
    "_p_quiz": "hBr37xRuFC",
    "question": "What is the largest bone in the human body?",
    "correct_answer": "Femur",
    "_created_at": {
      "$date": "2024-10-23T07:40:42.185Z"
    },
    "_updated_at": {
      "$date": "2024-10-23T07:40:42.185Z"
    },
    "usedTimes": 0
  },
  {
    "_id": "NKw0y9QGbP",
    "options": [
      "Mammal",
      "Fish",
      "Reptile",
      "Bird"
    ],
    "_p_quiz": "hBr37xRuFC",
    "question": "What type of animal is a dolphin?",
    "correct_answer": "Mammal",
    "_created_at": {
      "$date": "2024-10-23T07:40:42.185Z"
    },
    "_updated_at": {
      "$date": "2024-10-23T07:40:42.185Z"
    },
    "usedTimes": 0
  },
  {
    "_id": "HGEf1YPmpn",
    "options": [
      "Hydrogen",
      "Oxygen",
      "Carbon",
      "Helium"
    ],
    "_p_quiz": "hBr37xRuFC",
    "question": "What is the most common element in the universe?",
    "correct_answer": "Hydrogen",
    "_created_at": {
      "$date": "2024-10-23T07:40:42.185Z"
    },
    "_updated_at": {
      "$date": "2024-10-23T07:40:42.185Z"
    },
    "usedTimes": 0
  },
  {
    "_id": "1Ay3K6Z9UN",
    "options": [
      "Mitochondria",
      "Nucleus",
      "Ribosome",
      "Chloroplast"
    ],
    "_p_quiz": "hBr37xRuFC",
    "question": "What part of the cell is responsible for energy production?",
    "correct_answer": "Mitochondria",
    "_created_at": {
      "$date": "2024-10-23T07:40:42.185Z"
    },
    "_updated_at": {
      "$date": "2024-10-23T07:40:42.185Z"
    },
    "usedTimes": 0
  },
  {
    "_id": "5wTfcDw9on",
    "options": [
      "Atom",
      "Molecule",
      "Proton",
      "Neutron"
    ],
    "_p_quiz": "hBr37xRuFC",
    "question": "What is the smallest particle of an element?",
    "correct_answer": "Atom",
    "_created_at": {
      "$date": "2024-10-23T07:40:42.186Z"
    },
    "_updated_at": {
      "$date": "2024-10-23T07:40:42.186Z"
    },
    "usedTimes": 0
  },
  {
    "_id": "FXx9wBFsgm",
    "options": [
      "0°C",
      "100°C",
      "32°C",
      "50°C"
    ],
    "_p_quiz": "hBr37xRuFC",
    "question": "What is the freezing point of water?",
    "correct_answer": "0°C",
    "_created_at": {
      "$date": "2024-10-23T07:40:42.185Z"
    },
    "_updated_at": {
      "$date": "2024-10-23T07:40:42.185Z"
    },
    "usedTimes": 0
  },
  {
    "_id": "5fiECRFQxH",
    "options": [
      "Hydrogen",
      "Helium",
      "Carbon",
      "Iron"
    ],
    "_p_quiz": "hBr37xRuFC",
    "question": "What is the main component of the sun?",
    "correct_answer": "Hydrogen",
    "_created_at": {
      "$date": "2024-10-23T07:40:42.185Z"
    },
    "_updated_at": {
      "$date": "2024-10-23T07:40:42.185Z"
    },
    "usedTimes": 0
  },
  {
    "_id": "RHk6VnFZ4Y",
    "options": [
      "Herbivores",
      "Carnivores",
      "Omnivores",
      "Insectivores"
    ],
    "_p_quiz": "hBr37xRuFC",
    "question": "What is the term for animals that eat only plants?",
    "correct_answer": "Herbivores",
    "_created_at": {
      "$date": "2024-10-23T07:40:42.186Z"
    },
    "_updated_at": {
      "$date": "2024-10-23T07:40:42.186Z"
    },
    "usedTimes": 0
  },
  {
    "_id": "M5QET7BI61",
    "options": [
      "Liver",
      "Kidneys",
      "Heart",
      "Lungs"
    ],
    "_p_quiz": "hBr37xRuFC",
    "question": "What is the main organ responsible for detoxifying chemicals in the body?",
    "correct_answer": "Liver",
    "_created_at": {
      "$date": "2024-10-23T07:40:42.186Z"
    },
    "_updated_at": {
      "$date": "2024-10-23T07:40:42.186Z"
    },
    "usedTimes": 0
  },
  {
    "_id": "lJodeU4jVM",
    "options": [
      "Oxygen",
      "Carbon dioxide",
      "Nitrogen",
      "Methane"
    ],
    "_p_quiz": "hBr37xRuFC",
    "question": "What is the primary gas that plants release during photosynthesis?",
    "correct_answer": "Oxygen",
    "_created_at": {
      "$date": "2024-10-23T07:40:42.186Z"
    },
    "_updated_at": {
      "$date": "2024-10-23T07:40:42.186Z"
    },
    "usedTimes": 0
  },
  {
    "_id": "3GgFWtpD5H",
    "options": [
      "Milky Way",
      "Andromeda",
      "Whirlpool",
      "Sombrero"
    ],
    "_p_quiz": "hBr37xRuFC",
    "question": "What is the name of our galaxy?",
    "correct_answer": "Milky Way",
    "_created_at": {
      "$date": "2024-10-23T07:40:42.186Z"
    },
    "_updated_at": {
      "$date": "2024-10-23T07:40:42.186Z"
    },
    "usedTimes": 0
  },
  {
    "_id": "hC6qgMx8hI",
    "options": [
      "Cellulose",
      "Protein",
      "Lipids",
      "Starch"
    ],
    "_p_quiz": "hBr37xRuFC",
    "question": "What is the main structural component of plant cell walls?",
    "correct_answer": "Cellulose",
    "_created_at": {
      "$date": "2024-10-23T07:40:42.186Z"
    },
    "_updated_at": {
      "$date": "2024-10-23T07:40:42.186Z"
    },
    "usedTimes": 0
  },
  {
    "_id": "sTjJIIf4EG",
    "options": [
      "Newton",
      "Joule",
      "Watt",
      "Pascal"
    ],
    "_p_quiz": "hBr37xRuFC",
    "question": "What is the unit of force?",
    "correct_answer": "Newton",
    "_created_at": {
      "$date": "2024-10-23T07:40:42.185Z"
    },
    "_updated_at": {
      "$date": "2024-10-23T07:40:42.185Z"
    },
    "usedTimes": 0
  },
  {
    "_id": "n4fAEAoclC",
    "options": [
      "Biology",
      "Chemistry",
      "Physics",
      "Geology"
    ],
    "_p_quiz": "hBr37xRuFC",
    "question": "What is the study of living organisms called?",
    "correct_answer": "Biology",
    "_created_at": {
      "$date": "2024-10-23T07:40:42.185Z"
    },
    "_updated_at": {
      "$date": "2024-10-23T07:40:42.185Z"
    },
    "usedTimes": 0
  },
  {
    "_id": "Mi1v2JGfkR",
    "options": [
      "Leaves",
      "Roots",
      "Stems",
      "Flowers"
    ],
    "_p_quiz": "hBr37xRuFC",
    "question": "What part of the plant conducts photosynthesis?",
    "correct_answer": "Leaves",
    "_created_at": {
      "$date": "2024-10-23T07:40:42.185Z"
    },
    "_updated_at": {
      "$date": "2024-10-23T07:40:42.185Z"
    },
    "usedTimes": 0
  },
  {
    "_id": "fsEkAvzZJr",
    "options": [
      "Water cycle",
      "Precipitation",
      "Infiltration",
      "Transpiration"
    ],
    "_p_quiz": "hBr37xRuFC",
    "question": "What is the process of water cycle evaporation followed by condensation called?",
    "correct_answer": "Water cycle",
    "_created_at": {
      "$date": "2024-10-23T07:40:42.186Z"
    },
    "_updated_at": {
      "$date": "2024-10-23T07:40:42.186Z"
    },
    "usedTimes": 0
  },
  {
    "_id": "FerfKR9vO9",
    "options": [
      "Oxygen",
      "Nitrogen",
      "Carbon dioxide",
      "Argon"
    ],
    "_p_quiz": "hBr37xRuFC",
    "question": "What is the second most abundant gas in the Earth's atmosphere?",
    "correct_answer": "Oxygen",
    "_created_at": {
      "$date": "2024-10-23T07:40:42.186Z"
    },
    "_updated_at": {
      "$date": "2024-10-23T07:40:42.186Z"
    },
    "usedTimes": 0
  },
  {
    "_id": "z1t9BHbTVv",
    "options": [
      "Absorb water and nutrients",
      "Photosynthesis",
      "Reproduction",
      "Provide support"
    ],
    "_p_quiz": "hBr37xRuFC",
    "question": "What is the main function of the roots of a plant?",
    "correct_answer": "Absorb water and nutrients",
    "_created_at": {
      "$date": "2024-10-23T07:40:42.379Z"
    },
    "_updated_at": {
      "$date": "2024-10-23T07:40:42.379Z"
    },
    "usedTimes": 0
  },
  {
    "_id": "zWwYXvK6QA",
    "options": [
      "Oxygen",
      "Silicon",
      "Aluminum",
      "Iron"
    ],
    "_p_quiz": "hBr37xRuFC",
    "question": "What is the most abundant element in the Earth's crust?",
    "correct_answer": "Oxygen",
    "_created_at": {
      "$date": "2024-10-23T07:40:42.379Z"
    },
    "_updated_at": {
      "$date": "2024-10-23T07:40:42.379Z"
    },
    "usedTimes": 0
  },
  {
    "_id": "cgCMk81hqD",
    "options": [
      "Evolution",
      "Revolution",
      "Adaptation",
      "Mutation"
    ],
    "_p_quiz": "hBr37xRuFC",
    "question": "What is the term for a change in a species over time?",
    "correct_answer": "Evolution",
    "_created_at": {
      "$date": "2024-10-23T07:40:42.379Z"
    },
    "_updated_at": {
      "$date": "2024-10-23T07:40:42.379Z"
    },
    "usedTimes": 0
  },
  {
    "_id": "nchDDx91sB",
    "options": [
      "Fight infections",
      "Transport oxygen",
      "Clot blood",
      "Carry nutrients"
    ],
    "_p_quiz": "hBr37xRuFC",
    "question": "What is the primary role of white blood cells?",
    "correct_answer": "Fight infections",
    "_created_at": {
      "$date": "2024-10-23T07:40:42.379Z"
    },
    "_updated_at": {
      "$date": "2024-10-23T07:40:42.379Z"
    },
    "usedTimes": 0
  },
  {
    "_id": "ydSyNnb46M",
    "options": [
      "Photosynthesis",
      "Respiration",
      "Protein synthesis",
      "Cell division"
    ],
    "_p_quiz": "hBr37xRuFC",
    "question": "What is the main function of the chloroplasts in plant cells?",
    "correct_answer": "Photosynthesis",
    "_created_at": {
      "$date": "2024-10-23T07:40:42.379Z"
    },
    "_updated_at": {
      "$date": "2024-10-23T07:40:42.379Z"
    },
    "usedTimes": 0
  },
  {
    "_id": "n4hHk53Wrl",
    "options": [
      "Sunlight",
      "Water",
      "Carbon dioxide",
      "Oxygen"
    ],
    "_p_quiz": "hBr37xRuFC",
    "question": "What is the main source of energy for photosynthesis?",
    "correct_answer": "Sunlight",
    "_created_at": {
      "$date": "2024-10-23T07:40:42.379Z"
    },
    "_updated_at": {
      "$date": "2024-10-23T07:40:42.379Z"
    },
    "usedTimes": 0
  },
  {
    "_id": "BxcrAuULBh",
    "options": [
      "Photosynthesis",
      "Respiration",
      "Fermentation",
      "Digestion"
    ],
    "_p_quiz": "hBr37xRuFC",
    "question": "What is the process by which green plants use sunlight to synthesize foods from carbon dioxide and water?",
    "correct_answer": "Photosynthesis",
    "_created_at": {
      "$date": "2024-10-23T07:40:42.379Z"
    },
    "_updated_at": {
      "$date": "2024-10-23T07:40:42.379Z"
    },
    "usedTimes": 0
  },
  {
    "_id": "MkxanVQ1on",
    "options": [
      "Mass",
      "Volume",
      "Density",
      "Weight"
    ],
    "_p_quiz": "hBr37xRuFC",
    "question": "What is the term for the amount of matter in an object?",
    "correct_answer": "Mass",
    "_created_at": {
      "$date": "2024-10-23T07:40:42.379Z"
    },
    "_updated_at": {
      "$date": "2024-10-23T07:40:42.379Z"
    },
    "usedTimes": 0
  },
  {
    "_id": "qTLyhXfWl9",
    "options": [
      "Transpiration",
      "Evaporation",
      "Condensation",
      "Respiration"
    ],
    "_p_quiz": "hBr37xRuFC",
    "question": "What is the process by which plants lose water vapor through their leaves?",
    "correct_answer": "Transpiration",
    "_created_at": {
      "$date": "2024-10-23T07:40:42.379Z"
    },
    "_updated_at": {
      "$date": "2024-10-23T07:40:42.379Z"
    },
    "usedTimes": 0
  },
  {
    "_id": "NrROSASe6T",
    "options": [
      "Freezing",
      "Melting",
      "Condensation",
      "Sublimation"
    ],
    "_p_quiz": "hBr37xRuFC",
    "question": "What is the process by which a liquid turns into a solid?",
    "correct_answer": "Freezing",
    "_created_at": {
      "$date": "2024-10-23T07:40:42.379Z"
    },
    "_updated_at": {
      "$date": "2024-10-23T07:40:42.379Z"
    },
    "usedTimes": 0
  },
  {
    "_id": "dHlZL7aDQ6",
    "options": [
      "Friction",
      "Gravity",
      "Inertia",
      "Momentum"
    ],
    "_p_quiz": "hBr37xRuFC",
    "question": "What is the term for the force that opposes motion between two surfaces that are in contact?",
    "correct_answer": "Friction",
    "_created_at": {
      "$date": "2024-10-23T07:40:42.379Z"
    },
    "_updated_at": {
      "$date": "2024-10-23T07:40:42.379Z"
    },
    "usedTimes": 0
  },
  {
    "_id": "Mx5Cuzi8ez",
    "options": [
      "Potential energy",
      "Kinetic energy",
      "Thermal energy",
      "Chemical energy"
    ],
    "_p_quiz": "hBr37xRuFC",
    "question": "What is the term for the energy stored in an object due to its position or condition?",
    "correct_answer": "Potential energy",
    "_created_at": {
      "$date": "2024-10-23T07:40:42.379Z"
    },
    "_updated_at": {
      "$date": "2024-10-23T07:40:42.379Z"
    },
    "usedTimes": 0
  },
  {
    "_id": "kYpJPKBjdJ",
    "options": [
      "Magnetic field",
      "Electric field",
      "Gravitational field",
      "Nuclear field"
    ],
    "_p_quiz": "hBr37xRuFC",
    "question": "What is the term for the region around a magnet where the force of magnetism acts?",
    "correct_answer": "Magnetic field",
    "_created_at": {
      "$date": "2024-10-23T07:40:42.379Z"
    },
    "_updated_at": {
      "$date": "2024-10-23T07:40:42.379Z"
    },
    "usedTimes": 0
  },
  {
    "_id": "re0AIfcaQY",
    "options": [
      "Transport oxygen",
      "Fight infections",
      "Clot blood",
      "Carry nutrients"
    ],
    "_p_quiz": "hBr37xRuFC",
    "question": "What is the main function of red blood cells?",
    "correct_answer": "Transport oxygen",
    "_created_at": {
      "$date": "2024-10-23T07:40:42.379Z"
    },
    "_updated_at": {
      "$date": "2024-10-23T07:40:42.379Z"
    },
    "usedTimes": 0
  },
  {
    "_id": "uzdVXFnTUW",
    "options": [
      "Molecule",
      "Atom",
      "Ion",
      "Electron"
    ],
    "_p_quiz": "hBr37xRuFC",
    "question": "What is the term for the smallest particle of a compound that can exist alone?",
    "correct_answer": "Molecule",
    "_created_at": {
      "$date": "2024-10-23T07:40:42.379Z"
    },
    "_updated_at": {
      "$date": "2024-10-23T07:40:42.379Z"
    },
    "usedTimes": 0
  },
  {
    "_id": "fdsA6oV0Z5",
    "options": [
      "DNA",
      "RNA",
      "Protein",
      "Enzyme"
    ],
    "_p_quiz": "hBr37xRuFC",
    "question": "What is the term for the genetic material that carries information about an organism and is passed from parent to offspring?",
    "correct_answer": "DNA",
    "_created_at": {
      "$date": "2024-10-23T07:40:42.379Z"
    },
    "_updated_at": {
      "$date": "2024-10-23T07:40:42.379Z"
    },
    "usedTimes": 0
  },
  {
    "_id": "GhpOQ6ZAt1",
    "options": [
      "Volume",
      "Mass",
      "Density",
      "Weight"
    ],
    "_p_quiz": "hBr37xRuFC",
    "question": "What is the term for the amount of space an object occupies?",
    "correct_answer": "Volume",
    "_created_at": {
      "$date": "2024-10-23T07:40:42.379Z"
    },
    "_updated_at": {
      "$date": "2024-10-23T07:40:42.379Z"
    },
    "usedTimes": 0
  },
  {
    "_id": "8LKDYXn6Mz",
    "options": [
      "Break down food",
      "Transport oxygen",
      "Fight infections",
      "Provide support"
    ],
    "_p_quiz": "hBr37xRuFC",
    "question": "What is the main function of the digestive system?",
    "correct_answer": "Break down food",
    "_created_at": {
      "$date": "2024-10-23T07:40:42.379Z"
    },
    "_updated_at": {
      "$date": "2024-10-23T07:40:42.379Z"
    },
    "usedTimes": 0
  },
  {
    "_id": "W9YJIIQgxE",
    "options": [
      "Kinetic energy",
      "Potential energy",
      "Thermal energy",
      "Chemical energy"
    ],
    "_p_quiz": "hBr37xRuFC",
    "question": "What is the term for the energy of motion?",
    "correct_answer": "Kinetic energy",
    "_created_at": {
      "$date": "2024-10-23T07:40:42.379Z"
    },
    "_updated_at": {
      "$date": "2024-10-23T07:40:42.379Z"
    },
    "usedTimes": 0
  },
  {
    "_id": "e0eQL5d9AB",
    "options": [
      "Condensation",
      "Evaporation",
      "Sublimation",
      "Precipitation"
    ],
    "_p_quiz": "hBr37xRuFC",
    "question": "What is the term for the process by which water vapor becomes liquid water?",
    "correct_answer": "Condensation",
    "_created_at": {
      "$date": "2024-10-23T07:40:42.379Z"
    },
    "_updated_at": {
      "$date": "2024-10-23T07:40:42.379Z"
    },
    "usedTimes": 0
  },
  {
    "_id": "2s6VdFa61w",
    "options": [
      "Osmosis",
      "Diffusion",
      "Filtration",
      "Active transport"
    ],
    "_p_quiz": "hBr37xRuFC",
    "question": "What is the term for the movement of water across a selectively permeable membrane?",
    "correct_answer": "Osmosis",
    "_created_at": {
      "$date": "2024-10-23T07:40:42.553Z"
    },
    "_updated_at": {
      "$date": "2024-10-23T07:40:42.553Z"
    },
    "usedTimes": 0
  },
  {
    "_id": "xeFGqlcpFC",
    "options": [
      "Force",
      "Energy",
      "Power",
      "Work"
    ],
    "_p_quiz": "hBr37xRuFC",
    "question": "What is the term for a push or pull on an object that can cause it to accelerate?",
    "correct_answer": "Force",
    "_created_at": {
      "$date": "2024-10-23T07:40:42.553Z"
    },
    "_updated_at": {
      "$date": "2024-10-23T07:40:42.553Z"
    },
    "usedTimes": 0
  },
  {
    "_id": "3IwFvm2UOO",
    "options": [
      "Evaporation",
      "Condensation",
      "Sublimation",
      "Freezing"
    ],
    "_p_quiz": "hBr37xRuFC",
    "question": "What is the term for the change of state from a liquid to a gas?",
    "correct_answer": "Evaporation",
    "_created_at": {
      "$date": "2024-10-23T07:40:42.553Z"
    },
    "_updated_at": {
      "$date": "2024-10-23T07:40:42.553Z"
    },
    "usedTimes": 0
  },
  {
    "_id": "HuZLXG6ntK",
    "options": [
      "Transport nutrients and oxygen",
      "Digest food",
      "Fight infections",
      "Provide support"
    ],
    "_p_quiz": "hBr37xRuFC",
    "question": "What is the main function of the circulatory system?",
    "correct_answer": "Transport nutrients and oxygen",
    "_created_at": {
      "$date": "2024-10-23T07:40:42.553Z"
    },
    "_updated_at": {
      "$date": "2024-10-23T07:40:42.553Z"
    },
    "usedTimes": 0
  },
  {
    "_id": "Z4pcNECPoJ",
    "options": [
      "Transpiration",
      "Evaporation",
      "Condensation",
      "Respiration"
    ],
    "_p_quiz": "hBr37xRuFC",
    "question": "What is the term for the process by which plants release water vapor into the air through stomata?",
    "correct_answer": "Transpiration",
    "_created_at": {
      "$date": "2024-10-23T07:40:42.553Z"
    },
    "_updated_at": {
      "$date": "2024-10-23T07:40:42.553Z"
    },
    "usedTimes": 0
  },
  {
    "_id": "vPj4k1k7mw",
    "options": [
      "Cellular respiration",
      "Photosynthesis",
      "Fermentation",
      "Glycolysis"
    ],
    "_p_quiz": "hBr37xRuFC",
    "question": "What is the term for the process by which cells obtain energy from glucose?",
    "correct_answer": "Cellular respiration",
    "_created_at": {
      "$date": "2024-10-23T07:40:42.553Z"
    },
    "_updated_at": {
      "$date": "2024-10-23T07:40:42.553Z"
    },
    "usedTimes": 0
  },
  {
    "_id": "EDFc8eqNx9",
    "options": [
      "Atom",
      "Molecule",
      "Ion",
      "Electron"
    ],
    "_p_quiz": "hBr37xRuFC",
    "question": "What is the term for the smallest unit of a chemical element?",
    "correct_answer": "Atom",
    "_created_at": {
      "$date": "2024-10-23T07:40:42.553Z"
    },
    "_updated_at": {
      "$date": "2024-10-23T07:40:42.553Z"
    },
    "usedTimes": 0
  },
  {
    "_id": "bhTJOUFSCb",
    "options": [
      "Metabolism",
      "Digestion",
      "Respiration",
      "Photosynthesis"
    ],
    "_p_quiz": "hBr37xRuFC",
    "question": "What is the term for the sum of all chemical reactions that occur within a living organism?",
    "correct_answer": "Metabolism",
    "_created_at": {
      "$date": "2024-10-23T07:40:42.553Z"
    },
    "_updated_at": {
      "$date": "2024-10-23T07:40:42.553Z"
    },
    "usedTimes": 0
  },
  {
    "_id": "sofJuDzyu4",
    "options": [
      "Homeostasis",
      "Metabolism",
      "Adaptation",
      "Evolution"
    ],
    "_p_quiz": "hBr37xRuFC",
    "question": "What is the term for the process by which organisms maintain a stable internal environment?",
    "correct_answer": "Homeostasis",
    "_created_at": {
      "$date": "2024-10-23T07:40:42.553Z"
    },
    "_updated_at": {
      "$date": "2024-10-23T07:40:42.553Z"
    },
    "usedTimes": 0
  },
  {
    "_id": "Zi5HGGMS6Z",
    "options": [
      "Ecology",
      "Biology",
      "Geology",
      "Chemistry"
    ],
    "_p_quiz": "hBr37xRuFC",
    "question": "What is the term for the study of the interactions among organisms and their environment?",
    "correct_answer": "Ecology",
    "_created_at": {
      "$date": "2024-10-23T07:40:42.553Z"
    },
    "_updated_at": {
      "$date": "2024-10-23T07:40:42.553Z"
    },
    "usedTimes": 0
  },
  {
    "_id": "ppLvTGwDir",
    "options": [
      "Exchange gases",
      "Transport nutrients",
      "Fight infections",
      "Provide support"
    ],
    "_p_quiz": "hBr37xRuFC",
    "question": "What is the main function of the respiratory system?",
    "correct_answer": "Exchange gases",
    "_created_at": {
      "$date": "2024-10-23T07:40:42.553Z"
    },
    "_updated_at": {
      "$date": "2024-10-23T07:40:42.553Z"
    },
    "usedTimes": 0
  },
  {
    "_id": "r7uxuiFpcZ",
    "options": [
      "Condensation",
      "Evaporation",
      "Sublimation",
      "Freezing"
    ],
    "_p_quiz": "hBr37xRuFC",
    "question": "What is the term for the change of state from a gas to a liquid?",
    "correct_answer": "Condensation",
    "_created_at": {
      "$date": "2024-10-23T07:40:42.553Z"
    },
    "_updated_at": {
      "$date": "2024-10-23T07:40:42.553Z"
    },
    "usedTimes": 0
  },
  {
    "_id": "nEAHHsiQsP",
    "options": [
      "Provide support",
      "Transport oxygen",
      "Digest food",
      "Exchange gases"
    ],
    "_p_quiz": "hBr37xRuFC",
    "question": "What is the main function of the skeletal system?",
    "correct_answer": "Provide support",
    "_created_at": {
      "$date": "2024-10-23T07:40:42.553Z"
    },
    "_updated_at": {
      "$date": "2024-10-23T07:40:42.553Z"
    },
    "usedTimes": 0
  },
  {
    "_id": "Cuf4B921Hg",
    "options": [
      "Species",
      "Genus",
      "Family",
      "Order"
    ],
    "_p_quiz": "hBr37xRuFC",
    "question": "What is the term for a group of similar organisms that can breed and produce fertile offspring?",
    "correct_answer": "Species",
    "_created_at": {
      "$date": "2024-10-23T07:40:42.553Z"
    },
    "_updated_at": {
      "$date": "2024-10-23T07:40:42.553Z"
    },
    "usedTimes": 0
  },
  {
    "_id": "LHoU4m2zOd",
    "options": [
      "Element",
      "Compound",
      "Mixture",
      "Solution"
    ],
    "_p_quiz": "hBr37xRuFC",
    "question": "What is the term for a substance that cannot be broken down into simpler substances?",
    "correct_answer": "Element",
    "_created_at": {
      "$date": "2024-10-23T07:40:42.553Z"
    },
    "_updated_at": {
      "$date": "2024-10-23T07:40:42.553Z"
    },
    "usedTimes": 0
  },
  {
    "_id": "naIMfS0Rrs",
    "options": [
      "Control and coordinate body activities",
      "Transport nutrients",
      "Exchange gases",
      "Provide support"
    ],
    "_p_quiz": "hBr37xRuFC",
    "question": "What is the main function of the nervous system?",
    "correct_answer": "Control and coordinate body activities",
    "_created_at": {
      "$date": "2024-10-23T07:40:42.553Z"
    },
    "_updated_at": {
      "$date": "2024-10-23T07:40:42.553Z"
    },
    "usedTimes": 0
  },
  {
    "_id": "Vg7iLPDyoD",
    "options": [
      "Diffusion",
      "Osmosis",
      "Active transport",
      "Filtration"
    ],
    "_p_quiz": "hBr37xRuFC",
    "question": "What is the term for the movement of particles from an area of high concentration to an area of low concentration?",
    "correct_answer": "Diffusion",
    "_created_at": {
      "$date": "2024-10-23T07:40:42.553Z"
    },
    "_updated_at": {
      "$date": "2024-10-23T07:40:42.553Z"
    },
    "usedTimes": 0
  },
  {
    "_id": "LV4EanBgoX",
    "options": [
      "Heat",
      "Work",
      "Power",
      "Energy"
    ],
    "_p_quiz": "hBr37xRuFC",
    "question": "What is the term for the energy transferred between objects that are at different temperatures?",
    "correct_answer": "Heat",
    "_created_at": {
      "$date": "2024-10-23T07:40:42.553Z"
    },
    "_updated_at": {
      "$date": "2024-10-23T07:40:42.553Z"
    },
    "usedTimes": 0
  },
  {
    "_id": "KILAHkCitN",
    "options": [
      "Sublimation",
      "Evaporation",
      "Condensation",
      "Freezing"
    ],
    "_p_quiz": "hBr37xRuFC",
    "question": "What is the term for the process by which a solid changes directly into a gas?",
    "correct_answer": "Sublimation",
    "_created_at": {
      "$date": "2024-10-23T07:40:42.553Z"
    },
    "_updated_at": {
      "$date": "2024-10-23T07:40:42.553Z"
    },
    "usedTimes": 0
  },
  {
    "_id": "HQqfHoWEz2",
    "options": [
      "Element",
      "Compound",
      "Mixture",
      "Solution"
    ],
    "_p_quiz": "hBr37xRuFC",
    "question": "What is the term for a substance made up of only one type of atom?",
    "correct_answer": "Element",
    "_created_at": {
      "$date": "2024-10-23T07:40:42.553Z"
    },
    "_updated_at": {
      "$date": "2024-10-23T07:40:42.553Z"
    },
    "usedTimes": 0
  },
  {
    "_id": "JIhHiv1RWi",
    "options": [
      "I can't believe it's not butter.",
      "I cant believe its not butter.",
      "I cant believe it's not butter.",
      "I can't believe its not butter."
    ],
    "_p_quiz": "BlWYmsLwaI",
    "question": "Which sentence is correctly punctuated?",
    "correct_answer": "I can't believe it's not butter.",
    "_created_at": {
      "$date": "2024-10-23T08:38:19.499Z"
    },
    "_updated_at": {
      "$date": "2024-10-23T08:38:19.499Z"
    },
    "usedTimes": 0
  },
  {
    "_id": "60SybbNUYO",
    "options": [
      "cat",
      "slept",
      "on",
      "the"
    ],
    "_p_quiz": "BlWYmsLwaI",
    "question": "Which word is a noun in the sentence: 'The cat slept on the mat'?",
    "correct_answer": "cat",
    "_created_at": {
      "$date": "2024-10-23T08:38:19.499Z"
    },
    "_updated_at": {
      "$date": "2024-10-23T08:38:19.499Z"
    },
    "usedTimes": 0
  },
  {
    "_id": "fy8kou1qym",
    "options": [
      "quick",
      "jumps",
      "over",
      "dog"
    ],
    "_p_quiz": "BlWYmsLwaI",
    "question": "Which word is an adjective in the sentence: 'The quick brown fox jumps over the lazy dog'?",
    "correct_answer": "quick",
    "_created_at": {
      "$date": "2024-10-23T08:38:19.499Z"
    },
    "_updated_at": {
      "$date": "2024-10-23T08:38:19.499Z"
    },
    "usedTimes": 0
  },
  {
    "_id": "Axf0JWxhqx",
    "options": [
      "ran",
      "runned",
      "running",
      "runs"
    ],
    "_p_quiz": "BlWYmsLwaI",
    "question": "What is the past tense of 'run'?",
    "correct_answer": "ran",
    "_created_at": {
      "$date": "2024-10-23T08:38:19.499Z"
    },
    "_updated_at": {
      "$date": "2024-10-23T08:38:19.499Z"
    },
    "usedTimes": 0
  },
  {
    "_id": "4W2x3sPEXw",
    "options": [
      "She will go to the market.",
      "She went to the market.",
      "She goes to the market.",
      "She is going to the market."
    ],
    "_p_quiz": "BlWYmsLwaI",
    "question": "Which sentence is written in the future tense?",
    "correct_answer": "She will go to the market.",
    "_created_at": {
      "$date": "2024-10-23T08:38:19.499Z"
    },
    "_updated_at": {
      "$date": "2024-10-23T08:38:19.499Z"
    },
    "usedTimes": 0
  },
  {
    "_id": "ljKa8mAmGY",
    "options": [
      "sings",
      "beautifully",
      "She",
      "none"
    ],
    "_p_quiz": "BlWYmsLwaI",
    "question": "Which word is an adverb in the sentence: 'She sings beautifully.'?",
    "correct_answer": "beautifully",
    "_created_at": {
      "$date": "2024-10-23T08:38:19.499Z"
    },
    "_updated_at": {
      "$date": "2024-10-23T08:38:19.499Z"
    },
    "usedTimes": 0
  },
  {
    "_id": "fHJ2EGX5pz",
    "options": [
      "studying",
      "has",
      "been",
      "for"
    ],
    "_p_quiz": "BlWYmsLwaI",
    "question": "What is the main verb in the sentence: 'She has been studying for hours.'?",
    "correct_answer": "studying",
    "_created_at": {
      "$date": "2024-10-23T08:38:19.500Z"
    },
    "_updated_at": {
      "$date": "2024-10-23T08:38:19.500Z"
    },
    "usedTimes": 0
  },
  {
    "_id": "l0j6PaEQw4",
    "options": [
      "The cake was eaten by the children.",
      "The children ate the cake.",
      "The cake is eating.",
      "The children are eating the cake."
    ],
    "_p_quiz": "BlWYmsLwaI",
    "question": "Which sentence is written in passive voice?",
    "correct_answer": "The cake was eaten by the children.",
    "_created_at": {
      "$date": "2024-10-23T08:38:19.499Z"
    },
    "_updated_at": {
      "$date": "2024-10-23T08:38:19.499Z"
    },
    "usedTimes": 0
  },
  {
    "_id": "Va2G1GkC5v",
    "options": [
      "goes",
      "go",
      "gone",
      "going"
    ],
    "_p_quiz": "BlWYmsLwaI",
    "question": "What is the correct form of the verb in the sentence: 'She _____ to the store every day.'?",
    "correct_answer": "goes",
    "_created_at": {
      "$date": "2024-10-23T08:38:19.499Z"
    },
    "_updated_at": {
      "$date": "2024-10-23T08:38:19.499Z"
    },
    "usedTimes": 0
  },
  {
    "_id": "dMIfypNHao",
    "options": [
      "She",
      "Her",
      "Hers",
      "She'll"
    ],
    "_p_quiz": "BlWYmsLwaI",
    "question": "Choose the correct pronoun to complete the sentence: '_____ is going to the store.'",
    "correct_answer": "She",
    "_created_at": {
      "$date": "2024-10-23T08:38:19.499Z"
    },
    "_updated_at": {
      "$date": "2024-10-23T08:38:19.499Z"
    },
    "usedTimes": 0
  },
  {
    "_id": "z9CFnq5js8",
    "options": [
      "Exclamatory",
      "Declarative",
      "Interrogative",
      "Imperative"
    ],
    "_p_quiz": "BlWYmsLwaI",
    "question": "What type of sentence is this: 'What a beautiful day!'?",
    "correct_answer": "Exclamatory",
    "_created_at": {
      "$date": "2024-10-23T08:38:19.499Z"
    },
    "_updated_at": {
      "$date": "2024-10-23T08:38:19.499Z"
    },
    "usedTimes": 0
  },
  {
    "_id": "JBK8bUvlhS",
    "options": [
      "eaten",
      "ate",
      "eating",
      "eats"
    ],
    "_p_quiz": "BlWYmsLwaI",
    "question": "What is the past participle of 'eat'?",
    "correct_answer": "eaten",
    "_created_at": {
      "$date": "2024-10-23T08:38:19.500Z"
    },
    "_updated_at": {
      "$date": "2024-10-23T08:38:19.500Z"
    },
    "usedTimes": 0
  },
  {
    "_id": "9FHTkH1WZ9",
    "options": [
      "They're going to their house over there.",
      "Their going to there house over they're.",
      "There going to their house over they're.",
      "They're going to there house over their."
    ],
    "_p_quiz": "BlWYmsLwaI",
    "question": "Which sentence uses the correct form of 'their', 'there', or 'they're'?",
    "correct_answer": "They're going to their house over there.",
    "_created_at": {
      "$date": "2024-10-23T08:38:19.500Z"
    },
    "_updated_at": {
      "$date": "2024-10-23T08:38:19.500Z"
    },
    "usedTimes": 0
  },
  {
    "_id": "BgRr7sjtGr",
    "options": [
      "its",
      "it's",
      "its'",
      "it"
    ],
    "_p_quiz": "BlWYmsLwaI",
    "question": "What is the possessive form of 'it'?",
    "correct_answer": "its",
    "_created_at": {
      "$date": "2024-10-23T08:38:19.500Z"
    },
    "_updated_at": {
      "$date": "2024-10-23T08:38:19.500Z"
    },
    "usedTimes": 0
  },
  {
    "_id": "uCGLJjBfcE",
    "options": [
      "best",
      "better",
      "goodest",
      "more good"
    ],
    "_p_quiz": "BlWYmsLwaI",
    "question": "What is the superlative form of 'good'?",
    "correct_answer": "best",
    "_created_at": {
      "$date": "2024-10-23T08:38:19.500Z"
    },
    "_updated_at": {
      "$date": "2024-10-23T08:38:19.500Z"
    },
    "usedTimes": 0
  },
  {
    "_id": "57oTWY4tR1",
    "options": [
      "mice",
      "mouses",
      "mouse",
      "mices"
    ],
    "_p_quiz": "BlWYmsLwaI",
    "question": "What is the plural form of 'mouse'?",
    "correct_answer": "mice",
    "_created_at": {
      "$date": "2024-10-23T08:38:19.499Z"
    },
    "_updated_at": {
      "$date": "2024-10-23T08:38:19.499Z"
    },
    "usedTimes": 0
  },
  {
    "_id": "MuSUhrAYB0",
    "options": [
      "I went to the store, and I bought some bread.",
      "I went to the store.",
      "Because I was hungry, I went to the store.",
      "I went to the store after school."
    ],
    "_p_quiz": "BlWYmsLwaI",
    "question": "Which is a compound sentence?",
    "correct_answer": "I went to the store, and I bought some bread.",
    "_created_at": {
      "$date": "2024-10-23T08:38:19.499Z"
    },
    "_updated_at": {
      "$date": "2024-10-23T08:38:19.499Z"
    },
    "usedTimes": 0
  },
  {
    "_id": "RDEub1RF2R",
    "options": [
      "sad",
      "glad",
      "joyful",
      "excited"
    ],
    "_p_quiz": "BlWYmsLwaI",
    "question": "What is an antonym for 'happy'?",
    "correct_answer": "sad",
    "_created_at": {
      "$date": "2024-10-23T08:38:19.500Z"
    },
    "_updated_at": {
      "$date": "2024-10-23T08:38:19.500Z"
    },
    "usedTimes": 0
  },
  {
    "_id": "eFHxfWx9Xc",
    "options": [
      "under",
      "cat",
      "is",
      "table"
    ],
    "_p_quiz": "BlWYmsLwaI",
    "question": "Which word is a preposition in the sentence: 'The cat is under the table.'?",
    "correct_answer": "under",
    "_created_at": {
      "$date": "2024-10-23T08:38:19.500Z"
    },
    "_updated_at": {
      "$date": "2024-10-23T08:38:19.500Z"
    },
    "usedTimes": 0
  },
  {
    "_id": "wbcjGr03EI",
    "options": [
      "but",
      "I",
      "to",
      "was"
    ],
    "_p_quiz": "BlWYmsLwaI",
    "question": "Which word is a conjunction in the sentence: 'I wanted to go, but I was too tired'?",
    "correct_answer": "but",
    "_created_at": {
      "$date": "2024-10-23T08:38:19.499Z"
    },
    "_updated_at": {
      "$date": "2024-10-23T08:38:19.499Z"
    },
    "usedTimes": 0
  },
  {
    "_id": "yELIPRbSPw",
    "options": [
      "best",
      "better",
      "good",
      "goodest"
    ],
    "_p_quiz": "BlWYmsLwaI",
    "question": "What is the correct form of 'good' in the sentence: 'She is the _____ student in the class.'?",
    "correct_answer": "best",
    "_created_at": {
      "$date": "2024-10-23T08:38:19.830Z"
    },
    "_updated_at": {
      "$date": "2024-10-23T08:38:19.830Z"
    },
    "usedTimes": 0
  },
  {
    "_id": "j1OAR7V8j3",
    "options": [
      "Wow",
      "that",
      "was",
      "amazing"
    ],
    "_p_quiz": "BlWYmsLwaI",
    "question": "Which word is an interjection in the sentence: 'Wow, that was amazing!'?",
    "correct_answer": "Wow",
    "_created_at": {
      "$date": "2024-10-23T08:38:19.829Z"
    },
    "_updated_at": {
      "$date": "2024-10-23T08:38:19.829Z"
    },
    "usedTimes": 0
  },
  {
    "_id": "zoWfGbCFF1",
    "options": [
      "Adverb",
      "Adjective",
      "Noun",
      "Verb"
    ],
    "_p_quiz": "BlWYmsLwaI",
    "question": "What part of speech is the word 'quickly'?",
    "correct_answer": "Adverb",
    "_created_at": {
      "$date": "2024-10-23T08:38:19.829Z"
    },
    "_updated_at": {
      "$date": "2024-10-23T08:38:19.829Z"
    },
    "usedTimes": 0
  },
  {
    "_id": "MzGBSzSVUP",
    "options": [
      "She said, 'I am tired.'",
      "She said that she was tired.",
      "She is tired, she said.",
      "She told me she was tired."
    ],
    "_p_quiz": "BlWYmsLwaI",
    "question": "Which sentence is an example of direct speech?",
    "correct_answer": "She said, 'I am tired.'",
    "_created_at": {
      "$date": "2024-10-23T08:38:19.829Z"
    },
    "_updated_at": {
      "$date": "2024-10-23T08:38:19.829Z"
    },
    "usedTimes": 0
  },
  {
    "_id": "vdQiqvXxRF",
    "options": [
      "I will go to the park",
      "if it stops raining",
      "go to the park",
      "if it stops"
    ],
    "_p_quiz": "BlWYmsLwaI",
    "question": "What is the main clause in the sentence: 'I will go to the park if it stops raining.'?",
    "correct_answer": "I will go to the park",
    "_created_at": {
      "$date": "2024-10-23T08:38:19.829Z"
    },
    "_updated_at": {
      "$date": "2024-10-23T08:38:19.829Z"
    },
    "usedTimes": 0
  },
  {
    "_id": "H0cpuqikEB",
    "options": [
      "The dog",
      "barked",
      "loudly",
      "The"
    ],
    "_p_quiz": "BlWYmsLwaI",
    "question": "What is the subject in the sentence: 'The dog barked loudly.'?",
    "correct_answer": "The dog",
    "_created_at": {
      "$date": "2024-10-23T08:38:19.830Z"
    },
    "_updated_at": {
      "$date": "2024-10-23T08:38:19.830Z"
    },
    "usedTimes": 0
  },
  {
    "_id": "xA5cWTJdnR",
    "options": [
      "What time is it?",
      "What time is it.",
      "What time is it!",
      "What time is it,"
    ],
    "_p_quiz": "BlWYmsLwaI",
    "question": "What is the correct punctuation for this sentence: 'What time is it'",
    "correct_answer": "What time is it?",
    "_created_at": {
      "$date": "2024-10-23T08:38:19.829Z"
    },
    "_updated_at": {
      "$date": "2024-10-23T08:38:19.829Z"
    },
    "usedTimes": 0
  },
  {
    "_id": "rseSPbxDgM",
    "options": [
      "and",
      "likes",
      "tea",
      "coffee"
    ],
    "_p_quiz": "BlWYmsLwaI",
    "question": "Which word is a conjunction in the sentence: 'She likes tea and coffee'?",
    "correct_answer": "and",
    "_created_at": {
      "$date": "2024-10-23T08:38:19.830Z"
    },
    "_updated_at": {
      "$date": "2024-10-23T08:38:19.830Z"
    },
    "usedTimes": 0
  },
  {
    "_id": "YiCU6B4yOt",
    "options": [
      "He",
      "going",
      "park",
      "to"
    ],
    "_p_quiz": "BlWYmsLwaI",
    "question": "Which word is a pronoun in the sentence: 'He is going to the park'?",
    "correct_answer": "He",
    "_created_at": {
      "$date": "2024-10-23T08:38:19.829Z"
    },
    "_updated_at": {
      "$date": "2024-10-23T08:38:19.829Z"
    },
    "usedTimes": 0
  },
  {
    "_id": "w8OVug1Uuy",
    "options": [
      "I went home because I was tired.",
      "I went home.",
      "I was tired.",
      "I went home and I was tired."
    ],
    "_p_quiz": "BlWYmsLwaI",
    "question": "Which sentence is a complex sentence?",
    "correct_answer": "I went home because I was tired.",
    "_created_at": {
      "$date": "2024-10-23T08:38:19.830Z"
    },
    "_updated_at": {
      "$date": "2024-10-23T08:38:19.830Z"
    },
    "usedTimes": 0
  },
  {
    "_id": "pBW9iUO4CF",
    "options": [
      "She had finished her homework.",
      "She finishes her homework.",
      "She will finish her homework.",
      "She is finishing her homework."
    ],
    "_p_quiz": "BlWYmsLwaI",
    "question": "Which sentence is in the past perfect tense?",
    "correct_answer": "She had finished her homework.",
    "_created_at": {
      "$date": "2024-10-23T08:38:19.830Z"
    },
    "_updated_at": {
      "$date": "2024-10-23T08:38:19.830Z"
    },
    "usedTimes": 0
  },
  {
    "_id": "1KiC1PQBzB",
    "options": [
      "un",
      "happy",
      "unha",
      "ppy"
    ],
    "_p_quiz": "BlWYmsLwaI",
    "question": "What is the prefix in the word 'unhappy'?",
    "correct_answer": "un",
    "_created_at": {
      "$date": "2024-10-23T08:38:19.829Z"
    },
    "_updated_at": {
      "$date": "2024-10-23T08:38:19.829Z"
    },
    "usedTimes": 0
  },
  {
    "_id": "TPXNSa9DLA",
    "options": [
      "I am reading a book.",
      "I read a book.",
      "I will read a book.",
      "I have read a book."
    ],
    "_p_quiz": "BlWYmsLwaI",
    "question": "Which sentence is in the present continuous tense?",
    "correct_answer": "I am reading a book.",
    "_created_at": {
      "$date": "2024-10-23T08:38:19.829Z"
    },
    "_updated_at": {
      "$date": "2024-10-23T08:38:19.829Z"
    },
    "usedTimes": 0
  },
  {
    "_id": "8or2lkb1jB",
    "options": [
      "faster",
      "fastest",
      "more fast",
      "most fast"
    ],
    "_p_quiz": "BlWYmsLwaI",
    "question": "What is the comparative form of 'fast'?",
    "correct_answer": "faster",
    "_created_at": {
      "$date": "2024-10-23T08:38:19.829Z"
    },
    "_updated_at": {
      "$date": "2024-10-23T08:38:19.829Z"
    },
    "usedTimes": 0
  },
  {
    "_id": "WEeczHmG2R",
    "options": [
      "are",
      "is",
      "was",
      "am"
    ],
    "_p_quiz": "BlWYmsLwaI",
    "question": "What is the correct form of 'to be' in the sentence: 'They _____ happy.'?",
    "correct_answer": "are",
    "_created_at": {
      "$date": "2024-10-23T08:38:19.829Z"
    },
    "_updated_at": {
      "$date": "2024-10-23T08:38:19.829Z"
    },
    "usedTimes": 0
  },
  {
    "_id": "vg4BYBZ14A",
    "options": [
      "play",
      "re",
      "playing",
      "replay"
    ],
    "_p_quiz": "BlWYmsLwaI",
    "question": "What is the root word of 'replaying'?",
    "correct_answer": "play",
    "_created_at": {
      "$date": "2024-10-23T08:38:19.829Z"
    },
    "_updated_at": {
      "$date": "2024-10-23T08:38:19.829Z"
    },
    "usedTimes": 0
  },
  {
    "_id": "A8ulmifGSo",
    "options": [
      "start",
      "end",
      "finish",
      "stop"
    ],
    "_p_quiz": "BlWYmsLwaI",
    "question": "What is a synonym for 'begin'?",
    "correct_answer": "start",
    "_created_at": {
      "$date": "2024-10-23T08:38:19.829Z"
    },
    "_updated_at": {
      "$date": "2024-10-23T08:38:19.829Z"
    },
    "usedTimes": 0
  },
  {
    "_id": "jtyD6zI3Fq",
    "options": [
      "beautiful long red",
      "red long beautiful",
      "long beautiful red",
      "red beautiful long"
    ],
    "_p_quiz": "BlWYmsLwaI",
    "question": "What is the correct order of adjectives in the sentence: 'She wore a _____ dress.'?",
    "correct_answer": "beautiful long red",
    "_created_at": {
      "$date": "2024-10-23T08:38:19.829Z"
    },
    "_updated_at": {
      "$date": "2024-10-23T08:38:19.829Z"
    },
    "usedTimes": 0
  },
  {
    "_id": "dwz3fpCrRL",
    "options": [
      "Please close the door.",
      "The door is closed.",
      "The door will be closed.",
      "The door was closed."
    ],
    "_p_quiz": "BlWYmsLwaI",
    "question": "Which sentence is an imperative sentence?",
    "correct_answer": "Please close the door.",
    "_created_at": {
      "$date": "2024-10-23T08:38:19.829Z"
    },
    "_updated_at": {
      "$date": "2024-10-23T08:38:19.829Z"
    },
    "usedTimes": 0
  },
  {
    "_id": "ZJtQn4MQhf",
    "options": [
      "ness",
      "happy",
      "hap",
      "iness"
    ],
    "_p_quiz": "BlWYmsLwaI",
    "question": "What is the suffix in the word 'happiness'?",
    "correct_answer": "ness",
    "_created_at": {
      "$date": "2024-10-23T08:38:19.830Z"
    },
    "_updated_at": {
      "$date": "2024-10-23T08:38:19.830Z"
    },
    "usedTimes": 0
  },
  {
    "_id": "AGeTo9vkuf",
    "options": [
      "chased",
      "cat",
      "mouse",
      "the"
    ],
    "_p_quiz": "BlWYmsLwaI",
    "question": "Which word is a verb in the sentence: 'The cat chased the mouse.'?",
    "correct_answer": "chased",
    "_created_at": {
      "$date": "2024-10-23T08:38:20.010Z"
    },
    "_updated_at": {
      "$date": "2024-10-23T08:38:20.010Z"
    },
    "usedTimes": 0
  },
  {
    "_id": "g72l9isl4X",
    "options": [
      "the ball",
      "He",
      "kicked",
      "the"
    ],
    "_p_quiz": "BlWYmsLwaI",
    "question": "What is the object in the sentence: 'He kicked the ball.'?",
    "correct_answer": "the ball",
    "_created_at": {
      "$date": "2024-10-23T08:38:20.010Z"
    },
    "_updated_at": {
      "$date": "2024-10-23T08:38:20.010Z"
    },
    "usedTimes": 0
  },
  {
    "_id": "zn9tjwYvDZ",
    "options": [
      "waiting",
      "have",
      "been",
      "for"
    ],
    "_p_quiz": "BlWYmsLwaI",
    "question": "What is the main verb in the sentence: 'They have been waiting for a long time.'?",
    "correct_answer": "waiting",
    "_created_at": {
      "$date": "2024-10-23T08:38:20.010Z"
    },
    "_updated_at": {
      "$date": "2024-10-23T08:38:20.010Z"
    },
    "usedTimes": 0
  },
  {
    "_id": "40834sNJVL",
    "options": [
      "It's raining outside.",
      "Its' raining outside.",
      "Its raining outside!",
      "It's' raining outside."
    ],
    "_p_quiz": "BlWYmsLwaI",
    "question": "What is the correct punctuation for this sentence: 'Its raining outside'",
    "correct_answer": "It's raining outside.",
    "_created_at": {
      "$date": "2024-10-23T08:38:20.010Z"
    },
    "_updated_at": {
      "$date": "2024-10-23T08:38:20.010Z"
    },
    "usedTimes": 0
  },
  {
    "_id": "7dDSpQiye5",
    "options": [
      "has",
      "have",
      "having",
      "had"
    ],
    "_p_quiz": "BlWYmsLwaI",
    "question": "What is the correct form of 'have' in the sentence: 'She _____ a new book.'?",
    "correct_answer": "has",
    "_created_at": {
      "$date": "2024-10-23T08:38:20.010Z"
    },
    "_updated_at": {
      "$date": "2024-10-23T08:38:20.010Z"
    },
    "usedTimes": 0
  },
  {
    "_id": "nKdylWB6Df",
    "options": [
      "small",
      "large",
      "huge",
      "great"
    ],
    "_p_quiz": "BlWYmsLwaI",
    "question": "What is an antonym for 'big'?",
    "correct_answer": "small",
    "_created_at": {
      "$date": "2024-10-23T08:38:20.010Z"
    },
    "_updated_at": {
      "$date": "2024-10-23T08:38:20.010Z"
    },
    "usedTimes": 0
  },
  {
    "_id": "VRYkCMWvT4",
    "options": [
      "Conjunction",
      "Noun",
      "Adjective",
      "Adverb"
    ],
    "_p_quiz": "BlWYmsLwaI",
    "question": "What part of speech is the word 'because'?",
    "correct_answer": "Conjunction",
    "_created_at": {
      "$date": "2024-10-23T08:38:20.010Z"
    },
    "_updated_at": {
      "$date": "2024-10-23T08:38:20.010Z"
    },
    "usedTimes": 0
  },
  {
    "_id": "DxbvU0qCsa",
    "options": [
      "you will pass the exam",
      "If you study hard",
      "study hard",
      "If you"
    ],
    "_p_quiz": "BlWYmsLwaI",
    "question": "What is the main clause in the sentence: 'If you study hard, you will pass the exam.'?",
    "correct_answer": "you will pass the exam",
    "_created_at": {
      "$date": "2024-10-23T08:38:20.010Z"
    },
    "_updated_at": {
      "$date": "2024-10-23T08:38:20.010Z"
    },
    "usedTimes": 0
  },
  {
    "_id": "3geDkd4fHN",
    "options": [
      "The birds",
      "are",
      "singing",
      "The"
    ],
    "_p_quiz": "BlWYmsLwaI",
    "question": "What is the subject in the sentence: 'The birds are singing.'?",
    "correct_answer": "The birds",
    "_created_at": {
      "$date": "2024-10-23T08:38:20.010Z"
    },
    "_updated_at": {
      "$date": "2024-10-23T08:38:20.010Z"
    },
    "usedTimes": 0
  },
  {
    "_id": "dZyAdLYAlM",
    "options": [
      "writing",
      "wrote",
      "written",
      "writes"
    ],
    "_p_quiz": "BlWYmsLwaI",
    "question": "What is the present participle of 'write'?",
    "correct_answer": "writing",
    "_created_at": {
      "$date": "2024-10-23T08:38:20.010Z"
    },
    "_updated_at": {
      "$date": "2024-10-23T08:38:20.010Z"
    },
    "usedTimes": 0
  },
  {
    "_id": "hKZgeKUQX1",
    "options": [
      "ness",
      "kind",
      "kin",
      "dness"
    ],
    "_p_quiz": "BlWYmsLwaI",
    "question": "What is the suffix in the word 'kindness'?",
    "correct_answer": "ness",
    "_created_at": {
      "$date": "2024-10-23T08:38:20.010Z"
    },
    "_updated_at": {
      "$date": "2024-10-23T08:38:20.010Z"
    },
    "usedTimes": 0
  },
  {
    "_id": "gmUgeknnZf",
    "options": [
      "She has visited Paris.",
      "She visits Paris.",
      "She visited Paris.",
      "She is visiting Paris."
    ],
    "_p_quiz": "BlWYmsLwaI",
    "question": "Which sentence is in the present perfect tense?",
    "correct_answer": "She has visited Paris.",
    "_created_at": {
      "$date": "2024-10-23T08:38:20.010Z"
    },
    "_updated_at": {
      "$date": "2024-10-23T08:38:20.010Z"
    },
    "usedTimes": 0
  },
  {
    "_id": "bBiEl4TnmT",
    "options": [
      "many",
      "much",
      "more",
      "most"
    ],
    "_p_quiz": "BlWYmsLwaI",
    "question": "What is the correct form of 'many' in the sentence: 'There are _____ apples in the basket.'?",
    "correct_answer": "many",
    "_created_at": {
      "$date": "2024-10-23T08:38:20.010Z"
    },
    "_updated_at": {
      "$date": "2024-10-23T08:38:20.010Z"
    },
    "usedTimes": 0
  },
  {
    "_id": "LdwTsuIrPV",
    "options": [
      "but",
      "want",
      "to",
      "is"
    ],
    "_p_quiz": "BlWYmsLwaI",
    "question": "Which word is a conjunction in the sentence: 'I want to play, but it is raining.'?",
    "correct_answer": "but",
    "_created_at": {
      "$date": "2024-10-23T08:38:20.010Z"
    },
    "_updated_at": {
      "$date": "2024-10-23T08:38:20.010Z"
    },
    "usedTimes": 0
  },
  {
    "_id": "3ByUY2yELr",
    "options": [
      "tall",
      "man",
      "laughed",
      "The"
    ],
    "_p_quiz": "BlWYmsLwaI",
    "question": "Which word is an adjective in the sentence: 'The tall man laughed.'?",
    "correct_answer": "tall",
    "_created_at": {
      "$date": "2024-10-23T08:38:20.010Z"
    },
    "_updated_at": {
      "$date": "2024-10-23T08:38:20.010Z"
    },
    "usedTimes": 0
  },
  {
    "_id": "JAcGxYMu48",
    "options": [
      "swam",
      "swum",
      "swimmed",
      "swims"
    ],
    "_p_quiz": "BlWYmsLwaI",
    "question": "What is the past tense of 'swim'?",
    "correct_answer": "swam",
    "_created_at": {
      "$date": "2024-10-23T08:38:20.010Z"
    },
    "_updated_at": {
      "$date": "2024-10-23T08:38:20.010Z"
    },
    "usedTimes": 0
  },
  {
    "_id": "BOsuqzD4PN",
    "options": [
      "children",
      "childs",
      "child",
      "childrens"
    ],
    "_p_quiz": "BlWYmsLwaI",
    "question": "What is the plural form of 'child'?",
    "correct_answer": "children",
    "_created_at": {
      "$date": "2024-10-23T08:38:20.010Z"
    },
    "_updated_at": {
      "$date": "2024-10-23T08:38:20.010Z"
    },
    "usedTimes": 0
  },
  {
    "_id": "eZHV6UnSiH",
    "options": [
      "Although I was tired, I went to the store and I bought some bread.",
      "I went to the store and bought some bread.",
      "I went to the store because I was tired.",
      "I was tired, so I went to the store."
    ],
    "_p_quiz": "BlWYmsLwaI",
    "question": "Which sentence is a compound-complex sentence?",
    "correct_answer": "Although I was tired, I went to the store and I bought some bread.",
    "_created_at": {
      "$date": "2024-10-23T08:38:20.010Z"
    },
    "_updated_at": {
      "$date": "2024-10-23T08:38:20.010Z"
    },
    "usedTimes": 0
  },
  {
    "_id": "VsO7UCCgq3",
    "options": [
      "You're going to love your new house.",
      "Your going to love you're new house.",
      "You're going to love you're new house.",
      "Your going to love your new house."
    ],
    "_p_quiz": "BlWYmsLwaI",
    "question": "Which sentence uses the correct form of 'your' or 'you're'?",
    "correct_answer": "You're going to love your new house.",
    "_created_at": {
      "$date": "2024-10-23T08:38:20.010Z"
    },
    "_updated_at": {
      "$date": "2024-10-23T08:38:20.010Z"
    },
    "usedTimes": 0
  },
  {
    "_id": "PFUi6qZ0mO",
    "options": [
      "worst",
      "worse",
      "badest",
      "more bad"
    ],
    "_p_quiz": "BlWYmsLwaI",
    "question": "What is the superlative form of 'bad'?",
    "correct_answer": "worst",
    "_created_at": {
      "$date": "2024-10-23T08:38:20.010Z"
    },
    "_updated_at": {
      "$date": "2024-10-23T08:38:20.010Z"
    },
    "usedTimes": 0
  },
  {
    "_id": "utfzwyDqXG",
    "options": [
      "began",
      "begun",
      "begin",
      "begins"
    ],
    "_p_quiz": "BlWYmsLwaI",
    "question": "What is the past tense of 'begin'?",
    "correct_answer": "began",
    "_created_at": {
      "$date": "2024-10-23T08:38:20.211Z"
    },
    "_updated_at": {
      "$date": "2024-10-23T08:38:20.211Z"
    },
    "usedTimes": 0
  },
  {
    "_id": "BFDDVKnwJt",
    "options": [
      "eaten",
      "have",
      "lunch",
      "They"
    ],
    "_p_quiz": "BlWYmsLwaI",
    "question": "What is the main verb in the sentence: 'They have eaten lunch.'?",
    "correct_answer": "eaten",
    "_created_at": {
      "$date": "2024-10-23T08:38:20.211Z"
    },
    "_updated_at": {
      "$date": "2024-10-23T08:38:20.211Z"
    },
    "usedTimes": 0
  },
  {
    "_id": "JGZTtxJUV4",
    "options": [
      "cold",
      "warm",
      "cool",
      "humid"
    ],
    "_p_quiz": "BlWYmsLwaI",
    "question": "What is an antonym for 'hot'?",
    "correct_answer": "cold",
    "_created_at": {
      "$date": "2024-10-23T08:38:20.210Z"
    },
    "_updated_at": {
      "$date": "2024-10-23T08:38:20.210Z"
    },
    "usedTimes": 0
  },
  {
    "_id": "jCWo8TTvOX",
    "options": [
      "men",
      "mans",
      "man",
      "mens"
    ],
    "_p_quiz": "BlWYmsLwaI",
    "question": "What is the plural form of 'man'?",
    "correct_answer": "men",
    "_created_at": {
      "$date": "2024-10-23T08:38:20.211Z"
    },
    "_updated_at": {
      "$date": "2024-10-23T08:38:20.211Z"
    },
    "usedTimes": 0
  },
  {
    "_id": "Prww472ueY",
    "options": [
      "running",
      "ran",
      "runned",
      "runs"
    ],
    "_p_quiz": "BlWYmsLwaI",
    "question": "What is the present participle of 'run'?",
    "correct_answer": "running",
    "_created_at": {
      "$date": "2024-10-23T08:38:20.210Z"
    },
    "_updated_at": {
      "$date": "2024-10-23T08:38:20.210Z"
    },
    "usedTimes": 0
  },
  {
    "_id": "bvbkyoFQGF",
    "options": [
      "chased",
      "dog",
      "cat",
      "the"
    ],
    "_p_quiz": "BlWYmsLwaI",
    "question": "Which word is a verb in the sentence: 'The dog chased the cat.'?",
    "correct_answer": "chased",
    "_created_at": {
      "$date": "2024-10-23T08:38:20.211Z"
    },
    "_updated_at": {
      "$date": "2024-10-23T08:38:20.211Z"
    },
    "usedTimes": 0
  },
  {
    "_id": "Ta8Q5DXDQW",
    "options": [
      "does",
      "do",
      "doing",
      "done"
    ],
    "_p_quiz": "BlWYmsLwaI",
    "question": "What is the correct form of 'do' in the sentence: 'She _____ her homework every night.'?",
    "correct_answer": "does",
    "_created_at": {
      "$date": "2024-10-23T08:38:20.211Z"
    },
    "_updated_at": {
      "$date": "2024-10-23T08:38:20.211Z"
    },
    "usedTimes": 0
  },
  {
    "_id": "elGFhj9ts2",
    "options": [
      "the book",
      "She",
      "reads",
      "the"
    ],
    "_p_quiz": "BlWYmsLwaI",
    "question": "What is the object in the sentence: 'She reads the book.'?",
    "correct_answer": "the book",
    "_created_at": {
      "$date": "2024-10-23T08:38:20.211Z"
    },
    "_updated_at": {
      "$date": "2024-10-23T08:38:20.211Z"
    },
    "usedTimes": 0
  },
  {
    "_id": "ZAIz9osxFl",
    "options": [
      "Conjunction",
      "Noun",
      "Adjective",
      "Adverb"
    ],
    "_p_quiz": "BlWYmsLwaI",
    "question": "What part of speech is the word 'until'?",
    "correct_answer": "Conjunction",
    "_created_at": {
      "$date": "2024-10-23T08:38:20.211Z"
    },
    "_updated_at": {
      "$date": "2024-10-23T08:38:20.211Z"
    },
    "usedTimes": 0
  },
  {
    "_id": "C6ZdWdJZj7",
    "options": [
      "It's going to be a sunny day.",
      "Its going to be a sunny day.",
      "It's going to be its sunny day.",
      "Its' going to be a sunny day."
    ],
    "_p_quiz": "BlWYmsLwaI",
    "question": "Which sentence uses the correct form of 'its' or 'it's'?",
    "correct_answer": "It's going to be a sunny day.",
    "_created_at": {
      "$date": "2024-10-23T08:38:20.211Z"
    },
    "_updated_at": {
      "$date": "2024-10-23T08:38:20.211Z"
    },
    "usedTimes": 0
  },
  {
    "_id": "6RjFLjtegK",
    "options": [
      "farthest",
      "farther",
      "farest",
      "more far"
    ],
    "_p_quiz": "BlWYmsLwaI",
    "question": "What is the superlative form of 'far'?",
    "correct_answer": "farthest",
    "_created_at": {
      "$date": "2024-10-23T08:38:20.211Z"
    },
    "_updated_at": {
      "$date": "2024-10-23T08:38:20.211Z"
    },
    "usedTimes": 0
  },
  {
    "_id": "P5FBDbw2nr",
    "options": [
      "Where are you going?",
      "Where are you going.",
      "Where are you going!",
      "Where are you going,"
    ],
    "_p_quiz": "BlWYmsLwaI",
    "question": "What is the correct punctuation for this sentence: 'Where are you going'",
    "correct_answer": "Where are you going?",
    "_created_at": {
      "$date": "2024-10-23T08:38:20.211Z"
    },
    "_updated_at": {
      "$date": "2024-10-23T08:38:20.211Z"
    },
    "usedTimes": 0
  },
  {
    "_id": "KlCxg5s0CN",
    "options": [
      "bright",
      "sun",
      "shone",
      "The"
    ],
    "_p_quiz": "BlWYmsLwaI",
    "question": "Which word is an adjective in the sentence: 'The bright sun shone.'?",
    "correct_answer": "bright",
    "_created_at": {
      "$date": "2024-10-23T08:38:20.211Z"
    },
    "_updated_at": {
      "$date": "2024-10-23T08:38:20.211Z"
    },
    "usedTimes": 0
  },
  {
    "_id": "rGn0HJakwp",
    "options": [
      "15",
      "14",
      "16",
      "13"
    ],
    "_p_quiz": "IUeLREiYbn",
    "question": "What is 7 + 8?",
    "correct_answer": "15",
    "_created_at": {
      "$date": "2024-10-23T08:41:58.984Z"
    },
    "_updated_at": {
      "$date": "2024-10-23T08:41:58.984Z"
    },
    "usedTimes": 0
  },
  {
    "_id": "QTzXWKuj3J",
    "options": [
      "27",
      "21",
      "18",
      "24"
    ],
    "_p_quiz": "IUeLREiYbn",
    "question": "What is the product of 9 and 3?",
    "correct_answer": "27",
    "_created_at": {
      "$date": "2024-10-23T08:41:58.984Z"
    },
    "_updated_at": {
      "$date": "2024-10-23T08:41:58.984Z"
    },
    "usedTimes": 0
  },
  {
    "_id": "CYIruL5lcm",
    "options": [
      "7",
      "6",
      "8",
      "5"
    ],
    "_p_quiz": "IUeLREiYbn",
    "question": "What is the value of x in the equation 2x = 14?",
    "correct_answer": "7",
    "_created_at": {
      "$date": "2024-10-23T08:41:58.984Z"
    },
    "_updated_at": {
      "$date": "2024-10-23T08:41:58.984Z"
    },
    "usedTimes": 0
  },
  {
    "_id": "7ZCn1OlN8D",
    "options": [
      "15",
      "18",
      "12",
      "20"
    ],
    "_p_quiz": "IUeLREiYbn",
    "question": "What is the area of a rectangle with length 5 and width 3?",
    "correct_answer": "15",
    "_created_at": {
      "$date": "2024-10-23T08:41:58.984Z"
    },
    "_updated_at": {
      "$date": "2024-10-23T08:41:58.984Z"
    },
    "usedTimes": 0
  },
  {
    "_id": "JnpEeqS65t",
    "options": [
      "7",
      "8",
      "6",
      "5"
    ],
    "_p_quiz": "IUeLREiYbn",
    "question": "What is 12 - 5?",
    "correct_answer": "7",
    "_created_at": {
      "$date": "2024-10-23T08:41:58.984Z"
    },
    "_updated_at": {
      "$date": "2024-10-23T08:41:58.984Z"
    },
    "usedTimes": 0
  },
  {
    "_id": "hgpg1qJe1R",
    "options": [
      "12",
      "10",
      "15",
      "9"
    ],
    "_p_quiz": "IUeLREiYbn",
    "question": "What is the perimeter of a triangle with sides 3, 4, and 5?",
    "correct_answer": "12",
    "_created_at": {
      "$date": "2024-10-23T08:41:58.984Z"
    },
    "_updated_at": {
      "$date": "2024-10-23T08:41:58.984Z"
    },
    "usedTimes": 0
  },
  {
    "_id": "CRQ7Fsry6k",
    "options": [
      "9",
      "8",
      "10",
      "7"
    ],
    "_p_quiz": "IUeLREiYbn",
    "question": "What is 45 divided by 5?",
    "correct_answer": "9",
    "_created_at": {
      "$date": "2024-10-23T08:41:58.984Z"
    },
    "_updated_at": {
      "$date": "2024-10-23T08:41:58.984Z"
    },
    "usedTimes": 0
  },
  {
    "_id": "dGTXSFVqYH",
    "options": [
      "180°",
      "90°",
      "360°",
      "270°"
    ],
    "_p_quiz": "IUeLREiYbn",
    "question": "What is the sum of the interior angles of a triangle?",
    "correct_answer": "180°",
    "_created_at": {
      "$date": "2024-10-23T08:41:58.984Z"
    },
    "_updated_at": {
      "$date": "2024-10-23T08:41:58.984Z"
    },
    "usedTimes": 0
  },
  {
    "_id": "aUTqCIBX3U",
    "options": [
      "16",
      "12",
      "8",
      "20"
    ],
    "_p_quiz": "IUeLREiYbn",
    "question": "What is the perimeter of a square with side length 4?",
    "correct_answer": "16",
    "_created_at": {
      "$date": "2024-10-23T08:41:58.984Z"
    },
    "_updated_at": {
      "$date": "2024-10-23T08:41:58.984Z"
    },
    "usedTimes": 0
  },
  {
    "_id": "EGl4Zdnt5z",
    "options": [
      "8",
      "6",
      "7",
      "9"
    ],
    "_p_quiz": "IUeLREiYbn",
    "question": "What is the square root of 64?",
    "correct_answer": "8",
    "_created_at": {
      "$date": "2024-10-23T08:41:58.984Z"
    },
    "_updated_at": {
      "$date": "2024-10-23T08:41:58.984Z"
    },
    "usedTimes": 0
  },
  {
    "_id": "aJowsqlBuE",
    "options": [
      "6",
      "4",
      "3",
      "2"
    ],
    "_p_quiz": "IUeLREiYbn",
    "question": "What is the greatest common factor of 18 and 24?",
    "correct_answer": "6",
    "_created_at": {
      "$date": "2024-10-23T08:41:58.984Z"
    },
    "_updated_at": {
      "$date": "2024-10-23T08:41:58.984Z"
    },
    "usedTimes": 0
  },
  {
    "_id": "RGHqiwc9zS",
    "options": [
      "0.25",
      "0.5",
      "0.75",
      "0.2"
    ],
    "_p_quiz": "IUeLREiYbn",
    "question": "What is the decimal equivalent of 1/4?",
    "correct_answer": "0.25",
    "_created_at": {
      "$date": "2024-10-23T08:41:58.984Z"
    },
    "_updated_at": {
      "$date": "2024-10-23T08:41:58.984Z"
    },
    "usedTimes": 0
  },
  {
    "_id": "Rk8T9IgRHv",
    "options": [
      "40°",
      "50°",
      "60°",
      "70°"
    ],
    "_p_quiz": "IUeLREiYbn",
    "question": "If a triangle has angles 60° and 80°, what is the third angle?",
    "correct_answer": "40°",
    "_created_at": {
      "$date": "2024-10-23T08:41:58.984Z"
    },
    "_updated_at": {
      "$date": "2024-10-23T08:41:58.984Z"
    },
    "usedTimes": 0
  },
  {
    "_id": "DerZzRbDzO",
    "options": [
      "7",
      "5",
      "6",
      "8"
    ],
    "_p_quiz": "IUeLREiYbn",
    "question": "What is the median of the numbers 3, 5, 7, 8, 9?",
    "correct_answer": "7",
    "_created_at": {
      "$date": "2024-10-23T08:41:58.984Z"
    },
    "_updated_at": {
      "$date": "2024-10-23T08:41:58.984Z"
    },
    "usedTimes": 0
  },
  {
    "_id": "vy3GGBsTxK",
    "options": [
      "30",
      "20",
      "25",
      "35"
    ],
    "_p_quiz": "IUeLREiYbn",
    "question": "What is 15% of 200?",
    "correct_answer": "30",
    "_created_at": {
      "$date": "2024-10-23T08:41:58.984Z"
    },
    "_updated_at": {
      "$date": "2024-10-23T08:41:58.984Z"
    },
    "usedTimes": 0
  },
  {
    "_id": "q4QmpBLStQ",
    "options": [
      "9",
      "6",
      "12",
      "8"
    ],
    "_p_quiz": "IUeLREiYbn",
    "question": "What is the value of 3²?",
    "correct_answer": "9",
    "_created_at": {
      "$date": "2024-10-23T08:41:58.984Z"
    },
    "_updated_at": {
      "$date": "2024-10-23T08:41:58.984Z"
    },
    "usedTimes": 0
  },
  {
    "_id": "9ihBB3mbEI",
    "options": [
      "30",
      "25",
      "20",
      "35"
    ],
    "_p_quiz": "IUeLREiYbn",
    "question": "What is 20% of 150?",
    "correct_answer": "30",
    "_created_at": {
      "$date": "2024-10-23T08:41:58.984Z"
    },
    "_updated_at": {
      "$date": "2024-10-23T08:41:58.984Z"
    },
    "usedTimes": 0
  },
  {
    "_id": "ZX98mbcoeo",
    "options": [
      "32",
      "24",
      "20",
      "28"
    ],
    "_p_quiz": "IUeLREiYbn",
    "question": "What is the next number in the sequence: 2, 4, 8, 16, ...?",
    "correct_answer": "32",
    "_created_at": {
      "$date": "2024-10-23T08:41:58.984Z"
    },
    "_updated_at": {
      "$date": "2024-10-23T08:41:58.984Z"
    },
    "usedTimes": 0
  },
  {
    "_id": "9NS567k3kF",
    "options": [
      "2",
      "1",
      "3",
      "5"
    ],
    "_p_quiz": "IUeLREiYbn",
    "question": "What is the smallest prime number?",
    "correct_answer": "2",
    "_created_at": {
      "$date": "2024-10-23T08:41:58.984Z"
    },
    "_updated_at": {
      "$date": "2024-10-23T08:41:58.984Z"
    },
    "usedTimes": 0
  },
  {
    "_id": "JDMKnUaxie",
    "options": [
      "15",
      "10",
      "20",
      "25"
    ],
    "_p_quiz": "IUeLREiYbn",
    "question": "What is 5% of 300?",
    "correct_answer": "15",
    "_created_at": {
      "$date": "2024-10-23T08:41:58.984Z"
    },
    "_updated_at": {
      "$date": "2024-10-23T08:41:58.984Z"
    },
    "usedTimes": 0
  },
  {
    "_id": "xNBVQPnYue",
    "options": [
      "12",
      "8",
      "10",
      "14"
    ],
    "_p_quiz": "IUeLREiYbn",
    "question": "What is the least common multiple of 4 and 6?",
    "correct_answer": "12",
    "_created_at": {
      "$date": "2024-10-23T08:41:59.216Z"
    },
    "_updated_at": {
      "$date": "2024-10-23T08:41:59.216Z"
    },
    "usedTimes": 0
  },
  {
    "_id": "4pX4s6zo2y",
    "options": [
      "40",
      "30",
      "50",
      "45"
    ],
    "_p_quiz": "IUeLREiYbn",
    "question": "What is the sum of 13 and 27?",
    "correct_answer": "40",
    "_created_at": {
      "$date": "2024-10-23T08:41:59.216Z"
    },
    "_updated_at": {
      "$date": "2024-10-23T08:41:59.216Z"
    },
    "usedTimes": 0
  },
  {
    "_id": "9jvHTMFlue",
    "options": [
      "1000",
      "100",
      "10",
      "10000"
    ],
    "_p_quiz": "IUeLREiYbn",
    "question": "What is the value of 10³?",
    "correct_answer": "1000",
    "_created_at": {
      "$date": "2024-10-23T08:41:59.216Z"
    },
    "_updated_at": {
      "$date": "2024-10-23T08:41:59.216Z"
    },
    "usedTimes": 0
  },
  {
    "_id": "ELflxHGwCt",
    "options": [
      "5",
      "4",
      "6",
      "3"
    ],
    "_p_quiz": "IUeLREiYbn",
    "question": "What is the value of x in the equation x + 7 = 12?",
    "correct_answer": "5",
    "_created_at": {
      "$date": "2024-10-23T08:41:59.217Z"
    },
    "_updated_at": {
      "$date": "2024-10-23T08:41:59.217Z"
    },
    "usedTimes": 0
  },
  {
    "_id": "d32x6RX89c",
    "options": [
      "42",
      "36",
      "48",
      "40"
    ],
    "_p_quiz": "IUeLREiYbn",
    "question": "What is the product of 6 and 7?",
    "correct_answer": "42",
    "_created_at": {
      "$date": "2024-10-23T08:41:59.216Z"
    },
    "_updated_at": {
      "$date": "2024-10-23T08:41:59.216Z"
    },
    "usedTimes": 0
  },
  {
    "_id": "jXyacNMnj1",
    "options": [
      "3.14",
      "3.12",
      "3.16",
      "3.18"
    ],
    "_p_quiz": "IUeLREiYbn",
    "question": "What is the value of π to two decimal places?",
    "correct_answer": "3.14",
    "_created_at": {
      "$date": "2024-10-23T08:41:59.216Z"
    },
    "_updated_at": {
      "$date": "2024-10-23T08:41:59.216Z"
    },
    "usedTimes": 0
  },
  {
    "_id": "yfSTfhQ4BJ",
    "options": [
      "66.67%",
      "50%",
      "60%",
      "75%"
    ],
    "_p_quiz": "IUeLREiYbn",
    "question": "What is 2/3 as a percentage?",
    "correct_answer": "66.67%",
    "_created_at": {
      "$date": "2024-10-23T08:41:59.217Z"
    },
    "_updated_at": {
      "$date": "2024-10-23T08:41:59.217Z"
    },
    "usedTimes": 0
  },
  {
    "_id": "qJHiihsLEw",
    "options": [
      "1/5",
      "5",
      "1/25",
      "10"
    ],
    "_p_quiz": "IUeLREiYbn",
    "question": "What is the reciprocal of 5?",
    "correct_answer": "1/5",
    "_created_at": {
      "$date": "2024-10-23T08:41:59.216Z"
    },
    "_updated_at": {
      "$date": "2024-10-23T08:41:59.216Z"
    },
    "usedTimes": 0
  },
  {
    "_id": "UuF1AAUPPr",
    "options": [
      "28",
      "26",
      "24",
      "30"
    ],
    "_p_quiz": "IUeLREiYbn",
    "question": "What is the perimeter of a rectangle with length 10 and width 4?",
    "correct_answer": "28",
    "_created_at": {
      "$date": "2024-10-23T08:41:59.217Z"
    },
    "_updated_at": {
      "$date": "2024-10-23T08:41:59.217Z"
    },
    "usedTimes": 0
  },
  {
    "_id": "Y6a8u4gMKK",
    "options": [
      "20",
      "25",
      "15",
      "10"
    ],
    "_p_quiz": "IUeLREiYbn",
    "question": "What is 25% of 80?",
    "correct_answer": "20",
    "_created_at": {
      "$date": "2024-10-23T08:41:59.217Z"
    },
    "_updated_at": {
      "$date": "2024-10-23T08:41:59.217Z"
    },
    "usedTimes": 0
  },
  {
    "_id": "LNT3EDtzrH",
    "options": [
      "0.6",
      "0.5",
      "0.75",
      "0.65"
    ],
    "_p_quiz": "IUeLREiYbn",
    "question": "What is the decimal equivalent of 3/5?",
    "correct_answer": "0.6",
    "_created_at": {
      "$date": "2024-10-23T08:41:59.217Z"
    },
    "_updated_at": {
      "$date": "2024-10-23T08:41:59.217Z"
    },
    "usedTimes": 0
  },
  {
    "_id": "og39FSFZWy",
    "options": [
      "75%",
      "50%",
      "60%",
      "80%"
    ],
    "_p_quiz": "IUeLREiYbn",
    "question": "What is 3/4 as a percentage?",
    "correct_answer": "75%",
    "_created_at": {
      "$date": "2024-10-23T08:41:59.216Z"
    },
    "_updated_at": {
      "$date": "2024-10-23T08:41:59.216Z"
    },
    "usedTimes": 0
  },
  {
    "_id": "hBJ5sQAG3W",
    "options": [
      "length × width",
      "2 × (length + width)",
      "length + width",
      "2 × length × width"
    ],
    "_p_quiz": "IUeLREiYbn",
    "question": "What is the formula for the area of a rectangle?",
    "correct_answer": "length × width",
    "_created_at": {
      "$date": "2024-10-23T08:41:59.216Z"
    },
    "_updated_at": {
      "$date": "2024-10-23T08:41:59.216Z"
    },
    "usedTimes": 0
  },
  {
    "_id": "RRIijITbbR",
    "options": [
      "125",
      "25",
      "15",
      "100"
    ],
    "_p_quiz": "IUeLREiYbn",
    "question": "What is the value of 5³?",
    "correct_answer": "125",
    "_created_at": {
      "$date": "2024-10-23T08:41:59.217Z"
    },
    "_updated_at": {
      "$date": "2024-10-23T08:41:59.217Z"
    },
    "usedTimes": 0
  },
  {
    "_id": "JGr9ZB2ueG",
    "options": [
      "225",
      "150",
      "200",
      "250"
    ],
    "_p_quiz": "IUeLREiYbn",
    "question": "What is 15 squared?",
    "correct_answer": "225",
    "_created_at": {
      "$date": "2024-10-23T08:41:59.217Z"
    },
    "_updated_at": {
      "$date": "2024-10-23T08:41:59.217Z"
    },
    "usedTimes": 0
  },
  {
    "_id": "vp8vUyfsFs",
    "options": [
      "5",
      "3",
      "2",
      "1"
    ],
    "_p_quiz": "IUeLREiYbn",
    "question": "What is the greatest common factor of 10 and 15?",
    "correct_answer": "5",
    "_created_at": {
      "$date": "2024-10-23T08:41:59.217Z"
    },
    "_updated_at": {
      "$date": "2024-10-23T08:41:59.217Z"
    },
    "usedTimes": 0
  },
  {
    "_id": "NLTJJrMOGG",
    "options": [
      "12",
      "24",
      "18",
      "10"
    ],
    "_p_quiz": "IUeLREiYbn",
    "question": "What is the area of a triangle with base 6 and height 4?",
    "correct_answer": "12",
    "_created_at": {
      "$date": "2024-10-23T08:41:59.217Z"
    },
    "_updated_at": {
      "$date": "2024-10-23T08:41:59.217Z"
    },
    "usedTimes": 0
  },
  {
    "_id": "n04dMUUACh",
    "options": [
      "28",
      "26",
      "30",
      "32"
    ],
    "_p_quiz": "IUeLREiYbn",
    "question": "What is the sum of the first five prime numbers?",
    "correct_answer": "28",
    "_created_at": {
      "$date": "2024-10-23T08:41:59.217Z"
    },
    "_updated_at": {
      "$date": "2024-10-23T08:41:59.217Z"
    },
    "usedTimes": 0
  },
  {
    "_id": "PSn50lWtRe",
    "options": [
      "81",
      "72",
      "64",
      "90"
    ],
    "_p_quiz": "IUeLREiYbn",
    "question": "What is 9²?",
    "correct_answer": "81",
    "_created_at": {
      "$date": "2024-10-23T08:41:59.217Z"
    },
    "_updated_at": {
      "$date": "2024-10-23T08:41:59.217Z"
    },
    "usedTimes": 0
  },
  {
    "_id": "HwIFEwOq64",
    "options": [
      "35",
      "28",
      "30",
      "25"
    ],
    "_p_quiz": "IUeLREiYbn",
    "question": "What is the value of the expression 7 × (3 + 2)?",
    "correct_answer": "35",
    "_created_at": {
      "$date": "2024-10-23T08:41:59.217Z"
    },
    "_updated_at": {
      "$date": "2024-10-23T08:41:59.217Z"
    },
    "usedTimes": 0
  },
  {
    "_id": "BPRayPtPHA",
    "options": [
      "21",
      "14",
      "28",
      "35"
    ],
    "_p_quiz": "IUeLREiYbn",
    "question": "What is the least common multiple of 3 and 7?",
    "correct_answer": "21",
    "_created_at": {
      "$date": "2024-10-23T08:41:59.389Z"
    },
    "_updated_at": {
      "$date": "2024-10-23T08:41:59.389Z"
    },
    "usedTimes": 0
  },
  {
    "_id": "ApNm6Hukiw",
    "options": [
      "0.2",
      "0.5",
      "0.25",
      "0.1"
    ],
    "_p_quiz": "IUeLREiYbn",
    "question": "What is 1/5 as a decimal?",
    "correct_answer": "0.2",
    "_created_at": {
      "$date": "2024-10-23T08:41:59.389Z"
    },
    "_updated_at": {
      "$date": "2024-10-23T08:41:59.389Z"
    },
    "usedTimes": 0
  },
  {
    "_id": "UguEWjLbTn",
    "options": [
      "48",
      "36",
      "42",
      "40"
    ],
    "_p_quiz": "IUeLREiYbn",
    "question": "What is the product of 12 and 4?",
    "correct_answer": "48",
    "_created_at": {
      "$date": "2024-10-23T08:41:59.389Z"
    },
    "_updated_at": {
      "$date": "2024-10-23T08:41:59.389Z"
    },
    "usedTimes": 0
  },
  {
    "_id": "ZUomoqy85x",
    "options": [
      "100",
      "90",
      "110",
      "95"
    ],
    "_p_quiz": "IUeLREiYbn",
    "question": "What is the sum of 56 and 44?",
    "correct_answer": "100",
    "_created_at": {
      "$date": "2024-10-23T08:41:59.389Z"
    },
    "_updated_at": {
      "$date": "2024-10-23T08:41:59.389Z"
    },
    "usedTimes": 0
  },
  {
    "_id": "3w3ypsD2yz",
    "options": [
      "2πr",
      "πr²",
      "πd",
      "2πd"
    ],
    "_p_quiz": "IUeLREiYbn",
    "question": "What is the formula for the circumference of a circle?",
    "correct_answer": "2πr",
    "_created_at": {
      "$date": "2024-10-23T08:41:59.389Z"
    },
    "_updated_at": {
      "$date": "2024-10-23T08:41:59.389Z"
    },
    "usedTimes": 0
  },
  {
    "_id": "6l5UZZlbbu",
    "options": [
      "64",
      "32",
      "48",
      "56"
    ],
    "_p_quiz": "IUeLREiYbn",
    "question": "What is the value of 8²?",
    "correct_answer": "64",
    "_created_at": {
      "$date": "2024-10-23T08:41:59.389Z"
    },
    "_updated_at": {
      "$date": "2024-10-23T08:41:59.389Z"
    },
    "usedTimes": 0
  },
  {
    "_id": "bcbelD8xAl",
    "options": [
      "343",
      "49",
      "21",
      "147"
    ],
    "_p_quiz": "IUeLREiYbn",
    "question": "What is 7 cubed?",
    "correct_answer": "343",
    "_created_at": {
      "$date": "2024-10-23T08:41:59.389Z"
    },
    "_updated_at": {
      "$date": "2024-10-23T08:41:59.389Z"
    },
    "usedTimes": 0
  },
  {
    "_id": "D9oN9L9e8N",
    "options": [
      "60",
      "50",
      "40",
      "70"
    ],
    "_p_quiz": "IUeLREiYbn",
    "question": "What is 30% of 200?",
    "correct_answer": "60",
    "_created_at": {
      "$date": "2024-10-23T08:41:59.389Z"
    },
    "_updated_at": {
      "$date": "2024-10-23T08:41:59.389Z"
    },
    "usedTimes": 0
  },
  {
    "_id": "WvChcCwdR0",
    "options": [
      "64",
      "32",
      "48",
      "72"
    ],
    "_p_quiz": "IUeLREiYbn",
    "question": "What is the value of 4³?",
    "correct_answer": "64",
    "_created_at": {
      "$date": "2024-10-23T08:41:59.390Z"
    },
    "_updated_at": {
      "$date": "2024-10-23T08:41:59.390Z"
    },
    "usedTimes": 0
  },
  {
    "_id": "2BNG1BLfxB",
    "options": [
      "36",
      "30",
      "42",
      "48"
    ],
    "_p_quiz": "IUeLREiYbn",
    "question": "What is the value of 6²?",
    "correct_answer": "36",
    "_created_at": {
      "$date": "2024-10-23T08:41:59.389Z"
    },
    "_updated_at": {
      "$date": "2024-10-23T08:41:59.389Z"
    },
    "usedTimes": 0
  },
  {
    "_id": "3aVt14jDlG",
    "options": [
      "6",
      "5",
      "7",
      "4"
    ],
    "_p_quiz": "IUeLREiYbn",
    "question": "What is the value of x in the equation 3x = 18?",
    "correct_answer": "6",
    "_created_at": {
      "$date": "2024-10-23T08:41:59.389Z"
    },
    "_updated_at": {
      "$date": "2024-10-23T08:41:59.389Z"
    },
    "usedTimes": 0
  },
  {
    "_id": "KeepPLQ99s",
    "options": [
      "45",
      "40",
      "50",
      "55"
    ],
    "_p_quiz": "IUeLREiYbn",
    "question": "What is the product of 5 and 9?",
    "correct_answer": "45",
    "_created_at": {
      "$date": "2024-10-23T08:41:59.389Z"
    },
    "_updated_at": {
      "$date": "2024-10-23T08:41:59.389Z"
    },
    "usedTimes": 0
  },
  {
    "_id": "u4cOHtfuFl",
    "options": [
      "24",
      "16",
      "20",
      "28"
    ],
    "_p_quiz": "IUeLREiYbn",
    "question": "What is the least common multiple of 8 and 12?",
    "correct_answer": "24",
    "_created_at": {
      "$date": "2024-10-23T08:41:59.389Z"
    },
    "_updated_at": {
      "$date": "2024-10-23T08:41:59.389Z"
    },
    "usedTimes": 0
  },
  {
    "_id": "9FCjwRinBB",
    "options": [
      "80%",
      "75%",
      "85%",
      "70%"
    ],
    "_p_quiz": "IUeLREiYbn",
    "question": "What is 4/5 as a percentage?",
    "correct_answer": "80%",
    "_created_at": {
      "$date": "2024-10-23T08:41:59.389Z"
    },
    "_updated_at": {
      "$date": "2024-10-23T08:41:59.389Z"
    },
    "usedTimes": 0
  },
  {
    "_id": "nwAB5XstHC",
    "options": [
      "360°",
      "180°",
      "270°",
      "450°"
    ],
    "_p_quiz": "IUeLREiYbn",
    "question": "What is the sum of the angles in a quadrilateral?",
    "correct_answer": "360°",
    "_created_at": {
      "$date": "2024-10-23T08:41:59.389Z"
    },
    "_updated_at": {
      "$date": "2024-10-23T08:41:59.389Z"
    },
    "usedTimes": 0
  },
  {
    "_id": "8m7pXRGV0l",
    "options": [
      "13",
      "12",
      "11",
      "14"
    ],
    "_p_quiz": "IUeLREiYbn",
    "question": "What is the value of 2² + 3²?",
    "correct_answer": "13",
    "_created_at": {
      "$date": "2024-10-23T08:41:59.389Z"
    },
    "_updated_at": {
      "$date": "2024-10-23T08:41:59.389Z"
    },
    "usedTimes": 0
  },
  {
    "_id": "Hl44Ddhppt",
    "options": [
      "12",
      "9",
      "8",
      "6"
    ],
    "_p_quiz": "IUeLREiYbn",
    "question": "What is the value of x in the equation x/4 = 3?",
    "correct_answer": "12",
    "_created_at": {
      "$date": "2024-10-23T08:41:59.389Z"
    },
    "_updated_at": {
      "$date": "2024-10-23T08:41:59.389Z"
    },
    "usedTimes": 0
  },
  {
    "_id": "jwJgrqpKpe",
    "options": [
      "66",
      "60",
      "72",
      "54"
    ],
    "_p_quiz": "IUeLREiYbn",
    "question": "What is the product of 11 and 6?",
    "correct_answer": "66",
    "_created_at": {
      "$date": "2024-10-23T08:41:59.390Z"
    },
    "_updated_at": {
      "$date": "2024-10-23T08:41:59.390Z"
    },
    "usedTimes": 0
  },
  {
    "_id": "0crkDYX2TF",
    "options": [
      "0.33",
      "0.3",
      "0.25",
      "0.5"
    ],
    "_p_quiz": "IUeLREiYbn",
    "question": "What is the decimal equivalent of 1/3?",
    "correct_answer": "0.33",
    "_created_at": {
      "$date": "2024-10-23T08:41:59.389Z"
    },
    "_updated_at": {
      "$date": "2024-10-23T08:41:59.389Z"
    },
    "usedTimes": 0
  },
  {
    "_id": "ZRmIMHeQKC",
    "options": [
      "12.5%",
      "10%",
      "15%",
      "20%"
    ],
    "_p_quiz": "IUeLREiYbn",
    "question": "What is 1/8 as a percentage?",
    "correct_answer": "12.5%",
    "_created_at": {
      "$date": "2024-10-23T08:41:59.389Z"
    },
    "_updated_at": {
      "$date": "2024-10-23T08:41:59.389Z"
    },
    "usedTimes": 0
  },
  {
    "_id": "vbMrcWTfbD",
    "options": [
      "45",
      "50",
      "40",
      "55"
    ],
    "_p_quiz": "IUeLREiYbn",
    "question": "What is 50% of 90?",
    "correct_answer": "45",
    "_created_at": {
      "$date": "2024-10-23T08:41:59.555Z"
    },
    "_updated_at": {
      "$date": "2024-10-23T08:41:59.555Z"
    },
    "usedTimes": 0
  },
  {
    "_id": "haWQucJJfA",
    "options": [
      "100",
      "10",
      "1000",
      "90"
    ],
    "_p_quiz": "IUeLREiYbn",
    "question": "What is the value of 10²?",
    "correct_answer": "100",
    "_created_at": {
      "$date": "2024-10-23T08:41:59.555Z"
    },
    "_updated_at": {
      "$date": "2024-10-23T08:41:59.555Z"
    },
    "usedTimes": 0
  },
  {
    "_id": "6k2DMTrjaE",
    "options": [
      "37.5%",
      "40%",
      "35%",
      "30%"
    ],
    "_p_quiz": "IUeLREiYbn",
    "question": "What is 3/8 as a percentage?",
    "correct_answer": "37.5%",
    "_created_at": {
      "$date": "2024-10-23T08:41:59.555Z"
    },
    "_updated_at": {
      "$date": "2024-10-23T08:41:59.555Z"
    },
    "usedTimes": 0
  },
  {
    "_id": "zY1BRCRwSs",
    "options": [
      "729",
      "81",
      "243",
      "189"
    ],
    "_p_quiz": "IUeLREiYbn",
    "question": "What is the value of 9³?",
    "correct_answer": "729",
    "_created_at": {
      "$date": "2024-10-23T08:41:59.555Z"
    },
    "_updated_at": {
      "$date": "2024-10-23T08:41:59.555Z"
    },
    "usedTimes": 0
  },
  {
    "_id": "buisx595yf",
    "options": [
      "1/2 × base × height",
      "base × height",
      "length × width",
      "πr²"
    ],
    "_p_quiz": "IUeLREiYbn",
    "question": "What is the formula for the area of a triangle?",
    "correct_answer": "1/2 × base × height",
    "_created_at": {
      "$date": "2024-10-23T08:41:59.555Z"
    },
    "_updated_at": {
      "$date": "2024-10-23T08:41:59.555Z"
    },
    "usedTimes": 0
  },
  {
    "_id": "bp3A3PPbuF",
    "options": [
      "10",
      "5",
      "15",
      "20"
    ],
    "_p_quiz": "IUeLREiYbn",
    "question": "What is the greatest common factor of 20 and 30?",
    "correct_answer": "10",
    "_created_at": {
      "$date": "2024-10-23T08:41:59.555Z"
    },
    "_updated_at": {
      "$date": "2024-10-23T08:41:59.555Z"
    },
    "usedTimes": 0
  },
  {
    "_id": "WIQbBXKK8G",
    "options": [
      "540°",
      "360°",
      "720°",
      "450°"
    ],
    "_p_quiz": "IUeLREiYbn",
    "question": "What is the sum of the angles in a pentagon?",
    "correct_answer": "540°",
    "_created_at": {
      "$date": "2024-10-23T08:41:59.555Z"
    },
    "_updated_at": {
      "$date": "2024-10-23T08:41:59.555Z"
    },
    "usedTimes": 0
  },
  {
    "_id": "WwGSAfJfu1",
    "options": [
      "10",
      "20",
      "15",
      "5"
    ],
    "_p_quiz": "IUeLREiYbn",
    "question": "What is the least common multiple of 5 and 10?",
    "correct_answer": "10",
    "_created_at": {
      "$date": "2024-10-23T08:41:59.555Z"
    },
    "_updated_at": {
      "$date": "2024-10-23T08:41:59.555Z"
    },
    "usedTimes": 0
  },
  {
    "_id": "W90H9rsypS",
    "options": [
      "0.285",
      "0.25",
      "0.3",
      "0.35"
    ],
    "_p_quiz": "IUeLREiYbn",
    "question": "What is 2/7 as a decimal?",
    "correct_answer": "0.285",
    "_created_at": {
      "$date": "2024-10-23T08:41:59.555Z"
    },
    "_updated_at": {
      "$date": "2024-10-23T08:41:59.555Z"
    },
    "usedTimes": 0
  },
  {
    "_id": "at9PBKZgKp",
    "options": [
      "36",
      "24",
      "18",
      "30"
    ],
    "_p_quiz": "IUeLREiYbn",
    "question": "What is the least common multiple of 9 and 12?",
    "correct_answer": "36",
    "_created_at": {
      "$date": "2024-10-23T08:41:59.555Z"
    },
    "_updated_at": {
      "$date": "2024-10-23T08:41:59.555Z"
    },
    "usedTimes": 0
  },
  {
    "_id": "KBM5nB2DV7",
    "options": [
      "7",
      "6",
      "5",
      "8"
    ],
    "_p_quiz": "IUeLREiYbn",
    "question": "What is the value of x in the equation x + 8 = 15?",
    "correct_answer": "7",
    "_created_at": {
      "$date": "2024-10-23T08:41:59.555Z"
    },
    "_updated_at": {
      "$date": "2024-10-23T08:41:59.555Z"
    },
    "usedTimes": 0
  },
  {
    "_id": "iHnc7TjD3P",
    "options": [
      "27",
      "18",
      "21",
      "24"
    ],
    "_p_quiz": "IUeLREiYbn",
    "question": "What is the value of 3³?",
    "correct_answer": "27",
    "_created_at": {
      "$date": "2024-10-23T08:41:59.555Z"
    },
    "_updated_at": {
      "$date": "2024-10-23T08:41:59.555Z"
    },
    "usedTimes": 0
  },
  {
    "_id": "04NTiWSsWX",
    "options": [
      "29",
      "25",
      "21",
      "31"
    ],
    "_p_quiz": "IUeLREiYbn",
    "question": "What is the value of 5² + 2²?",
    "correct_answer": "29",
    "_created_at": {
      "$date": "2024-10-23T08:41:59.555Z"
    },
    "_updated_at": {
      "$date": "2024-10-23T08:41:59.555Z"
    },
    "usedTimes": 0
  },
  {
    "_id": "PADAMrZVxO",
    "options": [
      "39",
      "36",
      "42",
      "33"
    ],
    "_p_quiz": "IUeLREiYbn",
    "question": "What is the product of 13 and 3?",
    "correct_answer": "39",
    "_created_at": {
      "$date": "2024-10-23T08:41:59.555Z"
    },
    "_updated_at": {
      "$date": "2024-10-23T08:41:59.555Z"
    },
    "usedTimes": 0
  },
  {
    "_id": "wSidJXY9OJ",
    "options": [
      "70%",
      "75%",
      "65%",
      "80%"
    ],
    "_p_quiz": "IUeLREiYbn",
    "question": "What is 7/10 as a percentage?",
    "correct_answer": "70%",
    "_created_at": {
      "$date": "2024-10-23T08:41:59.555Z"
    },
    "_updated_at": {
      "$date": "2024-10-23T08:41:59.555Z"
    },
    "usedTimes": 0
  },
  {
    "_id": "Jw6QnND1j6",
    "options": [
      "100",
      "90",
      "110",
      "95"
    ],
    "_p_quiz": "IUeLREiYbn",
    "question": "What is the sum of 78 and 22?",
    "correct_answer": "100",
    "_created_at": {
      "$date": "2024-10-23T08:41:59.555Z"
    },
    "_updated_at": {
      "$date": "2024-10-23T08:41:59.555Z"
    },
    "usedTimes": 0
  },
  {
    "_id": "jNb8KDe8i9",
    "options": [
      "32",
      "24",
      "36",
      "28"
    ],
    "_p_quiz": "IUeLREiYbn",
    "question": "What is the product of 4 and 8?",
    "correct_answer": "32",
    "_created_at": {
      "$date": "2024-10-23T08:41:59.555Z"
    },
    "_updated_at": {
      "$date": "2024-10-23T08:41:59.555Z"
    },
    "usedTimes": 0
  },
  {
    "_id": "oTyWi5NTJ9",
    "options": [
      "49",
      "42",
      "56",
      "36"
    ],
    "_p_quiz": "IUeLREiYbn",
    "question": "What is the value of 7²?",
    "correct_answer": "49",
    "_created_at": {
      "$date": "2024-10-23T08:41:59.555Z"
    },
    "_updated_at": {
      "$date": "2024-10-23T08:41:59.555Z"
    },
    "usedTimes": 0
  },
  {
    "_id": "YgUyAE6xu6",
    "options": [
      "20",
      "15",
      "25",
      "10"
    ],
    "_p_quiz": "IUeLREiYbn",
    "question": "What is the value of x in the equation x/5 = 4?",
    "correct_answer": "20",
    "_created_at": {
      "$date": "2024-10-23T08:41:59.555Z"
    },
    "_updated_at": {
      "$date": "2024-10-23T08:41:59.555Z"
    },
    "usedTimes": 0
  },
  {
    "_id": "0n4EcfFeOi",
    "options": [
      "20",
      "18",
      "22",
      "24"
    ],
    "_p_quiz": "IUeLREiYbn",
    "question": "What is the perimeter of a rectangle with length 7 and width 3?",
    "correct_answer": "20",
    "_created_at": {
      "$date": "2024-10-23T08:41:59.555Z"
    },
    "_updated_at": {
      "$date": "2024-10-23T08:41:59.555Z"
    },
    "usedTimes": 0
  },
  {
    "_id": "sDnUcOwHe6",
    "options": [
      "15",
      "20",
      "25",
      "10"
    ],
    "_p_quiz": "IUeLREiYbn",
    "question": "What is 25% of 60?",
    "correct_answer": "15",
    "_created_at": {
      "$date": "2024-10-23T08:41:59.723Z"
    },
    "_updated_at": {
      "$date": "2024-10-23T08:41:59.723Z"
    },
    "usedTimes": 0
  },
  {
    "_id": "ijQAk159Dy",
    "options": [
      "14",
      "21",
      "28",
      "35"
    ],
    "_p_quiz": "IUeLREiYbn",
    "question": "What is the least common multiple of 7 and 14?",
    "correct_answer": "14",
    "_created_at": {
      "$date": "2024-10-23T08:41:59.723Z"
    },
    "_updated_at": {
      "$date": "2024-10-23T08:41:59.723Z"
    },
    "usedTimes": 0
  },
  {
    "_id": "rYYA68S19v",
    "options": [
      "22.22%",
      "20%",
      "25%",
      "18%"
    ],
    "_p_quiz": "IUeLREiYbn",
    "question": "What is 2/9 as a percentage?",
    "correct_answer": "22.22%",
    "_created_at": {
      "$date": "2024-10-23T08:41:59.723Z"
    },
    "_updated_at": {
      "$date": "2024-10-23T08:41:59.723Z"
    },
    "usedTimes": 0
  },
  {
    "_id": "jWZkINRMsy",
    "options": [
      "121",
      "110",
      "132",
      "101"
    ],
    "_p_quiz": "IUeLREiYbn",
    "question": "What is the value of 11²?",
    "correct_answer": "121",
    "_created_at": {
      "$date": "2024-10-23T08:41:59.723Z"
    },
    "_updated_at": {
      "$date": "2024-10-23T08:41:59.723Z"
    },
    "usedTimes": 0
  },
  {
    "_id": "CAjpqzm0Hq",
    "options": [
      "0.166",
      "0.2",
      "0.25",
      "0.5"
    ],
    "_p_quiz": "IUeLREiYbn",
    "question": "What is 1/6 as a decimal?",
    "correct_answer": "0.166",
    "_created_at": {
      "$date": "2024-10-23T08:41:59.723Z"
    },
    "_updated_at": {
      "$date": "2024-10-23T08:41:59.723Z"
    },
    "usedTimes": 0
  },
  {
    "_id": "B9eFqQB4kJ",
    "options": [
      "πr²",
      "2πr",
      "πd",
      "2πd"
    ],
    "_p_quiz": "IUeLREiYbn",
    "question": "What is the formula for the area of a circle?",
    "correct_answer": "πr²",
    "_created_at": {
      "$date": "2024-10-23T08:41:59.723Z"
    },
    "_updated_at": {
      "$date": "2024-10-23T08:41:59.723Z"
    },
    "usedTimes": 0
  },
  {
    "_id": "7OVoEPctUf",
    "options": [
      "8",
      "4",
      "12",
      "16"
    ],
    "_p_quiz": "IUeLREiYbn",
    "question": "What is the greatest common factor of 16 and 24?",
    "correct_answer": "8",
    "_created_at": {
      "$date": "2024-10-23T08:41:59.723Z"
    },
    "_updated_at": {
      "$date": "2024-10-23T08:41:59.723Z"
    },
    "usedTimes": 0
  },
  {
    "_id": "K9Q5io8dTM",
    "options": [
      "Heart",
      "Liver",
      "Kidneys",
      "Lungs"
    ],
    "_p_quiz": "JF2YKhJdDh",
    "question": "Which organ is primarily responsible for filtering blood in the human body?",
    "correct_answer": "Kidneys",
    "_created_at": {
      "$date": "2024-10-24T19:03:21.650Z"
    },
    "_updated_at": {
      "$date": "2024-10-24T19:03:21.650Z"
    },
    "usedTimes": 0
  },
  {
    "_id": "YhNAffFz86",
    "options": [
      "Magnetism",
      "Electromagnetic force",
      "Gravity",
      "Nuclear force"
    ],
    "_p_quiz": "JF2YKhJdDh",
    "question": "What force keeps planets in orbit around the sun?",
    "correct_answer": "Gravity",
    "_created_at": {
      "$date": "2024-10-24T19:03:21.650Z"
    },
    "_updated_at": {
      "$date": "2024-10-24T19:03:21.650Z"
    },
    "usedTimes": 0
  },
  {
    "_id": "d7znIW0CKN",
    "options": [
      "0°C",
      "50°C",
      "100°C",
      "212°C"
    ],
    "_p_quiz": "JF2YKhJdDh",
    "question": "What is the boiling point of water at sea level in Celsius?",
    "correct_answer": "100°C",
    "_created_at": {
      "$date": "2024-10-24T19:03:21.651Z"
    },
    "_updated_at": {
      "$date": "2024-10-24T19:03:21.651Z"
    },
    "usedTimes": 0
  },
  {
    "_id": "vAU5nQpnfZ",
    "options": [
      "Atom",
      "Molecule",
      "Compound",
      "Ion"
    ],
    "_p_quiz": "JF2YKhJdDh",
    "question": "What is the smallest unit of an element that retains the properties of that element?",
    "correct_answer": "Atom",
    "_created_at": {
      "$date": "2024-10-24T19:03:21.650Z"
    },
    "_updated_at": {
      "$date": "2024-10-24T19:03:21.650Z"
    },
    "usedTimes": 0
  },
  {
    "_id": "cuePZGIAtb",
    "options": [
      "Carbon Dioxide",
      "Oxygen",
      "Nitrogen",
      "Hydrogen"
    ],
    "_p_quiz": "JF2YKhJdDh",
    "question": "Which gas is released by plants during photosynthesis?",
    "correct_answer": "Oxygen",
    "_created_at": {
      "$date": "2024-10-24T19:03:21.651Z"
    },
    "_updated_at": {
      "$date": "2024-10-24T19:03:21.651Z"
    },
    "usedTimes": 0
  },
  {
    "_id": "OsQrTxbivG",
    "options": [
      "Endangered",
      "Extinct",
      "Threatened",
      "Vulnerable"
    ],
    "_p_quiz": "JF2YKhJdDh",
    "question": "What is the term for a species that no longer exists?",
    "correct_answer": "Extinct",
    "_created_at": {
      "$date": "2024-10-24T19:03:21.650Z"
    },
    "_updated_at": {
      "$date": "2024-10-24T19:03:21.650Z"
    },
    "usedTimes": 0
  },
  {
    "_id": "OFPo3ck1hU",
    "options": [
      "Au",
      "Ag",
      "Pb",
      "Fe"
    ],
    "_p_quiz": "JF2YKhJdDh",
    "question": "What is the chemical symbol for gold?",
    "correct_answer": "Au",
    "_created_at": {
      "$date": "2024-10-24T19:03:21.650Z"
    },
    "_updated_at": {
      "$date": "2024-10-24T19:03:21.650Z"
    },
    "usedTimes": 0
  },
  {
    "_id": "FbDGMRJAGG",
    "options": [
      "Nucleus",
      "Mitochondria",
      "Ribosome",
      "Chloroplast"
    ],
    "_p_quiz": "JF2YKhJdDh",
    "question": "What is the powerhouse of the cell?",
    "correct_answer": "Mitochondria",
    "_created_at": {
      "$date": "2024-10-24T19:03:21.650Z"
    },
    "_updated_at": {
      "$date": "2024-10-24T19:03:21.650Z"
    },
    "usedTimes": 0
  },
  {
    "_id": "HVM5OeqUrq",
    "options": [
      "Transport oxygen",
      "Clot blood",
      "Fight infections",
      "Carry nutrients"
    ],
    "_p_quiz": "JF2YKhJdDh",
    "question": "What is the primary function of white blood cells?",
    "correct_answer": "Fight infections",
    "_created_at": {
      "$date": "2024-10-24T19:03:21.650Z"
    },
    "_updated_at": {
      "$date": "2024-10-24T19:03:21.650Z"
    },
    "usedTimes": 0
  },
  {
    "_id": "pm4sVRDgzF",
    "options": [
      "Oxygen",
      "Carbon Dioxide",
      "Nitrogen",
      "Argon"
    ],
    "_p_quiz": "JF2YKhJdDh",
    "question": "What is the most abundant gas in Earth's atmosphere?",
    "correct_answer": "Nitrogen",
    "_created_at": {
      "$date": "2024-10-24T19:03:21.650Z"
    },
    "_updated_at": {
      "$date": "2024-10-24T19:03:21.650Z"
    },
    "usedTimes": 0
  },
  {
    "_id": "AaOGO7CGZp",
    "options": [
      "Photosynthesis",
      "Respiration",
      "Transpiration",
      "Digestion"
    ],
    "_p_quiz": "JF2YKhJdDh",
    "question": "What is the process by which plants convert sunlight into chemical energy?",
    "correct_answer": "Photosynthesis",
    "_created_at": {
      "$date": "2024-10-24T19:03:21.650Z"
    },
    "_updated_at": {
      "$date": "2024-10-24T19:03:21.650Z"
    },
    "usedTimes": 0
  },
  {
    "_id": "OD4pN22yyp",
    "options": [
      "Mars",
      "Jupiter",
      "Saturn",
      "Venus"
    ],
    "_p_quiz": "JF2YKhJdDh",
    "question": "Which planet in our solar system is known for having a prominent ring system?",
    "correct_answer": "Saturn",
    "_created_at": {
      "$date": "2024-10-24T19:03:21.650Z"
    },
    "_updated_at": {
      "$date": "2024-10-24T19:03:21.650Z"
    },
    "usedTimes": 0
  },
  {
    "_id": "Gk25rpSFGs",
    "options": [
      "Crust",
      "Mantle",
      "Outer Core",
      "Inner Core"
    ],
    "_p_quiz": "JF2YKhJdDh",
    "question": "Which layer of the Earth is liquid?",
    "correct_answer": "Outer Core",
    "_created_at": {
      "$date": "2024-10-24T19:03:21.651Z"
    },
    "_updated_at": {
      "$date": "2024-10-24T19:03:21.651Z"
    },
    "usedTimes": 0
  },
  {
    "_id": "TX0f4NcXM7",
    "options": [
      "Joule",
      "Newton",
      "Pascal",
      "Watt"
    ],
    "_p_quiz": "JF2YKhJdDh",
    "question": "What is the SI unit of force?",
    "correct_answer": "Newton",
    "_created_at": {
      "$date": "2024-10-24T19:03:21.651Z"
    },
    "_updated_at": {
      "$date": "2024-10-24T19:03:21.651Z"
    },
    "usedTimes": 0
  },
  {
    "_id": "gtOulZA99q",
    "options": [
      "Mitochondria",
      "Chloroplast",
      "Nucleus",
      "Ribosome"
    ],
    "_p_quiz": "JF2YKhJdDh",
    "question": "Which organelle is responsible for photosynthesis in plant cells?",
    "correct_answer": "Chloroplast",
    "_created_at": {
      "$date": "2024-10-24T19:03:21.650Z"
    },
    "_updated_at": {
      "$date": "2024-10-24T19:03:21.650Z"
    },
    "usedTimes": 0
  },
  {
    "_id": "xmiUQK1T04",
    "options": [
      "Cytoplasm",
      "Ribosome",
      "Nucleus",
      "Cell membrane"
    ],
    "_p_quiz": "JF2YKhJdDh",
    "question": "Which part of the cell contains the genetic material?",
    "correct_answer": "Nucleus",
    "_created_at": {
      "$date": "2024-10-24T19:03:21.651Z"
    },
    "_updated_at": {
      "$date": "2024-10-24T19:03:21.651Z"
    },
    "usedTimes": 0
  },
  {
    "_id": "mVidSoPswJ",
    "options": [
      "Melting",
      "Condensation",
      "Sublimation",
      "Evaporation"
    ],
    "_p_quiz": "JF2YKhJdDh",
    "question": "What is the term for a change of state from solid directly to gas?",
    "correct_answer": "Sublimation",
    "_created_at": {
      "$date": "2024-10-24T19:03:21.651Z"
    },
    "_updated_at": {
      "$date": "2024-10-24T19:03:21.651Z"
    },
    "usedTimes": 0
  },
  {
    "_id": "n1KCNrh4R9",
    "options": [
      "Digest proteins",
      "Absorb nutrients",
      "Absorb water",
      "Produce bile"
    ],
    "_p_quiz": "JF2YKhJdDh",
    "question": "What is the primary purpose of the large intestine in the human digestive system?",
    "correct_answer": "Absorb water",
    "_created_at": {
      "$date": "2024-10-24T19:03:21.651Z"
    },
    "_updated_at": {
      "$date": "2024-10-24T19:03:21.651Z"
    },
    "usedTimes": 0
  },
  {
    "_id": "ZUfRGPNcTH",
    "options": [
      "Kinetic energy",
      "Potential energy",
      "Chemical energy",
      "Thermal energy"
    ],
    "_p_quiz": "JF2YKhJdDh",
    "question": "What type of energy is stored in the bonds of chemical compounds?",
    "correct_answer": "Chemical energy",
    "_created_at": {
      "$date": "2024-10-24T19:03:21.651Z"
    },
    "_updated_at": {
      "$date": "2024-10-24T19:03:21.651Z"
    },
    "usedTimes": 0
  },
  {
    "_id": "J8M95F64IX",
    "options": [
      "Albert Einstein",
      "Isaac Newton",
      "Galileo Galilei",
      "Nikola Tesla"
    ],
    "_p_quiz": "JF2YKhJdDh",
    "question": "Which scientist is known for the law of universal gravitation?",
    "correct_answer": "Isaac Newton",
    "_created_at": {
      "$date": "2024-10-24T19:03:21.651Z"
    },
    "_updated_at": {
      "$date": "2024-10-24T19:03:21.651Z"
    },
    "usedTimes": 0
  },
  {
    "_id": "EYidFQdggx",
    "options": [
      "Oxygen",
      "Carbon Dioxide",
      "Nitrogen",
      "Argon"
    ],
    "_p_quiz": "JF2YKhJdDh",
    "question": "What is the most abundant gas in Earth's atmosphere?",
    "correct_answer": "Nitrogen",
    "_created_at": {
      "$date": "2024-10-24T19:03:21.722Z"
    },
    "_updated_at": {
      "$date": "2024-10-24T19:03:21.722Z"
    },
    "usedTimes": 0
  },
  {
    "_id": "IOGEY9Zm7d",
    "options": [
      "Heart",
      "Liver",
      "Kidneys",
      "Lungs"
    ],
    "_p_quiz": "JF2YKhJdDh",
    "question": "Which organ is primarily responsible for filtering blood in the human body?",
    "correct_answer": "Kidneys",
    "_created_at": {
      "$date": "2024-10-24T19:03:21.722Z"
    },
    "_updated_at": {
      "$date": "2024-10-24T19:03:21.722Z"
    },
    "usedTimes": 0
  },
  {
    "_id": "1wX6beABbj",
    "options": [
      "0°C",
      "50°C",
      "100°C",
      "212°C"
    ],
    "_p_quiz": "JF2YKhJdDh",
    "question": "What is the boiling point of water at sea level in Celsius?",
    "correct_answer": "100°C",
    "_created_at": {
      "$date": "2024-10-24T19:03:21.722Z"
    },
    "_updated_at": {
      "$date": "2024-10-24T19:03:21.722Z"
    },
    "usedTimes": 0
  },
  {
    "_id": "8Em0veyXKd",
    "options": [
      "Crust",
      "Mantle",
      "Outer Core",
      "Inner Core"
    ],
    "_p_quiz": "JF2YKhJdDh",
    "question": "Which layer of the Earth is liquid?",
    "correct_answer": "Outer Core",
    "_created_at": {
      "$date": "2024-10-24T19:03:21.722Z"
    },
    "_updated_at": {
      "$date": "2024-10-24T19:03:21.722Z"
    },
    "usedTimes": 0
  },
  {
    "_id": "Tv5nejLO1S",
    "options": [
      "Joule",
      "Newton",
      "Pascal",
      "Watt"
    ],
    "_p_quiz": "JF2YKhJdDh",
    "question": "What is the SI unit of force?",
    "correct_answer": "Newton",
    "_created_at": {
      "$date": "2024-10-24T19:03:21.722Z"
    },
    "_updated_at": {
      "$date": "2024-10-24T19:03:21.722Z"
    },
    "usedTimes": 0
  },
  {
    "_id": "jNNWIOeVFB",
    "options": [
      "Nucleus",
      "Mitochondria",
      "Ribosome",
      "Chloroplast"
    ],
    "_p_quiz": "JF2YKhJdDh",
    "question": "What is the powerhouse of the cell?",
    "correct_answer": "Mitochondria",
    "_created_at": {
      "$date": "2024-10-24T19:03:21.722Z"
    },
    "_updated_at": {
      "$date": "2024-10-24T19:03:21.722Z"
    },
    "usedTimes": 0
  },
  {
    "_id": "j0eIP2Bm9i",
    "options": [
      "Albert Einstein",
      "Isaac Newton",
      "Galileo Galilei",
      "Nikola Tesla"
    ],
    "_p_quiz": "JF2YKhJdDh",
    "question": "Which scientist is known for the law of universal gravitation?",
    "correct_answer": "Isaac Newton",
    "_created_at": {
      "$date": "2024-10-24T19:03:21.722Z"
    },
    "_updated_at": {
      "$date": "2024-10-24T19:03:21.722Z"
    },
    "usedTimes": 0
  },
  {
    "_id": "QNyGMgsWBE",
    "options": [
      "Digest proteins",
      "Absorb nutrients",
      "Absorb water",
      "Produce bile"
    ],
    "_p_quiz": "JF2YKhJdDh",
    "question": "What is the primary purpose of the large intestine in the human digestive system?",
    "correct_answer": "Absorb water",
    "_created_at": {
      "$date": "2024-10-24T19:03:21.722Z"
    },
    "_updated_at": {
      "$date": "2024-10-24T19:03:21.722Z"
    },
    "usedTimes": 0
  },
  {
    "_id": "MTejGXe6Bh",
    "options": [
      "Mars",
      "Jupiter",
      "Saturn",
      "Venus"
    ],
    "_p_quiz": "JF2YKhJdDh",
    "question": "Which planet in our solar system is known for having a prominent ring system?",
    "correct_answer": "Saturn",
    "_created_at": {
      "$date": "2024-10-24T19:03:21.722Z"
    },
    "_updated_at": {
      "$date": "2024-10-24T19:03:21.722Z"
    },
    "usedTimes": 0
  },
  {
    "_id": "33FaYq0EeM",
    "options": [
      "Au",
      "Ag",
      "Pb",
      "Fe"
    ],
    "_p_quiz": "JF2YKhJdDh",
    "question": "What is the chemical symbol for gold?",
    "correct_answer": "Au",
    "_created_at": {
      "$date": "2024-10-24T19:03:21.722Z"
    },
    "_updated_at": {
      "$date": "2024-10-24T19:03:21.722Z"
    },
    "usedTimes": 0
  },
  {
    "_id": "wcpUSVSSqf",
    "options": [
      "Magnetism",
      "Electromagnetic force",
      "Gravity",
      "Nuclear force"
    ],
    "_p_quiz": "JF2YKhJdDh",
    "question": "What force keeps planets in orbit around the sun?",
    "correct_answer": "Gravity",
    "_created_at": {
      "$date": "2024-10-24T19:03:21.722Z"
    },
    "_updated_at": {
      "$date": "2024-10-24T19:03:21.722Z"
    },
    "usedTimes": 0
  },
  {
    "_id": "3dJLUlKmaA",
    "options": [
      "Photosynthesis",
      "Respiration",
      "Transpiration",
      "Digestion"
    ],
    "_p_quiz": "JF2YKhJdDh",
    "question": "What is the process by which plants convert sunlight into chemical energy?",
    "correct_answer": "Photosynthesis",
    "_created_at": {
      "$date": "2024-10-24T19:03:21.722Z"
    },
    "_updated_at": {
      "$date": "2024-10-24T19:03:21.722Z"
    },
    "usedTimes": 0
  },
  {
    "_id": "Meqi2UCBuq",
    "options": [
      "Atom",
      "Molecule",
      "Compound",
      "Ion"
    ],
    "_p_quiz": "JF2YKhJdDh",
    "question": "What is the smallest unit of an element that retains the properties of that element?",
    "correct_answer": "Atom",
    "_created_at": {
      "$date": "2024-10-24T19:03:21.722Z"
    },
    "_updated_at": {
      "$date": "2024-10-24T19:03:21.722Z"
    },
    "usedTimes": 0
  },
  {
    "_id": "4EMX0XITWP",
    "options": [
      "Transport oxygen",
      "Clot blood",
      "Fight infections",
      "Carry nutrients"
    ],
    "_p_quiz": "JF2YKhJdDh",
    "question": "What is the primary function of white blood cells?",
    "correct_answer": "Fight infections",
    "_created_at": {
      "$date": "2024-10-24T19:03:21.722Z"
    },
    "_updated_at": {
      "$date": "2024-10-24T19:03:21.722Z"
    },
    "usedTimes": 0
  },
  {
    "_id": "pQf1OqJ0yH",
    "options": [
      "Mitochondria",
      "Chloroplast",
      "Nucleus",
      "Ribosome"
    ],
    "_p_quiz": "JF2YKhJdDh",
    "question": "Which organelle is responsible for photosynthesis in plant cells?",
    "correct_answer": "Chloroplast",
    "_created_at": {
      "$date": "2024-10-24T19:03:21.722Z"
    },
    "_updated_at": {
      "$date": "2024-10-24T19:03:21.722Z"
    },
    "usedTimes": 0
  },
  {
    "_id": "a4vlPRvLGb",
    "options": [
      "Endangered",
      "Extinct",
      "Threatened",
      "Vulnerable"
    ],
    "_p_quiz": "JF2YKhJdDh",
    "question": "What is the term for a species that no longer exists?",
    "correct_answer": "Extinct",
    "_created_at": {
      "$date": "2024-10-24T19:03:21.722Z"
    },
    "_updated_at": {
      "$date": "2024-10-24T19:03:21.722Z"
    },
    "usedTimes": 0
  },
  {
    "_id": "f2Od1myeZ0",
    "options": [
      "Cytoplasm",
      "Ribosome",
      "Nucleus",
      "Cell membrane"
    ],
    "_p_quiz": "JF2YKhJdDh",
    "question": "Which part of the cell contains the genetic material?",
    "correct_answer": "Nucleus",
    "_created_at": {
      "$date": "2024-10-24T19:03:21.722Z"
    },
    "_updated_at": {
      "$date": "2024-10-24T19:03:21.722Z"
    },
    "usedTimes": 0
  },
  {
    "_id": "ZXdRyZ4plP",
    "options": [
      "Carbon Dioxide",
      "Oxygen",
      "Nitrogen",
      "Hydrogen"
    ],
    "_p_quiz": "JF2YKhJdDh",
    "question": "Which gas is released by plants during photosynthesis?",
    "correct_answer": "Oxygen",
    "_created_at": {
      "$date": "2024-10-24T19:03:21.722Z"
    },
    "_updated_at": {
      "$date": "2024-10-24T19:03:21.722Z"
    },
    "usedTimes": 0
  },
  {
    "_id": "CYm8KNCeIG",
    "options": [
      "Kinetic energy",
      "Potential energy",
      "Chemical energy",
      "Thermal energy"
    ],
    "_p_quiz": "JF2YKhJdDh",
    "question": "What type of energy is stored in the bonds of chemical compounds?",
    "correct_answer": "Chemical energy",
    "_created_at": {
      "$date": "2024-10-24T19:03:21.722Z"
    },
    "_updated_at": {
      "$date": "2024-10-24T19:03:21.722Z"
    },
    "usedTimes": 0
  },
  {
    "_id": "Rq7FyHbHfw",
    "options": [
      "Melting",
      "Condensation",
      "Sublimation",
      "Evaporation"
    ],
    "_p_quiz": "JF2YKhJdDh",
    "question": "What is the term for a change of state from solid directly to gas?",
    "correct_answer": "Sublimation",
    "_created_at": {
      "$date": "2024-10-24T19:03:21.722Z"
    },
    "_updated_at": {
      "$date": "2024-10-24T19:03:21.722Z"
    },
    "usedTimes": 0
  },
  {
    "_id": "e6ZUaoBMmI",
    "options": [
      "Sedimentary",
      "Metamorphic",
      "Igneous",
      "Basaltic"
    ],
    "_p_quiz": "JF2YKhJdDh",
    "question": "Which type of rock is formed from the cooling and solidification of magma or lava?",
    "correct_answer": "Igneous",
    "_created_at": {
      "$date": "2024-10-24T19:03:21.774Z"
    },
    "_updated_at": {
      "$date": "2024-10-24T19:03:21.774Z"
    },
    "usedTimes": 0
  },
  {
    "_id": "PZ7Chbz0X9",
    "options": [
      "H2O",
      "NaCl",
      "CO2",
      "C6H12O6"
    ],
    "_p_quiz": "JF2YKhJdDh",
    "question": "What is the chemical formula for table salt?",
    "correct_answer": "NaCl",
    "_created_at": {
      "$date": "2024-10-24T19:03:21.774Z"
    },
    "_updated_at": {
      "$date": "2024-10-24T19:03:21.774Z"
    },
    "usedTimes": 0
  },
  {
    "_id": "7I6yNjuynj",
    "options": [
      "Oxygen",
      "Hydrogen",
      "Helium",
      "Carbon"
    ],
    "_p_quiz": "JF2YKhJdDh",
    "question": "What is the most common element in the universe?",
    "correct_answer": "Hydrogen",
    "_created_at": {
      "$date": "2024-10-24T19:03:21.774Z"
    },
    "_updated_at": {
      "$date": "2024-10-24T19:03:21.774Z"
    },
    "usedTimes": 0
  },
  {
    "_id": "IA4DDaIEkA",
    "options": [
      "Nuclear fusion",
      "Nuclear fission",
      "Radioactive decay",
      "Ionization"
    ],
    "_p_quiz": "JF2YKhJdDh",
    "question": "Which process involves the splitting of a nucleus into smaller fragments?",
    "correct_answer": "Nuclear fission",
    "_created_at": {
      "$date": "2024-10-24T19:03:21.774Z"
    },
    "_updated_at": {
      "$date": "2024-10-24T19:03:21.774Z"
    },
    "usedTimes": 0
  },
  {
    "_id": "nx1ffInG9w",
    "options": [
      "Fluorine",
      "Iron",
      "Francium",
      "Fermium"
    ],
    "_p_quiz": "JF2YKhJdDh",
    "question": "Which chemical element has the symbol 'Fe'?",
    "correct_answer": "Iron",
    "_created_at": {
      "$date": "2024-10-24T19:03:21.774Z"
    },
    "_updated_at": {
      "$date": "2024-10-24T19:03:21.774Z"
    },
    "usedTimes": 0
  },
  {
    "_id": "KyBT5ZNa0w",
    "options": [
      "Mitochondria",
      "Ribosome",
      "Golgi apparatus",
      "Lysosome"
    ],
    "_p_quiz": "JF2YKhJdDh",
    "question": "What part of the cell is responsible for making proteins?",
    "correct_answer": "Ribosome",
    "_created_at": {
      "$date": "2024-10-24T19:03:21.774Z"
    },
    "_updated_at": {
      "$date": "2024-10-24T19:03:21.774Z"
    },
    "usedTimes": 0
  },
  {
    "_id": "Syz5PxVXNQ",
    "options": [
      "Quartz",
      "Feldspar",
      "Mica",
      "Calcite"
    ],
    "_p_quiz": "JF2YKhJdDh",
    "question": "What is the most common mineral in the Earth's crust?",
    "correct_answer": "Feldspar",
    "_created_at": {
      "$date": "2024-10-24T19:03:21.774Z"
    },
    "_updated_at": {
      "$date": "2024-10-24T19:03:21.774Z"
    },
    "usedTimes": 0
  },
  {
    "_id": "BJqQnA03UQ",
    "options": [
      "Oxygen",
      "Nitrogen",
      "Carbon Dioxide",
      "Hydrogen"
    ],
    "_p_quiz": "JF2YKhJdDh",
    "question": "What is the main gas responsible for the greenhouse effect?",
    "correct_answer": "Carbon Dioxide",
    "_created_at": {
      "$date": "2024-10-24T19:03:21.774Z"
    },
    "_updated_at": {
      "$date": "2024-10-24T19:03:21.774Z"
    },
    "usedTimes": 0
  },
  {
    "_id": "I4vMpcCYBQ",
    "options": [
      "Kinetic energy",
      "Potential energy",
      "Thermal energy",
      "Chemical energy"
    ],
    "_p_quiz": "JF2YKhJdDh",
    "question": "What type of energy is associated with motion?",
    "correct_answer": "Kinetic energy",
    "_created_at": {
      "$date": "2024-10-24T19:03:21.774Z"
    },
    "_updated_at": {
      "$date": "2024-10-24T19:03:21.774Z"
    },
    "usedTimes": 0
  },
  {
    "_id": "bT4y8wQW2T",
    "options": [
      "Fight infections",
      "Clot blood",
      "Transport oxygen",
      "Carry hormones"
    ],
    "_p_quiz": "JF2YKhJdDh",
    "question": "What is the primary function of red blood cells?",
    "correct_answer": "Transport oxygen",
    "_created_at": {
      "$date": "2024-10-24T19:03:21.774Z"
    },
    "_updated_at": {
      "$date": "2024-10-24T19:03:21.774Z"
    },
    "usedTimes": 0
  },
  {
    "_id": "Rk65ZJOUVX",
    "options": [
      "Melting",
      "Condensation",
      "Sublimation",
      "Evaporation"
    ],
    "_p_quiz": "JF2YKhJdDh",
    "question": "What is the process by which a solid changes directly to a gas?",
    "correct_answer": "Sublimation",
    "_created_at": {
      "$date": "2024-10-24T19:03:21.774Z"
    },
    "_updated_at": {
      "$date": "2024-10-24T19:03:21.774Z"
    },
    "usedTimes": 0
  },
  {
    "_id": "aisAZnHo51",
    "options": [
      "Mitochondria",
      "Chloroplast",
      "Nucleus",
      "Endoplasmic reticulum"
    ],
    "_p_quiz": "JF2YKhJdDh",
    "question": "Which organelle is known as the 'control center' of the cell?",
    "correct_answer": "Nucleus",
    "_created_at": {
      "$date": "2024-10-24T19:03:21.774Z"
    },
    "_updated_at": {
      "$date": "2024-10-24T19:03:21.774Z"
    },
    "usedTimes": 0
  },
  {
    "_id": "tJtvPuumAd",
    "options": [
      "Mitosis",
      "Meiosis",
      "Binary fission",
      "Budding"
    ],
    "_p_quiz": "JF2YKhJdDh",
    "question": "What type of cell division is used for growth and repair in the body?",
    "correct_answer": "Mitosis",
    "_created_at": {
      "$date": "2024-10-24T19:03:21.774Z"
    },
    "_updated_at": {
      "$date": "2024-10-24T19:03:21.774Z"
    },
    "usedTimes": 0
  },
  {
    "_id": "bG0VNICJUR",
    "options": [
      "Mass",
      "Weight",
      "Volume",
      "Density"
    ],
    "_p_quiz": "JF2YKhJdDh",
    "question": "What is the term for the amount of space an object occupies?",
    "correct_answer": "Volume",
    "_created_at": {
      "$date": "2024-10-24T19:03:21.774Z"
    },
    "_updated_at": {
      "$date": "2024-10-24T19:03:21.774Z"
    },
    "usedTimes": 0
  },
  {
    "_id": "McQwSzIHy4",
    "options": [
      "Helium",
      "Hydrogen",
      "Carbon",
      "Oxygen"
    ],
    "_p_quiz": "JF2YKhJdDh",
    "question": "What is the primary component of the sun?",
    "correct_answer": "Hydrogen",
    "_created_at": {
      "$date": "2024-10-24T19:03:21.774Z"
    },
    "_updated_at": {
      "$date": "2024-10-24T19:03:21.774Z"
    },
    "usedTimes": 0
  },
  {
    "_id": "03KaBEsGb4",
    "options": [
      "Liver",
      "Pancreas",
      "Kidneys",
      "Heart"
    ],
    "_p_quiz": "JF2YKhJdDh",
    "question": "What organ in the human body produces insulin?",
    "correct_answer": "Pancreas",
    "_created_at": {
      "$date": "2024-10-24T19:03:21.774Z"
    },
    "_updated_at": {
      "$date": "2024-10-24T19:03:21.774Z"
    },
    "usedTimes": 0
  },
  {
    "_id": "GlmpXuHjPP",
    "options": [
      "Liver",
      "Heart",
      "Skin",
      "Lungs"
    ],
    "_p_quiz": "JF2YKhJdDh",
    "question": "What is the largest organ in the human body?",
    "correct_answer": "Skin",
    "_created_at": {
      "$date": "2024-10-24T19:03:21.774Z"
    },
    "_updated_at": {
      "$date": "2024-10-24T19:03:21.774Z"
    },
    "usedTimes": 0
  },
  {
    "_id": "TbABx0lfKj",
    "options": [
      "Habitat",
      "Niche",
      "Ecosystem",
      "Community"
    ],
    "_p_quiz": "JF2YKhJdDh",
    "question": "What is the term for an organism's role in its environment?",
    "correct_answer": "Niche",
    "_created_at": {
      "$date": "2024-10-24T19:03:21.774Z"
    },
    "_updated_at": {
      "$date": "2024-10-24T19:03:21.774Z"
    },
    "usedTimes": 0
  },
  {
    "_id": "BkuND3VHmR",
    "options": [
      "0",
      "7",
      "14",
      "5"
    ],
    "_p_quiz": "JF2YKhJdDh",
    "question": "What is the pH level of pure water?",
    "correct_answer": "7",
    "_created_at": {
      "$date": "2024-10-24T19:03:21.774Z"
    },
    "_updated_at": {
      "$date": "2024-10-24T19:03:21.774Z"
    },
    "usedTimes": 0
  },
  {
    "_id": "dkEWGpxjLq",
    "options": [
      "Mars",
      "Venus",
      "Jupiter",
      "Mercury"
    ],
    "_p_quiz": "JF2YKhJdDh",
    "question": "Which planet is closest in size to Earth?",
    "correct_answer": "Venus",
    "_created_at": {
      "$date": "2024-10-24T19:03:21.774Z"
    },
    "_updated_at": {
      "$date": "2024-10-24T19:03:21.774Z"
    },
    "usedTimes": 0
  },
  {
    "_id": "6Qn2nUieRm",
    "options": [
      "Compound",
      "Molecule",
      "Element",
      "Mixture"
    ],
    "_p_quiz": "JF2YKhJdDh",
    "question": "What is the term for a substance made of only one type of atom?",
    "correct_answer": "Element",
    "_created_at": {
      "$date": "2024-10-24T19:03:21.816Z"
    },
    "_updated_at": {
      "$date": "2024-10-24T19:03:21.816Z"
    },
    "usedTimes": 0
  },
  {
    "_id": "PUiw1aXPPR",
    "options": [
      "Troposphere",
      "Stratosphere",
      "Mesosphere",
      "Thermosphere"
    ],
    "_p_quiz": "JF2YKhJdDh",
    "question": "Which layer of the atmosphere contains the ozone layer?",
    "correct_answer": "Stratosphere",
    "_created_at": {
      "$date": "2024-10-24T19:03:21.816Z"
    },
    "_updated_at": {
      "$date": "2024-10-24T19:03:21.816Z"
    },
    "usedTimes": 0
  },
  {
    "_id": "PLg97eO0Dc",
    "options": [
      "CH4",
      "C2H6",
      "C3H8",
      "C4H10"
    ],
    "_p_quiz": "JF2YKhJdDh",
    "question": "What is the chemical formula for methane?",
    "correct_answer": "CH4",
    "_created_at": {
      "$date": "2024-10-24T19:03:21.817Z"
    },
    "_updated_at": {
      "$date": "2024-10-24T19:03:21.817Z"
    },
    "usedTimes": 0
  },
  {
    "_id": "vtS85cv7dE",
    "options": [
      "Sirius",
      "Alpha Centauri",
      "Sun",
      "Betelgeuse"
    ],
    "_p_quiz": "JF2YKhJdDh",
    "question": "What is the closest star to Earth?",
    "correct_answer": "Sun",
    "_created_at": {
      "$date": "2024-10-24T19:03:21.817Z"
    },
    "_updated_at": {
      "$date": "2024-10-24T19:03:21.817Z"
    },
    "usedTimes": 0
  },
  {
    "_id": "F2RTuu83W7",
    "options": [
      "Noble gases",
      "Alkali metals",
      "Halogens",
      "Transition metals"
    ],
    "_p_quiz": "JF2YKhJdDh",
    "question": "What is the most reactive group of nonmetals in the periodic table?",
    "correct_answer": "Halogens",
    "_created_at": {
      "$date": "2024-10-24T19:03:21.817Z"
    },
    "_updated_at": {
      "$date": "2024-10-24T19:03:21.817Z"
    },
    "usedTimes": 0
  },
  {
    "_id": "ImMAHpYewZ",
    "options": [
      "Cerebrum",
      "Cerebellum",
      "Brainstem",
      "Hippocampus"
    ],
    "_p_quiz": "JF2YKhJdDh",
    "question": "Which part of the brain controls balance and coordination?",
    "correct_answer": "Cerebellum",
    "_created_at": {
      "$date": "2024-10-24T19:03:21.817Z"
    },
    "_updated_at": {
      "$date": "2024-10-24T19:03:21.817Z"
    },
    "usedTimes": 0
  },
  {
    "_id": "lbvdPxyTAw",
    "options": [
      "Ethane",
      "Propane",
      "Butane",
      "Methane"
    ],
    "_p_quiz": "JF2YKhJdDh",
    "question": "What is the main component of natural gas?",
    "correct_answer": "Methane",
    "_created_at": {
      "$date": "2024-10-24T19:03:21.817Z"
    },
    "_updated_at": {
      "$date": "2024-10-24T19:03:21.817Z"
    },
    "usedTimes": 0
  },
  {
    "_id": "caBzCmcSji",
    "options": [
      "Digest food",
      "Pump blood",
      "Exchange gases",
      "Transmit signals"
    ],
    "_p_quiz": "JF2YKhJdDh",
    "question": "What is the main function of the respiratory system?",
    "correct_answer": "Exchange gases",
    "_created_at": {
      "$date": "2024-10-24T19:03:21.817Z"
    },
    "_updated_at": {
      "$date": "2024-10-24T19:03:21.817Z"
    },
    "usedTimes": 0
  },
  {
    "_id": "dyv9AOAWCk",
    "options": [
      "Hydrogen",
      "Oxygen",
      "Helium",
      "Nitrogen"
    ],
    "_p_quiz": "JF2YKhJdDh",
    "question": "Which gas is commonly used in balloons to make them float?",
    "correct_answer": "Helium",
    "_created_at": {
      "$date": "2024-10-24T19:03:21.817Z"
    },
    "_updated_at": {
      "$date": "2024-10-24T19:03:21.817Z"
    },
    "usedTimes": 0
  },
  {
    "_id": "yOjUiPuEjH",
    "options": [
      "Infrared",
      "Ultraviolet",
      "Visible light",
      "Microwaves"
    ],
    "_p_quiz": "JF2YKhJdDh",
    "question": "Which part of the electromagnetic spectrum is visible to the human eye?",
    "correct_answer": "Visible light",
    "_created_at": {
      "$date": "2024-10-24T19:03:21.817Z"
    },
    "_updated_at": {
      "$date": "2024-10-24T19:03:21.817Z"
    },
    "usedTimes": 0
  },
  {
    "_id": "6fksiue3kx",
    "options": [
      "Photosynthesis",
      "Respiration",
      "Transpiration",
      "Osmosis"
    ],
    "_p_quiz": "JF2YKhJdDh",
    "question": "What is the process by which plants lose water vapor through their leaves?",
    "correct_answer": "Transpiration",
    "_created_at": {
      "$date": "2024-10-24T19:03:21.817Z"
    },
    "_updated_at": {
      "$date": "2024-10-24T19:03:21.817Z"
    },
    "usedTimes": 0
  },
  {
    "_id": "zdxzsCAKeT",
    "options": [
      "6",
      "12",
      "8",
      "14"
    ],
    "_p_quiz": "JF2YKhJdDh",
    "question": "What is the atomic number of carbon?",
    "correct_answer": "6",
    "_created_at": {
      "$date": "2024-10-24T19:03:21.817Z"
    },
    "_updated_at": {
      "$date": "2024-10-24T19:03:21.817Z"
    },
    "usedTimes": 0
  },
  {
    "_id": "RU4g7Hp8W5",
    "options": [
      "Stomach",
      "Pancreas",
      "Liver",
      "Gallbladder"
    ],
    "_p_quiz": "JF2YKhJdDh",
    "question": "Which organ in the human body produces bile?",
    "correct_answer": "Liver",
    "_created_at": {
      "$date": "2024-10-24T19:03:21.817Z"
    },
    "_updated_at": {
      "$date": "2024-10-24T19:03:21.817Z"
    },
    "usedTimes": 0
  },
  {
    "_id": "uMRA4ddR4E",
    "options": [
      "Geothermal energy",
      "Wind energy",
      "Solar energy",
      "Nuclear energy"
    ],
    "_p_quiz": "JF2YKhJdDh",
    "question": "What is the primary source of energy for life on Earth?",
    "correct_answer": "Solar energy",
    "_created_at": {
      "$date": "2024-10-24T19:03:21.817Z"
    },
    "_updated_at": {
      "$date": "2024-10-24T19:03:21.817Z"
    },
    "usedTimes": 0
  },
  {
    "_id": "t9cBG1P1Fg",
    "options": [
      "Evaporation",
      "Condensation",
      "Sublimation",
      "Freezing"
    ],
    "_p_quiz": "JF2YKhJdDh",
    "question": "What is the process by which water vapor turns into liquid water?",
    "correct_answer": "Condensation",
    "_created_at": {
      "$date": "2024-10-24T19:03:21.817Z"
    },
    "_updated_at": {
      "$date": "2024-10-24T19:03:21.817Z"
    },
    "usedTimes": 0
  },
  {
    "_id": "KWdztgJJYD",
    "options": [
      "Sedimentary",
      "Metamorphic",
      "Igneous",
      "Basaltic"
    ],
    "_p_quiz": "JF2YKhJdDh",
    "question": "Which type of rock is formed from existing rock that is changed by heat and pressure?",
    "correct_answer": "Metamorphic",
    "_created_at": {
      "$date": "2024-10-24T19:03:21.817Z"
    },
    "_updated_at": {
      "$date": "2024-10-24T19:03:21.817Z"
    },
    "usedTimes": 0
  },
  {
    "_id": "RMD2gS2KU3",
    "options": [
      "Producer",
      "Consumer",
      "Decomposer",
      "Herbivore"
    ],
    "_p_quiz": "JF2YKhJdDh",
    "question": "What type of organism breaks down dead material for energy?",
    "correct_answer": "Decomposer",
    "_created_at": {
      "$date": "2024-10-24T19:03:21.817Z"
    },
    "_updated_at": {
      "$date": "2024-10-24T19:03:21.817Z"
    },
    "usedTimes": 0
  },
  {
    "_id": "3s9PftFiU8",
    "options": [
      "Iron",
      "Calcium",
      "Potassium",
      "Sodium"
    ],
    "_p_quiz": "JF2YKhJdDh",
    "question": "What is the most abundant mineral in the human body?",
    "correct_answer": "Calcium",
    "_created_at": {
      "$date": "2024-10-24T19:03:21.817Z"
    },
    "_updated_at": {
      "$date": "2024-10-24T19:03:21.817Z"
    },
    "usedTimes": 0
  },
  {
    "_id": "e5JEv7NfPb",
    "options": [
      "Femur",
      "Humerus",
      "Tibia",
      "Fibula"
    ],
    "_p_quiz": "JF2YKhJdDh",
    "question": "What is the longest bone in the human body?",
    "correct_answer": "Femur",
    "_created_at": {
      "$date": "2024-10-24T19:03:21.817Z"
    },
    "_updated_at": {
      "$date": "2024-10-24T19:03:21.817Z"
    },
    "usedTimes": 0
  },
  {
    "_id": "KPYEHUtA2B",
    "options": [
      "Iron",
      "Iodine",
      "Calcium",
      "Phosphorus"
    ],
    "_p_quiz": "JF2YKhJdDh",
    "question": "Which element is essential for the production of thyroid hormones?",
    "correct_answer": "Iodine",
    "_created_at": {
      "$date": "2024-10-24T19:03:21.817Z"
    },
    "_updated_at": {
      "$date": "2024-10-24T19:03:21.817Z"
    },
    "usedTimes": 0
  },
  {
    "_id": "bYUKqp5MDM",
    "options": [
      "Photosynthesis",
      "Cellular respiration",
      "Fermentation",
      "Digestion"
    ],
    "_p_quiz": "JF2YKhJdDh",
    "question": "What is the process by which cells obtain energy from glucose?",
    "correct_answer": "Cellular respiration",
    "_created_at": {
      "$date": "2024-10-24T19:03:21.855Z"
    },
    "_updated_at": {
      "$date": "2024-10-24T19:03:21.855Z"
    },
    "usedTimes": 0
  },
  {
    "_id": "nRFUt0HSmr",
    "options": [
      "Geology",
      "Ecology",
      "Biology",
      "Astronomy"
    ],
    "_p_quiz": "JF2YKhJdDh",
    "question": "What is the term for the study of the relationships between living organisms and their environment?",
    "correct_answer": "Ecology",
    "_created_at": {
      "$date": "2024-10-24T19:03:21.855Z"
    },
    "_updated_at": {
      "$date": "2024-10-24T19:03:21.855Z"
    },
    "usedTimes": 0
  },
  {
    "_id": "zbiXuH5BvS",
    "options": [
      "Ionic bond",
      "Hydrogen bond",
      "Covalent bond",
      "Metallic bond"
    ],
    "_p_quiz": "JF2YKhJdDh",
    "question": "What type of bond involves the sharing of electron pairs between atoms?",
    "correct_answer": "Covalent bond",
    "_created_at": {
      "$date": "2024-10-24T19:03:21.855Z"
    },
    "_updated_at": {
      "$date": "2024-10-24T19:03:21.855Z"
    },
    "usedTimes": 0
  },
  {
    "_id": "WgwJkmhz6e",
    "options": [
      "Produce hormones",
      "Filter waste from the blood",
      "Digest food",
      "Store energy"
    ],
    "_p_quiz": "JF2YKhJdDh",
    "question": "What is the main function of the kidneys in the human body?",
    "correct_answer": "Filter waste from the blood",
    "_created_at": {
      "$date": "2024-10-24T19:03:21.855Z"
    },
    "_updated_at": {
      "$date": "2024-10-24T19:03:21.855Z"
    },
    "usedTimes": 0
  },
  {
    "_id": "ncI2YsIwTi",
    "options": [
      "Mars",
      "Jupiter",
      "Saturn",
      "Neptune"
    ],
    "_p_quiz": "JF2YKhJdDh",
    "question": "What is the name of the largest planet in our solar system?",
    "correct_answer": "Jupiter",
    "_created_at": {
      "$date": "2024-10-24T19:03:21.855Z"
    },
    "_updated_at": {
      "$date": "2024-10-24T19:03:21.855Z"
    },
    "usedTimes": 0
  },
  {
    "_id": "NWLQehTM0s",
    "options": [
      "Mercury",
      "Iron",
      "Aluminum",
      "Copper"
    ],
    "_p_quiz": "JF2YKhJdDh",
    "question": "Which element is liquid at room temperature?",
    "correct_answer": "Mercury",
    "_created_at": {
      "$date": "2024-10-24T19:03:21.856Z"
    },
    "_updated_at": {
      "$date": "2024-10-24T19:03:21.856Z"
    },
    "usedTimes": 0
  },
  {
    "_id": "86DQv5mHQL",
    "options": [
      "Igneous",
      "Metamorphic",
      "Sedimentary",
      "Basaltic"
    ],
    "_p_quiz": "JF2YKhJdDh",
    "question": "What type of rock is formed from the accumulation of sediment?",
    "correct_answer": "Sedimentary",
    "_created_at": {
      "$date": "2024-10-24T19:03:21.855Z"
    },
    "_updated_at": {
      "$date": "2024-10-24T19:03:21.855Z"
    },
    "usedTimes": 0
  },
  {
    "_id": "yPzQ6kDY1u",
    "options": [
      "Atom",
      "Molecule",
      "Ion",
      "Compound"
    ],
    "_p_quiz": "JF2YKhJdDh",
    "question": "What is the smallest particle of a chemical element that retains its chemical properties?",
    "correct_answer": "Atom",
    "_created_at": {
      "$date": "2024-10-24T19:03:21.855Z"
    },
    "_updated_at": {
      "$date": "2024-10-24T19:03:21.855Z"
    },
    "usedTimes": 0
  },
  {
    "_id": "qJrx7A4NHl",
    "options": [
      "Crust",
      "Mantle",
      "Outer Core",
      "Inner Core"
    ],
    "_p_quiz": "JF2YKhJdDh",
    "question": "Which layer of the Earth is composed primarily of solid iron and nickel?",
    "correct_answer": "Inner Core",
    "_created_at": {
      "$date": "2024-10-24T19:03:21.855Z"
    },
    "_updated_at": {
      "$date": "2024-10-24T19:03:21.855Z"
    },
    "usedTimes": 0
  },
  {
    "_id": "oNQob2pFYq",
    "options": [
      "Vitamin A",
      "Vitamin B12",
      "Vitamin C",
      "Vitamin D"
    ],
    "_p_quiz": "JF2YKhJdDh",
    "question": "Which vitamin is produced by the human body when exposed to sunlight?",
    "correct_answer": "Vitamin D",
    "_created_at": {
      "$date": "2024-10-24T19:03:21.855Z"
    },
    "_updated_at": {
      "$date": "2024-10-24T19:03:21.855Z"
    },
    "usedTimes": 0
  },
  {
    "_id": "DIrhWLj4LF",
    "options": [
      "X-rays",
      "Microwaves",
      "Radio waves",
      "Ultraviolet"
    ],
    "_p_quiz": "JF2YKhJdDh",
    "question": "Which type of electromagnetic radiation has the longest wavelength?",
    "correct_answer": "Radio waves",
    "_created_at": {
      "$date": "2024-10-24T19:03:21.855Z"
    },
    "_updated_at": {
      "$date": "2024-10-24T19:03:21.855Z"
    },
    "usedTimes": 0
  },
  {
    "_id": "cv74aItMhQ",
    "options": [
      "Stomach",
      "Pancreas",
      "Liver",
      "Intestine"
    ],
    "_p_quiz": "JF2YKhJdDh",
    "question": "Which organ is responsible for producing digestive enzymes in the human body?",
    "correct_answer": "Pancreas",
    "_created_at": {
      "$date": "2024-10-24T19:03:21.855Z"
    },
    "_updated_at": {
      "$date": "2024-10-24T19:03:21.855Z"
    },
    "usedTimes": 0
  },
  {
    "_id": "8ZvBzzjvB3",
    "options": [
      "Tissue",
      "Organ",
      "Cell",
      "System"
    ],
    "_p_quiz": "JF2YKhJdDh",
    "question": "What is the term for the basic structural and functional unit of all living organisms?",
    "correct_answer": "Cell",
    "_created_at": {
      "$date": "2024-10-24T19:03:21.856Z"
    },
    "_updated_at": {
      "$date": "2024-10-24T19:03:21.856Z"
    },
    "usedTimes": 0
  },
  {
    "_id": "vG0uMFDCiI",
    "options": [
      "S",
      "Na",
      "K",
      "Ca"
    ],
    "_p_quiz": "JF2YKhJdDh",
    "question": "What is the chemical symbol for sodium?",
    "correct_answer": "Na",
    "_created_at": {
      "$date": "2024-10-24T19:03:21.856Z"
    },
    "_updated_at": {
      "$date": "2024-10-24T19:03:21.856Z"
    },
    "usedTimes": 0
  },
  {
    "_id": "L1QauLT771",
    "options": [
      "Cerebrum",
      "Cerebellum",
      "Brainstem",
      "Hippocampus"
    ],
    "_p_quiz": "JF2YKhJdDh",
    "question": "Which part of the brain is responsible for regulating heart rate and breathing?",
    "correct_answer": "Brainstem",
    "_created_at": {
      "$date": "2024-10-24T19:03:21.856Z"
    },
    "_updated_at": {
      "$date": "2024-10-24T19:03:21.856Z"
    },
    "usedTimes": 0
  },
  {
    "_id": "K1Zpuvw52p",
    "options": [
      "Oxygen",
      "Nitrogen",
      "Carbon Dioxide",
      "Argon"
    ],
    "_p_quiz": "JF2YKhJdDh",
    "question": "Which gas makes up about 21% of Earth's atmosphere?",
    "correct_answer": "Oxygen",
    "_created_at": {
      "$date": "2024-10-24T19:03:21.855Z"
    },
    "_updated_at": {
      "$date": "2024-10-24T19:03:21.855Z"
    },
    "usedTimes": 0
  },
  {
    "_id": "9aiCaZhBej",
    "options": [
      "Proteins",
      "Lipids",
      "Carbohydrates",
      "Nucleic acids"
    ],
    "_p_quiz": "JF2YKhJdDh",
    "question": "What is the main component of the cell membrane?",
    "correct_answer": "Lipids",
    "_created_at": {
      "$date": "2024-10-24T19:03:21.855Z"
    },
    "_updated_at": {
      "$date": "2024-10-24T19:03:21.855Z"
    },
    "usedTimes": 0
  },
  {
    "_id": "9IPMz5kW58",
    "options": [
      "Catalyst",
      "Reactant",
      "Product",
      "Enzyme"
    ],
    "_p_quiz": "JF2YKhJdDh",
    "question": "What is the term for a substance that speeds up a chemical reaction without being consumed?",
    "correct_answer": "Catalyst",
    "_created_at": {
      "$date": "2024-10-24T19:03:21.855Z"
    },
    "_updated_at": {
      "$date": "2024-10-24T19:03:21.855Z"
    },
    "usedTimes": 0
  },
  {
    "_id": "eyIRYIVhRw",
    "options": [
      "Transport nutrients",
      "Remove waste",
      "Protect against disease",
      "Support body structure"
    ],
    "_p_quiz": "JF2YKhJdDh",
    "question": "What is the primary function of the excretory system?",
    "correct_answer": "Remove waste",
    "_created_at": {
      "$date": "2024-10-24T19:03:21.856Z"
    },
    "_updated_at": {
      "$date": "2024-10-24T19:03:21.856Z"
    },
    "usedTimes": 0
  },
  {
    "_id": "og7QhkEL0l",
    "options": [
      "Francium",
      "Astatine",
      "Technetium",
      "Promethium"
    ],
    "_p_quiz": "EdlvPGEeO9",
    "question": "What is the rarest naturally occurring element on Earth?",
    "correct_answer": "Astatine",
    "_created_at": {
      "$date": "2024-10-24T19:17:10.674Z"
    },
    "_updated_at": {
      "$date": "2024-10-24T19:17:10.674Z"
    },
    "usedTimes": 0
  },
  {
    "_id": "wyjH7uh6qT",
    "options": [
      "Tungsten",
      "Carbon",
      "Iron",
      "Osmium"
    ],
    "_p_quiz": "EdlvPGEeO9",
    "question": "Which element has the highest melting point?",
    "correct_answer": "Tungsten",
    "_created_at": {
      "$date": "2024-10-24T19:17:10.674Z"
    },
    "_updated_at": {
      "$date": "2024-10-24T19:17:10.674Z"
    },
    "usedTimes": 0
  },
  {
    "_id": "o49BQ6j9Hd",
    "options": [
      "Botany",
      "Mycology",
      "Virology",
      "Entomology"
    ],
    "_p_quiz": "EdlvPGEeO9",
    "question": "What is the term for the study of fungi?",
    "correct_answer": "Mycology",
    "_created_at": {
      "$date": "2024-10-24T19:17:10.674Z"
    },
    "_updated_at": {
      "$date": "2024-10-24T19:17:10.674Z"
    },
    "usedTimes": 0
  },
  {
    "_id": "TnV3XUWfA9",
    "options": [
      "Earth",
      "Mars",
      "Jupiter",
      "Saturn"
    ],
    "_p_quiz": "EdlvPGEeO9",
    "question": "Which planet has the most moons?",
    "correct_answer": "Saturn",
    "_created_at": {
      "$date": "2024-10-24T19:17:10.674Z"
    },
    "_updated_at": {
      "$date": "2024-10-24T19:17:10.674Z"
    },
    "usedTimes": 0
  },
  {
    "_id": "CKETvWBRfA",
    "options": [
      "Law of Energy Conservation",
      "Law of Entropy",
      "Law of Inertia",
      "Law of Gravitation"
    ],
    "_p_quiz": "EdlvPGEeO9",
    "question": "What is the second law of thermodynamics also known as?",
    "correct_answer": "Law of Entropy",
    "_created_at": {
      "$date": "2024-10-24T19:17:10.674Z"
    },
    "_updated_at": {
      "$date": "2024-10-24T19:17:10.674Z"
    },
    "usedTimes": 0
  },
  {
    "_id": "Vr9qHr5WJJ",
    "options": [
      "Vitamin A",
      "Vitamin B12",
      "Vitamin C",
      "Vitamin D"
    ],
    "_p_quiz": "EdlvPGEeO9",
    "question": "Which vitamin is synthesized in the human body upon exposure to sunlight?",
    "correct_answer": "Vitamin D",
    "_created_at": {
      "$date": "2024-10-24T19:17:10.674Z"
    },
    "_updated_at": {
      "$date": "2024-10-24T19:17:10.674Z"
    },
    "usedTimes": 0
  },
  {
    "_id": "bki6PbLrRC",
    "options": [
      "Isaac Newton",
      "Albert Einstein",
      "Niels Bohr",
      "Max Planck"
    ],
    "_p_quiz": "EdlvPGEeO9",
    "question": "Which scientist is known for his work on the photoelectric effect?",
    "correct_answer": "Albert Einstein",
    "_created_at": {
      "$date": "2024-10-24T19:17:10.674Z"
    },
    "_updated_at": {
      "$date": "2024-10-24T19:17:10.674Z"
    },
    "usedTimes": 0
  },
  {
    "_id": "L6fvs9D2yJ",
    "options": [
      "Hydrogen",
      "Helium",
      "Carbon",
      "Oxygen"
    ],
    "_p_quiz": "EdlvPGEeO9",
    "question": "What is the main component of the sun's atmosphere?",
    "correct_answer": "Hydrogen",
    "_created_at": {
      "$date": "2024-10-24T19:17:10.674Z"
    },
    "_updated_at": {
      "$date": "2024-10-24T19:17:10.674Z"
    },
    "usedTimes": 0
  },
  {
    "_id": "YmrgBw0zhn",
    "options": [
      "Fault",
      "Ridge",
      "Trench",
      "Plate boundary"
    ],
    "_p_quiz": "EdlvPGEeO9",
    "question": "What is the term for the boundary between two tectonic plates?",
    "correct_answer": "Plate boundary",
    "_created_at": {
      "$date": "2024-10-24T19:17:10.674Z"
    },
    "_updated_at": {
      "$date": "2024-10-24T19:17:10.674Z"
    },
    "usedTimes": 0
  },
  {
    "_id": "35Um5Eye9f",
    "options": [
      "Ionic bond",
      "Covalent bond",
      "Hydrogen bond",
      "Metallic bond"
    ],
    "_p_quiz": "EdlvPGEeO9",
    "question": "What type of bond is formed by the sharing of electron pairs between atoms?",
    "correct_answer": "Covalent bond",
    "_created_at": {
      "$date": "2024-10-24T19:17:10.674Z"
    },
    "_updated_at": {
      "$date": "2024-10-24T19:17:10.674Z"
    },
    "usedTimes": 0
  },
  {
    "_id": "ZYokdXIjyf",
    "options": [
      "Ceres",
      "Eris",
      "Pluto",
      "Haumea"
    ],
    "_p_quiz": "EdlvPGEeO9",
    "question": "What is the name of the largest dwarf planet in the solar system?",
    "correct_answer": "Eris",
    "_created_at": {
      "$date": "2024-10-24T19:17:10.674Z"
    },
    "_updated_at": {
      "$date": "2024-10-24T19:17:10.674Z"
    },
    "usedTimes": 0
  },
  {
    "_id": "wsTtxY5Tbm",
    "options": [
      "Ampere",
      "Volt",
      "Ohm",
      "Watt"
    ],
    "_p_quiz": "EdlvPGEeO9",
    "question": "What is the SI unit of electrical resistance?",
    "correct_answer": "Ohm",
    "_created_at": {
      "$date": "2024-10-24T19:17:10.674Z"
    },
    "_updated_at": {
      "$date": "2024-10-24T19:17:10.674Z"
    },
    "usedTimes": 0
  },
  {
    "_id": "Y4nY8yLtrj",
    "options": [
      "Curium",
      "Einsteinium",
      "Nobelium",
      "Fermium"
    ],
    "_p_quiz": "EdlvPGEeO9",
    "question": "Which chemical element is named after the inventor of dynamite?",
    "correct_answer": "Nobelium",
    "_created_at": {
      "$date": "2024-10-24T19:17:10.674Z"
    },
    "_updated_at": {
      "$date": "2024-10-24T19:17:10.674Z"
    },
    "usedTimes": 0
  },
  {
    "_id": "kosYjWDjVP",
    "options": [
      "Oxygen",
      "Hydrogen",
      "Helium",
      "Carbon"
    ],
    "_p_quiz": "EdlvPGEeO9",
    "question": "What is the most abundant element in the universe?",
    "correct_answer": "Hydrogen",
    "_created_at": {
      "$date": "2024-10-24T19:17:10.674Z"
    },
    "_updated_at": {
      "$date": "2024-10-24T19:17:10.674Z"
    },
    "usedTimes": 0
  },
  {
    "_id": "YTNla7bRql",
    "options": [
      "Reaction rate",
      "Catalysis",
      "Equilibrium",
      "Activation energy"
    ],
    "_p_quiz": "EdlvPGEeO9",
    "question": "What is the term for the speed at which a chemical reaction occurs?",
    "correct_answer": "Reaction rate",
    "_created_at": {
      "$date": "2024-10-24T19:17:10.674Z"
    },
    "_updated_at": {
      "$date": "2024-10-24T19:17:10.674Z"
    },
    "usedTimes": 0
  },
  {
    "_id": "aHB4VgGo7v",
    "options": [
      "Digest proteins",
      "Absorb nutrients",
      "Absorb water",
      "Produce bile"
    ],
    "_p_quiz": "EdlvPGEeO9",
    "question": "What is the primary function of the large intestine in the human body?",
    "correct_answer": "Absorb water",
    "_created_at": {
      "$date": "2024-10-24T19:17:10.674Z"
    },
    "_updated_at": {
      "$date": "2024-10-24T19:17:10.674Z"
    },
    "usedTimes": 0
  },
  {
    "_id": "dCdDhmGMl9",
    "options": [
      "Wind",
      "Earth's rotation",
      "Sun's gravity",
      "Moon's gravity"
    ],
    "_p_quiz": "EdlvPGEeO9",
    "question": "What is the primary cause of ocean tides?",
    "correct_answer": "Moon's gravity",
    "_created_at": {
      "$date": "2024-10-24T19:17:10.674Z"
    },
    "_updated_at": {
      "$date": "2024-10-24T19:17:10.674Z"
    },
    "usedTimes": 0
  },
  {
    "_id": "0M00rGd0t4",
    "options": [
      "Graphite",
      "Corundum",
      "Diamond",
      "Topaz"
    ],
    "_p_quiz": "EdlvPGEeO9",
    "question": "What is the hardest natural substance on Earth?",
    "correct_answer": "Diamond",
    "_created_at": {
      "$date": "2024-10-24T19:17:10.674Z"
    },
    "_updated_at": {
      "$date": "2024-10-24T19:17:10.674Z"
    },
    "usedTimes": 0
  },
  {
    "_id": "o0VxOVwcpx",
    "options": [
      "Thermometer",
      "Barometer",
      "Anemometer",
      "Hygrometer"
    ],
    "_p_quiz": "EdlvPGEeO9",
    "question": "Which instrument is used to measure atmospheric pressure?",
    "correct_answer": "Barometer",
    "_created_at": {
      "$date": "2024-10-24T19:17:10.674Z"
    },
    "_updated_at": {
      "$date": "2024-10-24T19:17:10.674Z"
    },
    "usedTimes": 0
  },
  {
    "_id": "CwUVxtkGtD",
    "options": [
      "Mars",
      "Jupiter",
      "Saturn",
      "Uranus"
    ],
    "_p_quiz": "EdlvPGEeO9",
    "question": "Which planet has the Great Red Spot?",
    "correct_answer": "Jupiter",
    "_created_at": {
      "$date": "2024-10-24T19:17:10.674Z"
    },
    "_updated_at": {
      "$date": "2024-10-24T19:17:10.674Z"
    },
    "usedTimes": 0
  },
  {
    "_id": "sohv8ElQWb",
    "options": [
      "Iron",
      "Aluminum",
      "Copper",
      "Zinc"
    ],
    "_p_quiz": "EdlvPGEeO9",
    "question": "What is the most abundant metal in the Earth's crust?",
    "correct_answer": "Aluminum",
    "_created_at": {
      "$date": "2024-10-24T19:17:10.722Z"
    },
    "_updated_at": {
      "$date": "2024-10-24T19:17:10.722Z"
    },
    "usedTimes": 0
  },
  {
    "_id": "dfzlt4ZV9i",
    "options": [
      "Oxygen",
      "Nitrogen",
      "Carbon Dioxide",
      "Hydrogen"
    ],
    "_p_quiz": "EdlvPGEeO9",
    "question": "What is the main gas found in the bubbles of soda?",
    "correct_answer": "Carbon Dioxide",
    "_created_at": {
      "$date": "2024-10-24T19:17:10.721Z"
    },
    "_updated_at": {
      "$date": "2024-10-24T19:17:10.721Z"
    },
    "usedTimes": 0
  },
  {
    "_id": "zwH8AH4AlA",
    "options": [
      "A",
      "B",
      "AB-",
      "O-"
    ],
    "_p_quiz": "EdlvPGEeO9",
    "question": "What is the rarest blood type in the world?",
    "correct_answer": "AB-",
    "_created_at": {
      "$date": "2024-10-24T19:17:10.722Z"
    },
    "_updated_at": {
      "$date": "2024-10-24T19:17:10.722Z"
    },
    "usedTimes": 0
  },
  {
    "_id": "f6xzoEUMg7",
    "options": [
      "Ultraviolet",
      "Visible light",
      "X-rays",
      "Gamma rays"
    ],
    "_p_quiz": "EdlvPGEeO9",
    "question": "Which type of electromagnetic radiation has the highest energy?",
    "correct_answer": "Gamma rays",
    "_created_at": {
      "$date": "2024-10-24T19:17:10.721Z"
    },
    "_updated_at": {
      "$date": "2024-10-24T19:17:10.721Z"
    },
    "usedTimes": 0
  },
  {
    "_id": "EMVuhv77Yn",
    "options": [
      "Kidneys",
      "Liver",
      "Pancreas",
      "Lungs"
    ],
    "_p_quiz": "EdlvPGEeO9",
    "question": "Which organ in the human body is primarily responsible for detoxification?",
    "correct_answer": "Liver",
    "_created_at": {
      "$date": "2024-10-24T19:17:10.722Z"
    },
    "_updated_at": {
      "$date": "2024-10-24T19:17:10.722Z"
    },
    "usedTimes": 0
  },
  {
    "_id": "J0yqwpSGre",
    "options": [
      "Butane",
      "Propane",
      "Ethane",
      "Methane"
    ],
    "_p_quiz": "EdlvPGEeO9",
    "question": "What is the main component of natural gas?",
    "correct_answer": "Methane",
    "_created_at": {
      "$date": "2024-10-24T19:17:10.721Z"
    },
    "_updated_at": {
      "$date": "2024-10-24T19:17:10.721Z"
    },
    "usedTimes": 0
  },
  {
    "_id": "yVNnQ3KADF",
    "options": [
      "Photosynthesis",
      "Glycolysis",
      "Fermentation",
      "Cellular respiration"
    ],
    "_p_quiz": "EdlvPGEeO9",
    "question": "Which process is used by plants to release energy from glucose?",
    "correct_answer": "Cellular respiration",
    "_created_at": {
      "$date": "2024-10-24T19:17:10.722Z"
    },
    "_updated_at": {
      "$date": "2024-10-24T19:17:10.722Z"
    },
    "usedTimes": 0
  },
  {
    "_id": "UbPWvH6Lm0",
    "options": [
      "Absorb carbon dioxide",
      "Store energy",
      "Absorb sunlight",
      "Transport water"
    ],
    "_p_quiz": "EdlvPGEeO9",
    "question": "What is the main function of chlorophyll in plants?",
    "correct_answer": "Absorb sunlight",
    "_created_at": {
      "$date": "2024-10-24T19:17:10.722Z"
    },
    "_updated_at": {
      "$date": "2024-10-24T19:17:10.722Z"
    },
    "usedTimes": 0
  },
  {
    "_id": "22p5uxRL9q",
    "options": [
      "Nucleus",
      "Mitochondria",
      "Ribosome",
      "Endoplasmic reticulum"
    ],
    "_p_quiz": "EdlvPGEeO9",
    "question": "Which part of the cell is responsible for producing energy?",
    "correct_answer": "Mitochondria",
    "_created_at": {
      "$date": "2024-10-24T19:17:10.722Z"
    },
    "_updated_at": {
      "$date": "2024-10-24T19:17:10.722Z"
    },
    "usedTimes": 0
  },
  {
    "_id": "2Amy7ZyqiF",
    "options": [
      "Catalyst",
      "Reactant",
      "Product",
      "Enzyme"
    ],
    "_p_quiz": "EdlvPGEeO9",
    "question": "What is the term for a substance that speeds up a chemical reaction without being consumed?",
    "correct_answer": "Catalyst",
    "_created_at": {
      "$date": "2024-10-24T19:17:10.722Z"
    },
    "_updated_at": {
      "$date": "2024-10-24T19:17:10.722Z"
    },
    "usedTimes": 0
  },
  {
    "_id": "U90u9B4WNi",
    "options": [
      "Hydrogen",
      "Oxygen",
      "Carbon",
      "Nitrogen"
    ],
    "_p_quiz": "EdlvPGEeO9",
    "question": "Which element is used as a standard for atomic masses?",
    "correct_answer": "Carbon",
    "_created_at": {
      "$date": "2024-10-24T19:17:10.722Z"
    },
    "_updated_at": {
      "$date": "2024-10-24T19:17:10.722Z"
    },
    "usedTimes": 0
  },
  {
    "_id": "wVHRPgDFI7",
    "options": [
      "Mars",
      "Venus",
      "Jupiter",
      "Saturn"
    ],
    "_p_quiz": "EdlvPGEeO9",
    "question": "Which planet is known as the 'Morning Star' or 'Evening Star'?",
    "correct_answer": "Venus",
    "_created_at": {
      "$date": "2024-10-24T19:17:10.722Z"
    },
    "_updated_at": {
      "$date": "2024-10-24T19:17:10.722Z"
    },
    "usedTimes": 0
  },
  {
    "_id": "Xz1nUJ0Bbt",
    "options": [
      "Vitamin A",
      "Vitamin C",
      "Vitamin D",
      "Vitamin K"
    ],
    "_p_quiz": "EdlvPGEeO9",
    "question": "Which vitamin is essential for blood clotting?",
    "correct_answer": "Vitamin K",
    "_created_at": {
      "$date": "2024-10-24T19:17:10.722Z"
    },
    "_updated_at": {
      "$date": "2024-10-24T19:17:10.722Z"
    },
    "usedTimes": 0
  },
  {
    "_id": "5E2Gdka8DH",
    "options": [
      "Fight infections",
      "Clot blood",
      "Transport oxygen",
      "Carry nutrients"
    ],
    "_p_quiz": "EdlvPGEeO9",
    "question": "What is the main function of hemoglobin in the blood?",
    "correct_answer": "Transport oxygen",
    "_created_at": {
      "$date": "2024-10-24T19:17:10.722Z"
    },
    "_updated_at": {
      "$date": "2024-10-24T19:17:10.722Z"
    },
    "usedTimes": 0
  },
  {
    "_id": "dCXChqfl6E",
    "options": [
      "Nucleus",
      "Mitochondria",
      "Ribosome",
      "Lysosome"
    ],
    "_p_quiz": "EdlvPGEeO9",
    "question": "Which part of the cell is responsible for breaking down waste?",
    "correct_answer": "Lysosome",
    "_created_at": {
      "$date": "2024-10-24T19:17:10.721Z"
    },
    "_updated_at": {
      "$date": "2024-10-24T19:17:10.721Z"
    },
    "usedTimes": 0
  },
  {
    "_id": "AMhFAL65r2",
    "options": [
      "Oxygen",
      "Nitrogen",
      "Carbon Dioxide",
      "Hydrogen"
    ],
    "_p_quiz": "EdlvPGEeO9",
    "question": "Which gas is used in the process of photosynthesis?",
    "correct_answer": "Carbon Dioxide",
    "_created_at": {
      "$date": "2024-10-24T19:17:10.722Z"
    },
    "_updated_at": {
      "$date": "2024-10-24T19:17:10.722Z"
    },
    "usedTimes": 0
  },
  {
    "_id": "mmgWoxgUNP",
    "options": [
      "Nucleus",
      "Ribosome",
      "Mitochondria",
      "Golgi apparatus"
    ],
    "_p_quiz": "EdlvPGEeO9",
    "question": "Which organelle is known as the 'protein factory' of the cell?",
    "correct_answer": "Ribosome",
    "_created_at": {
      "$date": "2024-10-24T19:17:10.722Z"
    },
    "_updated_at": {
      "$date": "2024-10-24T19:17:10.722Z"
    },
    "usedTimes": 0
  },
  {
    "_id": "zWzmj5UXLB",
    "options": [
      "Periods",
      "Groups",
      "Rows",
      "Blocks"
    ],
    "_p_quiz": "EdlvPGEeO9",
    "question": "What is the term for the vertical columns in the periodic table?",
    "correct_answer": "Groups",
    "_created_at": {
      "$date": "2024-10-24T19:17:10.722Z"
    },
    "_updated_at": {
      "$date": "2024-10-24T19:17:10.722Z"
    },
    "usedTimes": 0
  },
  {
    "_id": "lzBAcPrEfl",
    "options": [
      "Mars",
      "Mercury",
      "Venus",
      "Pluto"
    ],
    "_p_quiz": "EdlvPGEeO9",
    "question": "What is the smallest planet in our solar system?",
    "correct_answer": "Mercury",
    "_created_at": {
      "$date": "2024-10-24T19:17:10.722Z"
    },
    "_updated_at": {
      "$date": "2024-10-24T19:17:10.722Z"
    },
    "usedTimes": 0
  },
  {
    "_id": "bNcP3JjFAo",
    "options": [
      "Volume",
      "Density",
      "Mass",
      "Weight"
    ],
    "_p_quiz": "EdlvPGEeO9",
    "question": "What is the term for the amount of matter in an object?",
    "correct_answer": "Mass",
    "_created_at": {
      "$date": "2024-10-24T19:17:10.722Z"
    },
    "_updated_at": {
      "$date": "2024-10-24T19:17:10.722Z"
    },
    "usedTimes": 0
  },
  {
    "_id": "cpRjxLAtni",
    "options": [
      "NH3",
      "H2O",
      "CO2",
      "CH4"
    ],
    "_p_quiz": "EdlvPGEeO9",
    "question": "What is the chemical formula for ammonia?",
    "correct_answer": "NH3",
    "_created_at": {
      "$date": "2024-10-24T19:17:10.757Z"
    },
    "_updated_at": {
      "$date": "2024-10-24T19:17:10.757Z"
    },
    "usedTimes": 0
  },
  {
    "_id": "aWmQ5taLGm",
    "options": [
      "Compound",
      "Mixture",
      "Element",
      "Solution"
    ],
    "_p_quiz": "EdlvPGEeO9",
    "question": "What is the term for a substance that cannot be broken down into simpler substances?",
    "correct_answer": "Element",
    "_created_at": {
      "$date": "2024-10-24T19:17:10.758Z"
    },
    "_updated_at": {
      "$date": "2024-10-24T19:17:10.758Z"
    },
    "usedTimes": 0
  },
  {
    "_id": "hcafA3HjUb",
    "options": [
      "Muscles",
      "Ligaments",
      "Cartilage",
      "Bones"
    ],
    "_p_quiz": "EdlvPGEeO9",
    "question": "What is the main component of the human skeletal system?",
    "correct_answer": "Bones",
    "_created_at": {
      "$date": "2024-10-24T19:17:10.758Z"
    },
    "_updated_at": {
      "$date": "2024-10-27T15:14:42.656Z"
    },
    "usedTimes": 0
  },
  {
    "_id": "CijOB3mma3",
    "options": [
      "Entomology",
      "Herpetology",
      "Ornithology",
      "Ichthyology"
    ],
    "_p_quiz": "EdlvPGEeO9",
    "question": "What is the term for the study of insects?",
    "correct_answer": "Entomology",
    "_created_at": {
      "$date": "2024-10-24T19:17:10.758Z"
    },
    "_updated_at": {
      "$date": "2024-10-27T15:14:46.713Z"
    },
    "usedTimes": 0
  },
  {
    "_id": "hAIOi4yOa2",
    "options": [
      "Oxygen",
      "Nitrogen",
      "Carbon Dioxide",
      "Hydrogen"
    ],
    "_p_quiz": "EdlvPGEeO9",
    "question": "Which gas is produced by the combustion of fossil fuels?",
    "correct_answer": "Carbon Dioxide",
    "_created_at": {
      "$date": "2024-10-24T19:17:10.758Z"
    },
    "_updated_at": {
      "$date": "2024-10-27T15:14:48.019Z"
    },
    "usedTimes": 0
  },
  {
    "_id": "1FlcnZLb91",
    "options": [
      "Synthesis",
      "Decomposition",
      "Single replacement",
      "Double replacement"
    ],
    "_p_quiz": "EdlvPGEeO9",
    "question": "Which type of chemical reaction involves the exchange of ions between two compounds?",
    "correct_answer": "Double replacement",
    "_created_at": {
      "$date": "2024-10-24T19:17:10.757Z"
    },
    "_updated_at": {
      "$date": "2024-10-24T19:17:10.757Z"
    },
    "usedTimes": 0
  },
  {
    "_id": "iCTKdNWlpm",
    "options": [
      "Pb",
      "Fe",
      "Au",
      "Ag"
    ],
    "_p_quiz": "EdlvPGEeO9",
    "question": "What is the chemical symbol for lead?",
    "correct_answer": "Pb",
    "_created_at": {
      "$date": "2024-10-24T19:17:10.758Z"
    },
    "_updated_at": {
      "$date": "2024-10-27T15:14:44.706Z"
    },
    "usedTimes": 0
  },
  {
    "_id": "9aML8EUKDy",
    "options": [
      "Transport oxygen",
      "Fight infections",
      "Digest food",
      "Store energy"
    ],
    "_p_quiz": "EdlvPGEeO9",
    "question": "What is the main function of the lymphatic system?",
    "correct_answer": "Fight infections",
    "_created_at": {
      "$date": "2024-10-24T19:17:10.757Z"
    },
    "_updated_at": {
      "$date": "2024-10-24T19:17:10.757Z"
    },
    "usedTimes": 0
  },
  {
    "_id": "ozvDztqGaQ",
    "options": [
      "Carbon-12",
      "Carbon-13",
      "Carbon-14",
      "Carbon-11"
    ],
    "_p_quiz": "EdlvPGEeO9",
    "question": "What is the most common isotope of carbon?",
    "correct_answer": "Carbon-12",
    "_created_at": {
      "$date": "2024-10-24T19:17:10.757Z"
    },
    "_updated_at": {
      "$date": "2024-10-24T19:17:10.757Z"
    },
    "usedTimes": 0
  },
  {
    "_id": "kn3CebH8ua",
    "options": [
      "H2SO4",
      "HCl",
      "HNO3",
      "H2CO3"
    ],
    "_p_quiz": "EdlvPGEeO9",
    "question": "What is the chemical formula for sulfuric acid?",
    "correct_answer": "H2SO4",
    "_created_at": {
      "$date": "2024-10-24T19:17:10.758Z"
    },
    "_updated_at": {
      "$date": "2024-10-27T15:14:43.065Z"
    },
    "usedTimes": 0
  },
  {
    "_id": "moEBcHukEm",
    "options": [
      "Cerebrum",
      "Cerebellum",
      "Brainstem",
      "Hypothalamus"
    ],
    "_p_quiz": "EdlvPGEeO9",
    "question": "Which part of the brain controls voluntary movements?",
    "correct_answer": "Cerebrum",
    "_created_at": {
      "$date": "2024-10-24T19:17:10.757Z"
    },
    "_updated_at": {
      "$date": "2024-10-24T19:17:10.757Z"
    },
    "usedTimes": 0
  },
  {
    "_id": "pxgjYgGXqH",
    "options": [
      "Mars",
      "Jupiter",
      "Saturn",
      "Neptune"
    ],
    "_p_quiz": "EdlvPGEeO9",
    "question": "Which planet is known for its prominent rings?",
    "correct_answer": "Saturn",
    "_created_at": {
      "$date": "2024-10-24T19:17:10.758Z"
    },
    "_updated_at": {
      "$date": "2024-10-27T15:14:45.078Z"
    },
    "usedTimes": 0
  },
  {
    "_id": "MZRa19rEMB",
    "options": [
      "Cation",
      "Anion",
      "Proton",
      "Electron"
    ],
    "_p_quiz": "EdlvPGEeO9",
    "question": "What is the term for a positively charged ion?",
    "correct_answer": "Cation",
    "_created_at": {
      "$date": "2024-10-24T19:17:10.757Z"
    },
    "_updated_at": {
      "$date": "2024-10-24T19:17:10.757Z"
    },
    "usedTimes": 0
  },
  {
    "_id": "S6v2y8XakW",
    "options": [
      "Oxygen",
      "Silicon",
      "Aluminum",
      "Iron"
    ],
    "_p_quiz": "EdlvPGEeO9",
    "question": "What is the most abundant element in the Earth's crust?",
    "correct_answer": "Oxygen",
    "_created_at": {
      "$date": "2024-10-24T19:17:10.758Z"
    },
    "_updated_at": {
      "$date": "2024-10-27T15:14:47.127Z"
    },
    "usedTimes": 0
  },
  {
    "_id": "0pkDzQZK3n",
    "options": [
      "Nucleus",
      "Mitochondria",
      "Ribosome",
      "Golgi apparatus"
    ],
    "_p_quiz": "EdlvPGEeO9",
    "question": "Which part of the cell acts as the 'control center' and contains DNA?",
    "correct_answer": "Nucleus",
    "_created_at": {
      "$date": "2024-10-24T19:17:10.758Z"
    },
    "_updated_at": {
      "$date": "2024-10-27T15:14:47.560Z"
    },
    "usedTimes": 0
  },
  {
    "_id": "kV8ja4hAqL",
    "options": [
      "Genotype",
      "Phenotype",
      "Allele",
      "Gene pool"
    ],
    "_p_quiz": "EdlvPGEeO9",
    "question": "What is the term for an organism's observable traits or characteristics?",
    "correct_answer": "Phenotype",
    "_created_at": {
      "$date": "2024-10-24T19:17:10.758Z"
    },
    "_updated_at": {
      "$date": "2024-10-24T19:17:10.758Z"
    },
    "usedTimes": 0
  },
  {
    "_id": "bzwy6WXuQL",
    "options": [
      "Covalent bond",
      "Ionic bond",
      "Hydrogen bond",
      "Metallic bond"
    ],
    "_p_quiz": "EdlvPGEeO9",
    "question": "Which type of bond involves the transfer of electrons between atoms?",
    "correct_answer": "Ionic bond",
    "_created_at": {
      "$date": "2024-10-24T19:17:10.758Z"
    },
    "_updated_at": {
      "$date": "2024-10-27T15:14:43.460Z"
    },
    "usedTimes": 0
  },
  {
    "_id": "P4prBHVtYZ",
    "options": [
      "Transport oxygen",
      "Fight infections",
      "Clot blood",
      "Carry nutrients"
    ],
    "_p_quiz": "EdlvPGEeO9",
    "question": "What is the primary function of red blood cells?",
    "correct_answer": "Transport oxygen",
    "_created_at": {
      "$date": "2024-10-24T19:17:10.758Z"
    },
    "_updated_at": {
      "$date": "2024-10-27T15:14:45.475Z"
    },
    "usedTimes": 0
  },
  {
    "_id": "RyMSBSQicq",
    "options": [
      "Liver",
      "Pancreas",
      "Kidneys",
      "Thyroid"
    ],
    "_p_quiz": "EdlvPGEeO9",
    "question": "Which organ in the human body is responsible for producing insulin?",
    "correct_answer": "Pancreas",
    "_created_at": {
      "$date": "2024-10-24T19:17:10.758Z"
    },
    "_updated_at": {
      "$date": "2024-10-27T15:14:45.913Z"
    },
    "usedTimes": 0
  },
  {
    "_id": "Hn3pu8Pqm1",
    "options": [
      "Geothermal energy",
      "Wind energy",
      "Solar energy",
      "Nuclear energy"
    ],
    "_p_quiz": "EdlvPGEeO9",
    "question": "What is the primary source of energy for Earth's climate system?",
    "correct_answer": "Solar energy",
    "_created_at": {
      "$date": "2024-10-24T19:17:10.758Z"
    },
    "_updated_at": {
      "$date": "2024-10-27T15:14:46.291Z"
    },
    "usedTimes": 0
  },
  {
    "_id": "MIyN2Eeq6U",
    "options": [
      "Vitamin A",
      "Vitamin B12",
      "Vitamin C",
      "Vitamin D"
    ],
    "_p_quiz": "EdlvPGEeO9",
    "question": "Which vitamin is essential for the absorption of calcium?",
    "correct_answer": "Vitamin D",
    "_created_at": {
      "$date": "2024-10-24T19:17:10.787Z"
    },
    "_updated_at": {
      "$date": "2024-10-27T15:14:41.567Z"
    },
    "usedTimes": 0
  },
  {
    "_id": "KXUfRHLXpI",
    "options": [
      "C6H12O6",
      "C2H5OH",
      "CH4",
      "C12H22O11"
    ],
    "_p_quiz": "EdlvPGEeO9",
    "question": "What is the chemical formula for glucose?",
    "correct_answer": "C6H12O6",
    "_created_at": {
      "$date": "2024-10-24T19:17:10.787Z"
    },
    "_updated_at": {
      "$date": "2024-10-27T15:14:42.248Z"
    },
    "usedTimes": 0
  },
  {
    "_id": "HSz2h0cSv1",
    "options": [
      "Geology",
      "Ecology",
      "Biology",
      "Astronomy"
    ],
    "_p_quiz": "EdlvPGEeO9",
    "question": "What is the term for the study of the interactions between organisms and their environment?",
    "correct_answer": "Ecology",
    "_created_at": {
      "$date": "2024-10-24T19:17:10.787Z"
    },
    "_updated_at": {
      "$date": "2024-10-27T15:14:41.145Z"
    },
    "usedTimes": 0
  },
  {
    "_id": "BfFmbMNMLJ",
    "options": [
      "Geology",
      "Astronomy",
      "Ecology",
      "Biology"
    ],
    "_p_quiz": "EdlvPGEeO9",
    "question": "What is the term for the study of the universe beyond Earth's atmosphere?",
    "correct_answer": "Astronomy",
    "_created_at": {
      "$date": "2024-10-24T19:17:10.788Z"
    },
    "_updated_at": {
      "$date": "2024-10-24T19:17:10.788Z"
    },
    "usedTimes": 0
  },
  {
    "_id": "gsbXUmjonU",
    "options": [
      "Carbon",
      "Silicon",
      "Boron",
      "Nitrogen"
    ],
    "_p_quiz": "EdlvPGEeO9",
    "question": "Which element is the primary component of diamonds?",
    "correct_answer": "Carbon",
    "_created_at": {
      "$date": "2024-10-24T19:17:10.788Z"
    },
    "_updated_at": {
      "$date": "2024-10-27T15:14:40.668Z"
    },
    "usedTimes": 0
  },
  {
    "_id": "K2CnEe3s95",
    "options": [
      "Cerebrum",
      "Cerebellum",
      "Amygdala",
      "Hippocampus"
    ],
    "_p_quiz": "EdlvPGEeO9",
    "question": "Which part of the brain is responsible for regulating emotions?",
    "correct_answer": "Amygdala",
    "_created_at": {
      "$date": "2024-10-24T19:17:10.788Z"
    },
    "_updated_at": {
      "$date": "2024-10-27T15:14:40.132Z"
    },
    "usedTimes": 0
  },
  {
    "_id": "TJ4FRblOkm",
    "options": [
      "Mass",
      "Weight",
      "Volume",
      "Density"
    ],
    "_p_quiz": "EdlvPGEeO9",
    "question": "What is the term for the amount of space an object occupies?",
    "correct_answer": "Volume",
    "_created_at": {
      "$date": "2024-10-24T19:17:10.788Z"
    },
    "_updated_at": {
      "$date": "2024-10-27T15:14:40.118Z"
    },
    "usedTimes": 0
  },
  {
    "_id": "mOtthTq8T6",
    "options": [
      "Iron",
      "Nickel",
      "Silicon",
      "Magnesium"
    ],
    "_p_quiz": "EdlvPGEeO9",
    "question": "What is the primary component of the Earth's core?",
    "correct_answer": "Iron",
    "_created_at": {
      "$date": "2024-10-24T19:17:10.788Z"
    },
    "_updated_at": {
      "$date": "2024-10-24T19:17:10.788Z"
    },
    "usedTimes": 0
  },
  {
    "_id": "2FHLfHGOLT",
    "options": [
      "Neutral",
      "Basic",
      "Acidic",
      "Alkaline"
    ],
    "_p_quiz": "EdlvPGEeO9",
    "question": "What is the term for a solution with a pH less than 7?",
    "correct_answer": "Acidic",
    "_created_at": {
      "$date": "2024-10-24T19:17:10.788Z"
    },
    "_updated_at": {
      "$date": "2024-10-24T19:17:10.788Z"
    },
    "usedTimes": 0
  },
  {
    "_id": "5CCbzbvwLx",
    "options": [
      "Isaac Newton",
      "Albert Einstein",
      "Galileo Galilei",
      "Niels Bohr"
    ],
    "_p_quiz": "EdlvPGEeO9",
    "question": "Which scientist is known for the theory of relativity?",
    "correct_answer": "Albert Einstein",
    "_created_at": {
      "$date": "2024-10-24T19:17:10.788Z"
    },
    "_updated_at": {
      "$date": "2024-10-27T15:14:40.108Z"
    },
    "usedTimes": 0
  },
  {
    "_id": "vIK18XRDTv",
    "options": [
      "Mitochondria",
      "Chloroplast",
      "Nucleus",
      "Ribosome"
    ],
    "_p_quiz": "EdlvPGEeO9",
    "question": "Which organelle is responsible for photosynthesis in plant cells?",
    "correct_answer": "Chloroplast",
    "_created_at": {
      "$date": "2024-10-24T19:17:10.788Z"
    },
    "_updated_at": {
      "$date": "2024-10-27T15:14:33.492Z"
    },
    "usedTimes": 0
  },
  {
    "_id": "HJKIO5ajxP",
    "options": [
      "Earth",
      "Mars",
      "Venus",
      "Jupiter"
    ],
    "_p_quiz": "EdlvPGEeO9",
    "question": "Which planet has the largest volcano in the solar system?",
    "correct_answer": "Mars",
    "_created_at": {
      "$date": "2024-10-24T19:17:10.787Z"
    },
    "_updated_at": {
      "$date": "2024-10-27T15:14:23.346Z"
    },
    "usedTimes": 0
  },
  {
    "_id": "MPSaeI7ZNv",
    "options": [
      "Infrared",
      "Ultraviolet",
      "Visible light",
      "Microwaves"
    ],
    "_p_quiz": "EdlvPGEeO9",
    "question": "Which part of the electromagnetic spectrum is visible to the human eye?",
    "correct_answer": "Visible light",
    "_created_at": {
      "$date": "2024-10-24T19:17:10.788Z"
    },
    "_updated_at": {
      "$date": "2024-10-27T15:14:34.492Z"
    },
    "usedTimes": 0
  },
  {
    "_id": "mKbhZeszLD",
    "options": [
      "Exothermic",
      "Endothermic",
      "Catabolic",
      "Anabolic"
    ],
    "_p_quiz": "EdlvPGEeO9",
    "question": "What is the term for a chemical reaction that absorbs energy?",
    "correct_answer": "Endothermic",
    "_created_at": {
      "$date": "2024-10-24T19:17:10.788Z"
    },
    "_updated_at": {
      "$date": "2024-10-27T15:14:35.365Z"
    },
    "usedTimes": 0
  },
  {
    "_id": "dGyM6S5Gst",
    "options": [
      "Carbon Dioxide",
      "Methane",
      "Water Vapor",
      "Nitrous Oxide"
    ],
    "_p_quiz": "EdlvPGEeO9",
    "question": "What is the most abundant greenhouse gas in Earth's atmosphere?",
    "correct_answer": "Water Vapor",
    "_created_at": {
      "$date": "2024-10-24T19:17:10.788Z"
    },
    "_updated_at": {
      "$date": "2024-10-27T15:14:40.089Z"
    },
    "usedTimes": 0
  },
  {
    "_id": "nNw2Xiz4AC",
    "options": [
      "Stomach",
      "Small intestine",
      "Large intestine",
      "Liver"
    ],
    "_p_quiz": "EdlvPGEeO9",
    "question": "Which part of the human body is primarily responsible for absorbing nutrients?",
    "correct_answer": "Small intestine",
    "_created_at": {
      "$date": "2024-10-24T19:17:10.788Z"
    },
    "_updated_at": {
      "$date": "2024-10-24T19:17:10.788Z"
    },
    "usedTimes": 0
  },
  {
    "_id": "2nCKtBnIDi",
    "options": [
      "Stomach",
      "Pancreas",
      "Liver",
      "Gallbladder"
    ],
    "_p_quiz": "EdlvPGEeO9",
    "question": "Which organ is responsible for producing bile in the human body?",
    "correct_answer": "Liver",
    "_created_at": {
      "$date": "2024-10-24T19:17:10.788Z"
    },
    "_updated_at": {
      "$date": "2024-10-24T19:17:10.788Z"
    },
    "usedTimes": 0
  },
  {
    "_id": "NjDZexH5ia",
    "options": [
      "P",
      "K",
      "Ca",
      "Na"
    ],
    "_p_quiz": "EdlvPGEeO9",
    "question": "What is the chemical symbol for potassium?",
    "correct_answer": "K",
    "_created_at": {
      "$date": "2024-10-24T19:17:10.788Z"
    },
    "_updated_at": {
      "$date": "2024-10-27T15:14:40.099Z"
    },
    "usedTimes": 0
  },
  {
    "_id": "Y1cDczthwe",
    "options": [
      "Mercury",
      "Iron",
      "Aluminum",
      "Copper"
    ],
    "_p_quiz": "EdlvPGEeO9",
    "question": "Which element is a liquid at room temperature?",
    "correct_answer": "Mercury",
    "_created_at": {
      "$date": "2024-10-24T19:17:10.788Z"
    },
    "_updated_at": {
      "$date": "2024-10-27T15:14:40.382Z"
    },
    "usedTimes": 0
  },
  {
    "_id": "bKaMzP00rD",
    "options": [
      "Mycoremediation",
      "Mycorrhization",
      "Cellulolysis",
      "Glucolysis"
    ],
    "_p_quiz": "dkeiAJRpIy",
    "question": "What is the name of the process by which certain fungi convert cellulose into glucose?",
    "correct_answer": "Cellulolysis",
    "_created_at": {
      "$date": "2024-10-24T19:28:27.345Z"
    },
    "_updated_at": {
      "$date": "2024-10-24T19:28:27.345Z"
    },
    "usedTimes": 0
  },
  {
    "_id": "tn5tPg1S8I",
    "options": [
      "Neodymium",
      "Promethium",
      "Thulium",
      "Ytterbium"
    ],
    "_p_quiz": "dkeiAJRpIy",
    "question": "Which rare element is primarily obtained from the mineral bastnäsite?",
    "correct_answer": "Neodymium",
    "_created_at": {
      "$date": "2024-10-24T19:28:27.345Z"
    },
    "_updated_at": {
      "$date": "2024-10-24T19:28:27.345Z"
    },
    "usedTimes": 0
  },
  {
    "_id": "EzW0BE6VSc",
    "options": [
      "Protein synthesis",
      "Energy production",
      "Protein modification and sorting",
      "DNA replication"
    ],
    "_p_quiz": "dkeiAJRpIy",
    "question": "What is the main purpose of the Golgi apparatus in a eukaryotic cell?",
    "correct_answer": "Protein modification and sorting",
    "_created_at": {
      "$date": "2024-10-24T19:28:27.345Z"
    },
    "_updated_at": {
      "$date": "2024-10-24T19:28:27.345Z"
    },
    "usedTimes": 0
  },
  {
    "_id": "lnzMMp8wss",
    "options": [
      "Decomposition",
      "Synthesis",
      "Single displacement",
      "Double displacement"
    ],
    "_p_quiz": "dkeiAJRpIy",
    "question": "In which type of chemical reaction do two or more substances combine to form a more complex product?",
    "correct_answer": "Synthesis",
    "_created_at": {
      "$date": "2024-10-24T19:28:27.345Z"
    },
    "_updated_at": {
      "$date": "2024-10-24T19:28:27.345Z"
    },
    "usedTimes": 0
  },
  {
    "_id": "O9JMcVGpJD",
    "options": [
      "Chemotaxis",
      "Quorum sensing",
      "Bioluminescence",
      "Symbiosis"
    ],
    "_p_quiz": "dkeiAJRpIy",
    "question": "What is the term for the phenomenon where bacteria communicate with each other using chemical signals?",
    "correct_answer": "Quorum sensing",
    "_created_at": {
      "$date": "2024-10-24T19:28:27.345Z"
    },
    "_updated_at": {
      "$date": "2024-10-24T19:28:27.345Z"
    },
    "usedTimes": 0
  },
  {
    "_id": "pfU1sOETiD",
    "options": [
      "Aerodynamics",
      "Hydrodynamics",
      "Thermodynamics",
      "Electrodynamics"
    ],
    "_p_quiz": "dkeiAJRpIy",
    "question": "Which branch of physics deals with the motion of air and the forces on solid objects moving through air?",
    "correct_answer": "Aerodynamics",
    "_created_at": {
      "$date": "2024-10-24T19:28:27.345Z"
    },
    "_updated_at": {
      "$date": "2024-10-24T19:28:27.345Z"
    },
    "usedTimes": 0
  },
  {
    "_id": "WRYjLbhqDW",
    "options": [
      "Ionic bond",
      "Metallic bond",
      "Covalent bond",
      "Hydrogen bond"
    ],
    "_p_quiz": "dkeiAJRpIy",
    "question": "Which type of bond involves the sharing of a pair of electrons between atoms in a molecule?",
    "correct_answer": "Covalent bond",
    "_created_at": {
      "$date": "2024-10-24T19:28:27.345Z"
    },
    "_updated_at": {
      "$date": "2024-10-24T19:28:27.345Z"
    },
    "usedTimes": 0
  },
  {
    "_id": "TptGqsn4ma",
    "options": [
      "Ultraviolet",
      "Infrared",
      "Microwave",
      "Gamma rays"
    ],
    "_p_quiz": "dkeiAJRpIy",
    "question": "Which type of electromagnetic radiation is primarily used in night vision technology?",
    "correct_answer": "Infrared",
    "_created_at": {
      "$date": "2024-10-24T19:28:27.345Z"
    },
    "_updated_at": {
      "$date": "2024-10-24T19:28:27.345Z"
    },
    "usedTimes": 0
  },
  {
    "_id": "c2yTzivy3h",
    "options": [
      "Richter scale",
      "Beaufort scale",
      "Mohs scale",
      "Scoville scale"
    ],
    "_p_quiz": "dkeiAJRpIy",
    "question": "What is the name of the scale used to measure the hardness of minerals?",
    "correct_answer": "Mohs scale",
    "_created_at": {
      "$date": "2024-10-24T19:28:27.345Z"
    },
    "_updated_at": {
      "$date": "2024-10-24T19:28:27.345Z"
    },
    "usedTimes": 0
  },
  {
    "_id": "sTtyjjfrWk",
    "options": [
      "ATP synthase",
      "Cytochrome c oxidase",
      "NADH dehydrogenase",
      "Ubiquinone"
    ],
    "_p_quiz": "dkeiAJRpIy",
    "question": "What is the name of the protein complex that synthesizes ATP in the mitochondria?",
    "correct_answer": "ATP synthase",
    "_created_at": {
      "$date": "2024-10-24T19:28:27.346Z"
    },
    "_updated_at": {
      "$date": "2024-10-24T19:28:27.346Z"
    },
    "usedTimes": 0
  },
  {
    "_id": "LbbGb6VL9s",
    "options": [
      "Red giant",
      "White dwarf",
      "Neutron star",
      "Black hole"
    ],
    "_p_quiz": "dkeiAJRpIy",
    "question": "Which type of star is characterized by its small size, high density, and rapid rotation?",
    "correct_answer": "Neutron star",
    "_created_at": {
      "$date": "2024-10-24T19:28:27.346Z"
    },
    "_updated_at": {
      "$date": "2024-10-24T19:28:27.346Z"
    },
    "usedTimes": 0
  },
  {
    "_id": "KDoK5CaFVw",
    "options": [
      "Microtubules",
      "Microfilaments",
      "Intermediate filaments",
      "Actin filaments"
    ],
    "_p_quiz": "dkeiAJRpIy",
    "question": "What is the primary structure that forms the spindle apparatus during cell division?",
    "correct_answer": "Microtubules",
    "_created_at": {
      "$date": "2024-10-24T19:28:27.346Z"
    },
    "_updated_at": {
      "$date": "2024-10-24T19:28:27.346Z"
    },
    "usedTimes": 0
  },
  {
    "_id": "GUg0Bwyd4M",
    "options": [
      "Superposition",
      "Entanglement",
      "Coherence",
      "Decoherence"
    ],
    "_p_quiz": "dkeiAJRpIy",
    "question": "What is the term for the quantum mechanical property of particles being in multiple states at once?",
    "correct_answer": "Superposition",
    "_created_at": {
      "$date": "2024-10-24T19:28:27.345Z"
    },
    "_updated_at": {
      "$date": "2024-10-24T19:28:27.345Z"
    },
    "usedTimes": 0
  },
  {
    "_id": "waYzUu7ztt",
    "options": [
      "RNA",
      "DNA",
      "Protein",
      "Carbohydrate"
    ],
    "_p_quiz": "dkeiAJRpIy",
    "question": "Which molecule is the primary carrier of genetic information in living organisms?",
    "correct_answer": "DNA",
    "_created_at": {
      "$date": "2024-10-24T19:28:27.346Z"
    },
    "_updated_at": {
      "$date": "2024-10-24T19:28:27.346Z"
    },
    "usedTimes": 0
  },
  {
    "_id": "AyH85aQoXM",
    "options": [
      "Helium",
      "Argon",
      "Xenon",
      "Krypton"
    ],
    "_p_quiz": "dkeiAJRpIy",
    "question": "Which gas is commonly used as a tracer in leak detection and environmental studies due to its inertness?",
    "correct_answer": "Helium",
    "_created_at": {
      "$date": "2024-10-24T19:28:27.346Z"
    },
    "_updated_at": {
      "$date": "2024-10-24T19:28:27.346Z"
    },
    "usedTimes": 0
  },
  {
    "_id": "RXs92HcQgh",
    "options": [
      "Phosphorescence",
      "Fluorescence",
      "Bioluminescence",
      "Incandescence"
    ],
    "_p_quiz": "dkeiAJRpIy",
    "question": "What is the term for the phenomenon where certain materials emit light when they absorb photons?",
    "correct_answer": "Fluorescence",
    "_created_at": {
      "$date": "2024-10-24T19:28:27.346Z"
    },
    "_updated_at": {
      "$date": "2024-10-24T19:28:27.346Z"
    },
    "usedTimes": 0
  },
  {
    "_id": "MrKaycVbmf",
    "options": [
      "DNA replication",
      "Protein synthesis",
      "Lipid metabolism",
      "Carbohydrate storage"
    ],
    "_p_quiz": "dkeiAJRpIy",
    "question": "What is the main function of ribosomal RNA (rRNA) in cells?",
    "correct_answer": "Protein synthesis",
    "_created_at": {
      "$date": "2024-10-24T19:28:27.346Z"
    },
    "_updated_at": {
      "$date": "2024-10-24T19:28:27.346Z"
    },
    "usedTimes": 0
  },
  {
    "_id": "FdC9S6wkkj",
    "options": [
      "DNA ligase",
      "RNA polymerase",
      "DNA polymerase",
      "Helicase"
    ],
    "_p_quiz": "dkeiAJRpIy",
    "question": "Which enzyme is responsible for catalyzing the replication of DNA?",
    "correct_answer": "DNA polymerase",
    "_created_at": {
      "$date": "2024-10-24T19:28:27.346Z"
    },
    "_updated_at": {
      "$date": "2024-10-24T19:28:27.346Z"
    },
    "usedTimes": 0
  },
  {
    "_id": "zeXLE6qP3u",
    "options": [
      "Photosynthesis",
      "Transpiration",
      "Respiration",
      "Osmosis"
    ],
    "_p_quiz": "dkeiAJRpIy",
    "question": "What is the term for the process by which plants release water vapor through small openings in their leaves?",
    "correct_answer": "Transpiration",
    "_created_at": {
      "$date": "2024-10-24T19:28:27.346Z"
    },
    "_updated_at": {
      "$date": "2024-10-24T19:28:27.346Z"
    },
    "usedTimes": 0
  },
  {
    "_id": "2l7qp46JGF",
    "options": [
      "Pauli exclusion principle",
      "Heisenberg uncertainty principle",
      "Bohr model",
      "Schrodinger equation"
    ],
    "_p_quiz": "dkeiAJRpIy",
    "question": "Which principle states that it is impossible to simultaneously know both the position and velocity of a particle?",
    "correct_answer": "Heisenberg uncertainty principle",
    "_created_at": {
      "$date": "2024-10-24T19:28:27.346Z"
    },
    "_updated_at": {
      "$date": "2024-10-24T19:28:27.346Z"
    },
    "usedTimes": 0
  },
  {
    "_id": "Fw1aPaKQDk",
    "options": [
      "Jellyfish",
      "Coral",
      "Octopus",
      "Sea turtle"
    ],
    "_p_quiz": "dkeiAJRpIy",
    "question": "Which of the following is a common bioluminescent organism?",
    "correct_answer": "Jellyfish",
    "_created_at": {
      "$date": "2024-10-24T19:28:27.402Z"
    },
    "_updated_at": {
      "$date": "2024-10-24T19:28:27.402Z"
    },
    "usedTimes": 0
  },
  {
    "_id": "mEEDrjkGCB",
    "options": [
      "Ionization energy",
      "Electron affinity",
      "Electronegativity",
      "Activation energy"
    ],
    "_p_quiz": "dkeiAJRpIy",
    "question": "What is the term for the minimum energy required to remove an electron from an atom or molecule?",
    "correct_answer": "Ionization energy",
    "_created_at": {
      "$date": "2024-10-24T19:28:27.402Z"
    },
    "_updated_at": {
      "$date": "2024-10-24T19:28:27.402Z"
    },
    "usedTimes": 0
  },
  {
    "_id": "B7ShFJlU13",
    "options": [
      "Mitochondria",
      "Lysosome",
      "Ribosome",
      "Golgi apparatus"
    ],
    "_p_quiz": "dkeiAJRpIy",
    "question": "Which organelle is known as the 'suicide bag' of the cell due to its role in autolysis?",
    "correct_answer": "Lysosome",
    "_created_at": {
      "$date": "2024-10-24T19:28:27.402Z"
    },
    "_updated_at": {
      "$date": "2024-10-24T19:28:27.402Z"
    },
    "usedTimes": 0
  },
  {
    "_id": "kDxBJGfIX8",
    "options": [
      "Uranium-235",
      "Uranium-238",
      "Uranium-233",
      "Uranium-236"
    ],
    "_p_quiz": "dkeiAJRpIy",
    "question": "What is the most common isotope of uranium used as fuel in nuclear reactors?",
    "correct_answer": "Uranium-235",
    "_created_at": {
      "$date": "2024-10-24T19:28:27.402Z"
    },
    "_updated_at": {
      "$date": "2024-10-24T19:28:27.402Z"
    },
    "usedTimes": 0
  },
  {
    "_id": "VGm3oA9ULR",
    "options": [
      "Covalent bond",
      "Ionic bond",
      "Metallic bond",
      "Hydrogen bond"
    ],
    "_p_quiz": "dkeiAJRpIy",
    "question": "Which type of chemical bond results from the transfer of electrons from one atom to another?",
    "correct_answer": "Ionic bond",
    "_created_at": {
      "$date": "2024-10-24T19:28:27.402Z"
    },
    "_updated_at": {
      "$date": "2024-10-26T14:34:38.552Z"
    },
    "usedTimes": 0
  },
  {
    "_id": "87btaO4XSm",
    "options": [
      "Archimedes' principle",
      "Bernoulli's principle",
      "Pascal's principle",
      "Heisenberg's principle"
    ],
    "_p_quiz": "dkeiAJRpIy",
    "question": "Which principle explains why planes are able to fly?",
    "correct_answer": "Bernoulli's principle",
    "_created_at": {
      "$date": "2024-10-24T19:28:27.403Z"
    },
    "_updated_at": {
      "$date": "2024-10-26T14:34:24.214Z"
    },
    "usedTimes": 0
  },
  {
    "_id": "w7qPRbPstr",
    "options": [
      "Condensation",
      "Sublimation",
      "Vaporization",
      "Evaporation"
    ],
    "_p_quiz": "dkeiAJRpIy",
    "question": "What is the process by which a liquid changes into a gas at temperatures below its boiling point?",
    "correct_answer": "Evaporation",
    "_created_at": {
      "$date": "2024-10-24T19:28:27.402Z"
    },
    "_updated_at": {
      "$date": "2024-10-24T19:28:27.402Z"
    },
    "usedTimes": 0
  },
  {
    "_id": "q8fFKhp333",
    "options": [
      "Nitrogen dioxide",
      "Nitrous oxide",
      "Carbon dioxide",
      "Sulfur dioxide"
    ],
    "_p_quiz": "dkeiAJRpIy",
    "question": "Which gas is commonly known as laughing gas?",
    "correct_answer": "Nitrous oxide",
    "_created_at": {
      "$date": "2024-10-24T19:28:27.402Z"
    },
    "_updated_at": {
      "$date": "2024-10-24T19:28:27.402Z"
    },
    "usedTimes": 0
  },
  {
    "_id": "dUISwnAeXQ",
    "options": [
      "Thermometer",
      "Barometer",
      "Anemometer",
      "Hygrometer"
    ],
    "_p_quiz": "dkeiAJRpIy",
    "question": "What is the name of the device used to measure atmospheric pressure?",
    "correct_answer": "Barometer",
    "_created_at": {
      "$date": "2024-10-24T19:28:27.402Z"
    },
    "_updated_at": {
      "$date": "2024-10-24T19:28:27.402Z"
    },
    "usedTimes": 0
  },
  {
    "_id": "Qwcb0rTfzq",
    "options": [
      "Ecology",
      "Sociology",
      "Biology",
      "Geology"
    ],
    "_p_quiz": "dkeiAJRpIy",
    "question": "What is the term for the study of how organisms interact with each other and their environment?",
    "correct_answer": "Ecology",
    "_created_at": {
      "$date": "2024-10-24T19:28:27.402Z"
    },
    "_updated_at": {
      "$date": "2024-10-24T19:28:27.402Z"
    },
    "usedTimes": 0
  },
  {
    "_id": "nsS2rQjHw3",
    "options": [
      "Break down proteins",
      "Break down carbohydrates",
      "Break down fats",
      "Break down nucleic acids"
    ],
    "_p_quiz": "dkeiAJRpIy",
    "question": "What is the main function of the enzyme amylase in the digestive system?",
    "correct_answer": "Break down carbohydrates",
    "_created_at": {
      "$date": "2024-10-24T19:28:27.402Z"
    },
    "_updated_at": {
      "$date": "2024-10-24T19:28:27.402Z"
    },
    "usedTimes": 0
  },
  {
    "_id": "SOzm7F0fTA",
    "options": [
      "Reflection",
      "Diffraction",
      "Dispersion",
      "Refraction"
    ],
    "_p_quiz": "dkeiAJRpIy",
    "question": "What is the term for the bending of light as it passes through a medium with a different refractive index?",
    "correct_answer": "Refraction",
    "_created_at": {
      "$date": "2024-10-24T19:28:27.402Z"
    },
    "_updated_at": {
      "$date": "2024-10-24T19:28:27.402Z"
    },
    "usedTimes": 0
  },
  {
    "_id": "xGHdXD1tIX",
    "options": [
      "Increase the temperature",
      "Decrease the temperature",
      "Increase the rate of reaction",
      "Decrease the rate of reaction"
    ],
    "_p_quiz": "dkeiAJRpIy",
    "question": "What is the main purpose of a catalyst in a chemical reaction?",
    "correct_answer": "Increase the rate of reaction",
    "_created_at": {
      "$date": "2024-10-24T19:28:27.402Z"
    },
    "_updated_at": {
      "$date": "2024-10-24T19:28:27.402Z"
    },
    "usedTimes": 0
  },
  {
    "_id": "rJBzvOOVAB",
    "options": [
      "Red blood cell",
      "White blood cell",
      "Muscle cell",
      "Nerve cell"
    ],
    "_p_quiz": "dkeiAJRpIy",
    "question": "Which type of cell in the human body lacks a nucleus?",
    "correct_answer": "Red blood cell",
    "_created_at": {
      "$date": "2024-10-24T19:28:27.402Z"
    },
    "_updated_at": {
      "$date": "2024-10-24T19:28:27.402Z"
    },
    "usedTimes": 0
  },
  {
    "_id": "4BPRwoPhRS",
    "options": [
      "Nitrogen fixation",
      "Nitrification",
      "Denitrification",
      "Ammonification"
    ],
    "_p_quiz": "dkeiAJRpIy",
    "question": "What is the name of the process by which plants convert nitrogen gas from the atmosphere into ammonia?",
    "correct_answer": "Nitrogen fixation",
    "_created_at": {
      "$date": "2024-10-24T19:28:27.402Z"
    },
    "_updated_at": {
      "$date": "2024-10-24T19:28:27.402Z"
    },
    "usedTimes": 0
  },
  {
    "_id": "7sTJq4Q85s",
    "options": [
      "Ethane",
      "Propane",
      "Butane",
      "Methane"
    ],
    "_p_quiz": "dkeiAJRpIy",
    "question": "What is the primary component of natural gas?",
    "correct_answer": "Methane",
    "_created_at": {
      "$date": "2024-10-24T19:28:27.402Z"
    },
    "_updated_at": {
      "$date": "2024-10-24T19:28:27.402Z"
    },
    "usedTimes": 0
  },
  {
    "_id": "niY8OC82N0",
    "options": [
      "Radio waves",
      "Microwaves",
      "Gamma rays",
      "Infrared"
    ],
    "_p_quiz": "dkeiAJRpIy",
    "question": "Which type of electromagnetic wave has the highest energy?",
    "correct_answer": "Gamma rays",
    "_created_at": {
      "$date": "2024-10-24T19:28:27.402Z"
    },
    "_updated_at": {
      "$date": "2024-10-26T14:34:24.636Z"
    },
    "usedTimes": 0
  },
  {
    "_id": "tfLWy8iORA",
    "options": [
      "Melting point",
      "Boiling point",
      "Freezing point",
      "Sublimation point"
    ],
    "_p_quiz": "dkeiAJRpIy",
    "question": "What is the term for the temperature at which a liquid turns into a solid?",
    "correct_answer": "Freezing point",
    "_created_at": {
      "$date": "2024-10-24T19:28:27.403Z"
    },
    "_updated_at": {
      "$date": "2024-10-26T14:34:23.374Z"
    },
    "usedTimes": 0
  },
  {
    "_id": "KCjdU0ed1x",
    "options": [
      "Synthesis",
      "Decomposition",
      "Single displacement",
      "Double displacement"
    ],
    "_p_quiz": "dkeiAJRpIy",
    "question": "Which type of chemical reaction involves the exchange of ions between two compounds?",
    "correct_answer": "Double displacement",
    "_created_at": {
      "$date": "2024-10-24T19:28:27.403Z"
    },
    "_updated_at": {
      "$date": "2024-10-26T14:34:23.759Z"
    },
    "usedTimes": 0
  },
  {
    "_id": "2jeQ3K4TZT",
    "options": [
      "Viscosity",
      "Elasticity",
      "Density",
      "Buoyancy"
    ],
    "_p_quiz": "dkeiAJRpIy",
    "question": "What is the term for the resistance of a fluid to flow?",
    "correct_answer": "Viscosity",
    "_created_at": {
      "$date": "2024-10-24T19:28:27.402Z"
    },
    "_updated_at": {
      "$date": "2024-10-26T14:34:25.133Z"
    },
    "usedTimes": 0
  },
  {
    "_id": "pCBgPOCRau",
    "options": [
      "Elasticity",
      "Plasticity",
      "Viscosity",
      "Ductility"
    ],
    "_p_quiz": "dkeiAJRpIy",
    "question": "What is the term for the ability of a material to return to its original shape after being deformed?",
    "correct_answer": "Elasticity",
    "_created_at": {
      "$date": "2024-10-24T19:28:27.435Z"
    },
    "_updated_at": {
      "$date": "2024-10-26T14:34:21.745Z"
    },
    "usedTimes": 0
  },
  {
    "_id": "eVAfqkF2uc",
    "options": [
      "Volt",
      "Ohm",
      "Ampere",
      "Watt"
    ],
    "_p_quiz": "dkeiAJRpIy",
    "question": "What is the unit of measure for electric current?",
    "correct_answer": "Ampere",
    "_created_at": {
      "$date": "2024-10-24T19:28:27.435Z"
    },
    "_updated_at": {
      "$date": "2024-10-26T14:34:21.340Z"
    },
    "usedTimes": 0
  },
  {
    "_id": "mlzLrf2nlE",
    "options": [
      "Ultraviolet",
      "Infrared",
      "X-rays",
      "Microwaves"
    ],
    "_p_quiz": "dkeiAJRpIy",
    "question": "Which type of electromagnetic radiation is used in medical imaging to visualize bones?",
    "correct_answer": "X-rays",
    "_created_at": {
      "$date": "2024-10-24T19:28:27.435Z"
    },
    "_updated_at": {
      "$date": "2024-10-26T14:34:16.412Z"
    },
    "usedTimes": 0
  },
  {
    "_id": "CuC09T0H8A",
    "options": [
      "Radio waves",
      "Microwaves",
      "Infrared waves",
      "Ultraviolet waves"
    ],
    "_p_quiz": "dkeiAJRpIy",
    "question": "Which type of wave is used in radar technology to detect objects?",
    "correct_answer": "Microwaves",
    "_created_at": {
      "$date": "2024-10-24T19:28:27.435Z"
    },
    "_updated_at": {
      "$date": "2024-10-26T14:34:22.195Z"
    },
    "usedTimes": 0
  },
  {
    "_id": "kFGNuudrnW",
    "options": [
      "Hydrogen",
      "Helium",
      "Carbon",
      "Oxygen"
    ],
    "_p_quiz": "dkeiAJRpIy",
    "question": "Which element is used as a standard for defining the atomic mass unit?",
    "correct_answer": "Carbon",
    "_created_at": {
      "$date": "2024-10-24T19:28:27.435Z"
    },
    "_updated_at": {
      "$date": "2024-10-26T14:34:19.256Z"
    },
    "usedTimes": 0
  },
  {
    "_id": "oYsU6lWFDS",
    "options": [
      "Red blood cell",
      "White blood cell",
      "Platelet",
      "Neuron"
    ],
    "_p_quiz": "dkeiAJRpIy",
    "question": "Which type of cell is responsible for the immune response in the human body?",
    "correct_answer": "White blood cell",
    "_created_at": {
      "$date": "2024-10-24T19:28:27.435Z"
    },
    "_updated_at": {
      "$date": "2024-10-26T14:34:15.402Z"
    },
    "usedTimes": 0
  },
  {
    "_id": "uFFrC4JLKY",
    "options": [
      "Absorb nutrients",
      "Produce bile",
      "Filter waste",
      "Store food"
    ],
    "_p_quiz": "dkeiAJRpIy",
    "question": "What is the main function of the small intestine in the digestive system?",
    "correct_answer": "Absorb nutrients",
    "_created_at": {
      "$date": "2024-10-24T19:28:27.435Z"
    },
    "_updated_at": {
      "$date": "2024-10-26T14:34:13.324Z"
    },
    "usedTimes": 0
  },
  {
    "_id": "WnwsC0qeu4",
    "options": [
      "Diffusion",
      "Osmosis",
      "Filtration",
      "Active transport"
    ],
    "_p_quiz": "dkeiAJRpIy",
    "question": "Which process describes the movement of water molecules across a semipermeable membrane?",
    "correct_answer": "Osmosis",
    "_created_at": {
      "$date": "2024-10-24T19:28:27.435Z"
    },
    "_updated_at": {
      "$date": "2024-10-26T14:34:20.091Z"
    },
    "usedTimes": 0
  },
  {
    "_id": "seydsC4onT",
    "options": [
      "Diffusion",
      "Osmosis",
      "Brownian motion",
      "Convection"
    ],
    "_p_quiz": "dkeiAJRpIy",
    "question": "What is the term for the random movement of particles suspended in a fluid?",
    "correct_answer": "Brownian motion",
    "_created_at": {
      "$date": "2024-10-24T19:28:27.435Z"
    },
    "_updated_at": {
      "$date": "2024-10-26T14:34:19.687Z"
    },
    "usedTimes": 0
  },
  {
    "_id": "5B7DoteTFM",
    "options": [
      "Absorb water",
      "Absorb carbon dioxide",
      "Absorb sunlight",
      "Release oxygen"
    ],
    "_p_quiz": "dkeiAJRpIy",
    "question": "What is the primary role of chlorophyll in photosynthesis?",
    "correct_answer": "Absorb sunlight",
    "_created_at": {
      "$date": "2024-10-24T19:28:27.435Z"
    },
    "_updated_at": {
      "$date": "2024-10-26T14:34:18.019Z"
    },
    "usedTimes": 0
  },
  {
    "_id": "caqKk6er3j",
    "options": [
      "Break down lactose",
      "Break down proteins",
      "Break down fats",
      "Break down starch"
    ],
    "_p_quiz": "dkeiAJRpIy",
    "question": "What is the primary function of the enzyme lactase in the human body?",
    "correct_answer": "Break down lactose",
    "_created_at": {
      "$date": "2024-10-24T19:28:27.435Z"
    },
    "_updated_at": {
      "$date": "2024-10-26T14:34:12.882Z"
    },
    "usedTimes": 0
  },
  {
    "_id": "MG5IAlIXT2",
    "options": [
      "Solid rock",
      "Liquid rock",
      "Solid metal",
      "Liquid metal"
    ],
    "_p_quiz": "dkeiAJRpIy",
    "question": "What is the primary component of the Earth's outer core?",
    "correct_answer": "Liquid metal",
    "_created_at": {
      "$date": "2024-10-24T19:28:27.435Z"
    },
    "_updated_at": {
      "$date": "2024-10-26T14:34:20.524Z"
    },
    "usedTimes": 0
  },
  {
    "_id": "CA7dA5tBol",
    "options": [
      "tRNA",
      "rRNA",
      "mRNA",
      "DNA"
    ],
    "_p_quiz": "dkeiAJRpIy",
    "question": "Which molecule carries genetic information from the DNA to the ribosome for protein synthesis?",
    "correct_answer": "mRNA",
    "_created_at": {
      "$date": "2024-10-24T19:28:27.435Z"
    },
    "_updated_at": {
      "$date": "2024-10-26T14:34:14.213Z"
    },
    "usedTimes": 0
  },
  {
    "_id": "m5gDlBbQ5z",
    "options": [
      "Photosynthesis",
      "Respiration",
      "Transpiration",
      "Fermentation"
    ],
    "_p_quiz": "dkeiAJRpIy",
    "question": "What is the term for the process by which plants and algae convert carbon dioxide into organic compounds using sunlight?",
    "correct_answer": "Photosynthesis",
    "_created_at": {
      "$date": "2024-10-24T19:28:27.435Z"
    },
    "_updated_at": {
      "$date": "2024-10-26T14:34:20.942Z"
    },
    "usedTimes": 0
  },
  {
    "_id": "kN86H3JNB6",
    "options": [
      "Ionic bond",
      "Covalent bond",
      "Metallic bond",
      "Hydrogen bond"
    ],
    "_p_quiz": "dkeiAJRpIy",
    "question": "Which type of chemical bond involves the sharing of electron pairs between atoms?",
    "correct_answer": "Covalent bond",
    "_created_at": {
      "$date": "2024-10-24T19:28:27.435Z"
    },
    "_updated_at": {
      "$date": "2024-10-26T14:34:14.931Z"
    },
    "usedTimes": 0
  },
  {
    "_id": "wfrT33bFaZ",
    "options": [
      "Aerobic respiration",
      "Photosynthesis",
      "Fermentation",
      "Glycolysis"
    ],
    "_p_quiz": "dkeiAJRpIy",
    "question": "What is the term for the process by which cells obtain energy from glucose without using oxygen?",
    "correct_answer": "Fermentation",
    "_created_at": {
      "$date": "2024-10-24T19:28:27.435Z"
    },
    "_updated_at": {
      "$date": "2024-10-26T14:34:18.825Z"
    },
    "usedTimes": 0
  },
  {
    "_id": "UJLt4nxBHY",
    "options": [
      "Melting",
      "Condensation",
      "Sublimation",
      "Evaporation"
    ],
    "_p_quiz": "dkeiAJRpIy",
    "question": "What is the term for the process by which a solid changes directly into a gas?",
    "correct_answer": "Sublimation",
    "_created_at": {
      "$date": "2024-10-24T19:28:27.435Z"
    },
    "_updated_at": {
      "$date": "2024-10-26T14:34:15.873Z"
    },
    "usedTimes": 0
  },
  {
    "_id": "3h1hwOADnQ",
    "options": [
      "Infrared",
      "Ultraviolet",
      "Microwaves",
      "Gamma rays"
    ],
    "_p_quiz": "dkeiAJRpIy",
    "question": "Which type of electromagnetic radiation is used for sterilizing medical equipment?",
    "correct_answer": "Ultraviolet",
    "_created_at": {
      "$date": "2024-10-24T19:28:27.435Z"
    },
    "_updated_at": {
      "$date": "2024-10-26T14:34:16.889Z"
    },
    "usedTimes": 0
  },
  {
    "_id": "jCtkvxEIGf",
    "options": [
      "Iron",
      "Gold",
      "Copper",
      "Aluminum"
    ],
    "_p_quiz": "dkeiAJRpIy",
    "question": "Which element is known for its high thermal and electrical conductivity?",
    "correct_answer": "Copper",
    "_created_at": {
      "$date": "2024-10-24T19:28:27.435Z"
    },
    "_updated_at": {
      "$date": "2024-10-26T14:34:13.752Z"
    },
    "usedTimes": 0
  },
  {
    "_id": "rGGGrkRquo",
    "options": [
      "Temperature",
      "Pressure",
      "Volume",
      "Density"
    ],
    "_p_quiz": "dkeiAJRpIy",
    "question": "What is the term for the measure of the average kinetic energy of particles in a substance?",
    "correct_answer": "Temperature",
    "_created_at": {
      "$date": "2024-10-24T19:28:27.435Z"
    },
    "_updated_at": {
      "$date": "2024-10-26T14:34:18.404Z"
    },
    "usedTimes": 0
  },
  {
    "_id": "IFUpq8o8ky",
    "options": [
      "Melting",
      "Boiling",
      "Freezing",
      "Evaporation"
    ],
    "_p_quiz": "dkeiAJRpIy",
    "question": "What is the term for the process by which a liquid turns into a solid?",
    "correct_answer": "Freezing",
    "_created_at": {
      "$date": "2024-10-24T19:28:27.466Z"
    },
    "_updated_at": {
      "$date": "2024-10-26T14:34:12.467Z"
    },
    "usedTimes": 0
  },
  {
    "_id": "VPXA4Dipxs",
    "options": [
      "Iron",
      "Calcium",
      "Potassium",
      "Magnesium"
    ],
    "_p_quiz": "dkeiAJRpIy",
    "question": "Which element is essential for the formation of bones and teeth in the human body?",
    "correct_answer": "Calcium",
    "_created_at": {
      "$date": "2024-10-24T19:28:27.467Z"
    },
    "_updated_at": {
      "$date": "2024-10-26T14:34:10.372Z"
    },
    "usedTimes": 0
  },
  {
    "_id": "9rkED7Jrdv",
    "options": [
      "Absorb nutrients",
      "Digest proteins",
      "Absorb water",
      "Produce enzymes"
    ],
    "_p_quiz": "dkeiAJRpIy",
    "question": "What is the primary function of the large intestine in the human digestive system?",
    "correct_answer": "Absorb water",
    "_created_at": {
      "$date": "2024-10-24T19:28:27.467Z"
    },
    "_updated_at": {
      "$date": "2024-10-26T14:34:09.553Z"
    },
    "usedTimes": 0
  },
  {
    "_id": "zZaUXoW7zr",
    "options": [
      "Transport oxygen",
      "Digest proteins",
      "Store energy",
      "Regulate temperature"
    ],
    "_p_quiz": "dkeiAJRpIy",
    "question": "What is the role of hemoglobin in the human body?",
    "correct_answer": "Transport oxygen",
    "_created_at": {
      "$date": "2024-10-24T19:28:27.466Z"
    },
    "_updated_at": {
      "$date": "2024-10-26T14:34:11.622Z"
    },
    "usedTimes": 0
  },
  {
    "_id": "2pnWzgvNTC",
    "options": [
      "Synthesize proteins",
      "Produce energy",
      "Store nutrients",
      "Replicate DNA"
    ],
    "_p_quiz": "dkeiAJRpIy",
    "question": "What is the primary function of the mitochondria in eukaryotic cells?",
    "correct_answer": "Produce energy",
    "_created_at": {
      "$date": "2024-10-24T19:28:27.466Z"
    },
    "_updated_at": {
      "$date": "2024-10-26T14:34:10.798Z"
    },
    "usedTimes": 0
  },
  {
    "_id": "EZEZWgl4Lp",
    "options": [
      "Mass",
      "Volume",
      "Density",
      "Weight"
    ],
    "_p_quiz": "dkeiAJRpIy",
    "question": "What is the term for the amount of space an object occupies?",
    "correct_answer": "Volume",
    "_created_at": {
      "$date": "2024-10-24T19:28:27.466Z"
    },
    "_updated_at": {
      "$date": "2024-10-26T14:34:11.209Z"
    },
    "usedTimes": 0
  },
  {
    "_id": "IXKcbZMasl",
    "options": [
      "Osmosis",
      "Diffusion",
      "Active transport",
      "Facilitated diffusion"
    ],
    "_p_quiz": "dkeiAJRpIy",
    "question": "What is the term for the movement of particles from an area of high concentration to an area of low concentration?",
    "correct_answer": "Diffusion",
    "_created_at": {
      "$date": "2024-10-24T19:28:27.467Z"
    },
    "_updated_at": {
      "$date": "2024-10-26T14:34:09.965Z"
    },
    "usedTimes": 0
  },
  {
    "_id": "OOFINnzZMn",
    "options": [
      "Homeostasis",
      "Metabolism",
      "Adaptation",
      "Evolution"
    ],
    "_p_quiz": "dkeiAJRpIy",
    "question": "What is the term for the ability of an organism to maintain stable internal conditions?",
    "correct_answer": "Homeostasis",
    "_created_at": {
      "$date": "2024-10-24T19:28:27.467Z"
    },
    "_updated_at": {
      "$date": "2024-10-26T14:34:07.853Z"
    },
    "usedTimes": 0
  },
  {
    "_id": "Gsx2UBGN4F",
    "options": [
      "Nitrogen",
      "Oxygen",
      "Freon",
      "Helium"
    ],
    "_p_quiz": "dkeiAJRpIy",
    "question": "Which gas is used as a refrigerant in air conditioning systems?",
    "correct_answer": "Freon",
    "_created_at": {
      "$date": "2024-10-24T19:28:27.467Z"
    },
    "_updated_at": {
      "$date": "2024-10-26T14:34:08.660Z"
    },
    "usedTimes": 0
  },
  {
    "_id": "CLEK5Yzyv0",
    "options": [
      "Smooth muscle",
      "Cardiac muscle",
      "Skeletal muscle",
      "Involuntary muscle"
    ],
    "_p_quiz": "dkeiAJRpIy",
    "question": "Which type of muscle is responsible for voluntary movements in the human body?",
    "correct_answer": "Skeletal muscle",
    "_created_at": {
      "$date": "2024-10-24T19:28:27.466Z"
    },
    "_updated_at": {
      "$date": "2024-10-26T14:34:12.032Z"
    },
    "usedTimes": 0
  },
  {
    "_id": "QvTcGi24rV",
    "options": [
      "Ionic bond",
      "Covalent bond",
      "Hydrogen bond",
      "Metallic bond"
    ],
    "_p_quiz": "dkeiAJRpIy",
    "question": "Which type of bond is found in a water molecule?",
    "correct_answer": "Covalent bond",
    "_created_at": {
      "$date": "2024-10-24T19:28:27.467Z"
    },
    "_updated_at": {
      "$date": "2024-10-26T14:34:09.128Z"
    },
    "usedTimes": 0
  }];

load_data(question_data);