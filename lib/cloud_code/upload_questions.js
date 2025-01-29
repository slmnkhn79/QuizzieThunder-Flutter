
const Parse = require('parse/node');



// Parse.initialize("myappID", "mymasterKey");
Parse.initialize(Parse.applicationId = "ihzu049k4lkpefeqFXYxwCn6kuo7qph3scKcq1sE", javaScriptKey = "zggqV0XYpXvBSE6hYidabBVK6ulCBujgGlscMT4t", masterKey = "984yh9uosBGDkVpj5bCEGdnWMSI2Kty6LXHOKkWJ");
Parse.serverURL = 'https://parseapi.back4app.com/parse';
// Parse.setAsyncStorage(AsyncLocalStorage);
// Parse.user
const Question = Parse.Object.extend("Question");

const Quiz = Parse.Object.extend("Quiz");
const _quiz = new Quiz()
_quiz.id = 'w0DjLXzN5Q';


const acl = new Parse.ACL();
acl.setPublicReadAccess(true);
acl.setPublicWriteAccess(false);
console.log(_quiz.id);


function load_data(data) {
  var list_data = [];
  for (const item of data) {

    const _questions = new Question();


    // do stuff with your user

    _questions
      .set('quiz', _quiz)
      .set('question', item['question'])
      .set('options', item['options'])
      .set('correct_answer', item['correct_answer'])
      .set('usedTimes', 0)
      .set('question_category', 'technology')
      .setACL(acl)
      ;
    list_data.push(_questions)
    // break;
  }
  try {

    // console.log(list_data[0].get('correct_answer'));
    Parse.Object.saveAll(list_data, { useMasterKey: true }).then(() => {
      console.log('save batch:-',data.length);
    }).catch((err) => {
      console.log('error:-', err.toString());
    });
  } catch (err) {
    console.log(err.toString());
  }

  // console.log(list_data[2].get('correct_answer'));

}

var question_data =  
[
  {
    "question": "Which of the following is the main function of a CPU in a computer system?",
    "options": [
      "Storing data permanently",
      "Processing instructions",
      "Generating graphics",
      "Providing power"
    ],
    "correct_answer": "Processing instructions"
  },
  {
    "question": "Which type of memory commonly stores a computer’s BIOS settings?",
    "options": [
      "RAM",
      "ROM",
      "SSD",
      "Peripheral Cache"
    ],
    "correct_answer": "ROM"
  },
  {
    "question": "Which language defines the basic structure of a web page?",
    "options": [
      "HTML",
      "CSS",
      "Java",
      "SQL"
    ],
    "correct_answer": "HTML"
  },
  {
    "question": "Which technology is typically used for storing and managing large amounts of data in a structured way?",
    "options": [
      "Spreadsheet",
      "Content Delivery Network",
      "Database",
      "Operating System"
    ],
    "correct_answer": "Database"
  },
  {
    "question": "What is the primary function of an operating system?",
    "options": [
      "Compiling code into machine language",
      "Managing hardware and software resources",
      "Providing internet connectivity",
      "Determining clock speed"
    ],
    "correct_answer": "Managing hardware and software resources"
  },
  {
    "question": "Which of these programming languages is known for its use in web front-end development?",
    "options": [
      "JavaScript",
      "Python",
      "C++",
      "Ruby"
    ],
    "correct_answer": "JavaScript"
  },
  {
    "question": "HTTPS is an extension of which protocol to secure data transmission?",
    "options": [
      "FTP",
      "TCP/IP",
      "HTTP",
      "SMTP"
    ],
    "correct_answer": "HTTP"
  },
  {
    "question": "What does the acronym LAN stand for in a networking context?",
    "options": [
      "Long Access Network",
      "Large Area Network",
      "Local Area Network",
      "Logical Area Network"
    ],
    "correct_answer": "Local Area Network"
  },
  {
    "question": "Which storage device has no moving mechanical components?",
    "options": [
      "Hard Disk Drive (HDD)",
      "Solid State Drive (SSD)",
      "Optical Drive",
      "Magnetic Tape"
    ],
    "correct_answer": "Solid State Drive (SSD)"
  },
  {
    "question": "Which of the following is a popular version control system used in software development?",
    "options": [
      "Git",
      "HTTP",
      "BIOS",
      "DNS"
    ],
    "correct_answer": "Git"
  },
  {
    "question": "Which of the following statements best describes cloud computing?",
    "options": [
      "Storing data on a local hard drive",
      "Running applications directly on hardware only",
      "Delivering computing resources over the internet on demand",
      "Using external power sources to run a computer"
    ],
    "correct_answer": "Delivering computing resources over the internet on demand"
  },
  {
    "question": "What does GUI stand for, in terms of a user interface?",
    "options": [
      "Global Utility Interface",
      "General Unified Interface",
      "Graphical User Interface",
      "Gigabit User Interchange"
    ],
    "correct_answer": "Graphical User Interface"
  },
  {
    "question": "Which protocol is primarily used for sending emails from a client to a server?",
    "options": [
      "FTP",
      "POP3",
      "SMTP",
      "SNMP"
    ],
    "correct_answer": "SMTP"
  },
  {
    "question": "Which of the following describes 'phishing' in cybersecurity?",
    "options": [
      "A technique to block incoming spam emails",
      "An attempt to obtain sensitive information by imitating a trustworthy entity",
      "A tool used to encrypt data",
      "A method of physically damaging computer hardware"
    ],
    "correct_answer": "An attempt to obtain sensitive information by imitating a trustworthy entity"
  },
  {
    "question": "Which device is referred to as the 'brain' of a computer?",
    "options": [
      "RAM",
      "CPU",
      "Motherboard",
      "GPU"
    ],
    "correct_answer": "CPU"
  },
  {
    "question": "In programming, what does 'syntax' refer to?",
    "options": [
      "The meaning of the code",
      "The structure and format of statements",
      "The way a code snippet is executed in hardware",
      "The method of converting code into an image"
    ],
    "correct_answer": "The structure and format of statements"
  },
  {
    "question": "Which port is typically used by HTTPS for secure web communication?",
    "options": [
      "Port 80",
      "Port 443",
      "Port 21",
      "Port 25"
    ],
    "correct_answer": "Port 443"
  },
  {
    "question": "Which type of testing evaluates software under expected load conditions to ensure it can handle the anticipated traffic?",
    "options": [
      "Acceptance Testing",
      "Functional Testing",
      "Performance Testing",
      "Regression Testing"
    ],
    "correct_answer": "Performance Testing"
  },
  {
    "question": "Which device translates signals from a computer into signals that can travel over telephone or cable wires?",
    "options": [
      "Router",
      "Modem",
      "Hub",
      "Switch"
    ],
    "correct_answer": "Modem"
  },
  {
    "question": "What is an IP address primarily used for?",
    "options": [
      "Storing user data online",
      "Hosting chat rooms",
      "Identifying a device on a network",
      "Enabling offline usage of applications"
    ],
    "correct_answer": "Identifying a device on a network"
  },
  {
    "question": "Which of the following is used for version control and collaboration in software projects?",
    "options": [
      "GitHub",
      "SSH",
      "Telnet",
      "VPN"
    ],
    "correct_answer": "GitHub"
  },
  {
    "question": "Which of the following best describes a firewall in networking?",
    "options": [
      "A device used to heat the server room",
      "Software/Hardware that monitors and filters incoming/outgoing network traffic",
      "A component that supplies power to network devices",
      "A protocol for sending emails"
    ],
    "correct_answer": "Software/Hardware that monitors and filters incoming/outgoing network traffic"
  },
  {
    "question": "In web development, which language primarily adds styling to a web page?",
    "options": [
      "CSS",
      "MySQL",
      "JavaScript",
      "C#"
    ],
    "correct_answer": "CSS"
  },
  {
    "question": "Which of the following is an example of an open-source operating system?",
    "options": [
      "Windows 10",
      "macOS",
      "Linux",
      "Chrome OS"
    ],
    "correct_answer": "Linux"
  },
  {
    "question": "Which term describes malicious software designed to disrupt or damage a computer system?",
    "options": [
      "Bug",
      "Root",
      "Malware",
      "Hostware"
    ],
    "correct_answer": "Malware"
  },
  {
    "question": "What kind of security measure converts plain text into an unreadable format?",
    "options": [
      "Decryption",
      "Encryption",
      "Firewalling",
      "Compression"
    ],
    "correct_answer": "Encryption"
  },
  {
    "question": "What does HTTP stand for?",
    "options": [
      "Hidden Transfer Text Protocol",
      "Hypertext Transfer Protocol",
      "Hyperlink Text Transmission Process",
      "Hyperlink Text Transfer Program"
    ],
    "correct_answer": "Hypertext Transfer Protocol"
  },
  {
    "question": "Which type of software allows the user to perform tasks such as writing documents and creating spreadsheets?",
    "options": [
      "Financial software",
      "Utility software",
      "Application software",
      "Firmware"
    ],
    "correct_answer": "Application software"
  },
  {
    "question": "Data in RAM is considered:",
    "options": [
      "Permanent storage",
      "Volatile memory",
      "Fully encrypted",
      "Optical memory"
    ],
    "correct_answer": "Volatile memory"
  },
  {
    "question": "Which programming paradigm focuses on objects that contain data and methods?",
    "options": [
      "Functional Programming",
      "Procedural Programming",
      "Object-Oriented Programming (OOP)",
      "Declarative Programming"
    ],
    "correct_answer": "Object-Oriented Programming (OOP)"
  },
  {
    "question": "Which technology uses distributed ledger to record transactions securely?",
    "options": [
      "Blockchain",
      "FTP",
      "Virtual Reality",
      "DNS"
    ],
    "correct_answer": "Blockchain"
  }
];
load_data(question_data);