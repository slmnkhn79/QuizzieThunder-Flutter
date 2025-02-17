
const Parse = require('parse/node');



// Parse.initialize("myappID", "mymasterKey");
Parse.initialize(Parse.applicationId = "ihzu049k4lkpefeqFXYxwCn6kuo7qph3scKcq1sE", javaScriptKey = "zggqV0XYpXvBSE6hYidabBVK6ulCBujgGlscMT4t", masterKey = "984yh9uosBGDkVpj5bCEGdnWMSI2Kty6LXHOKkWJ");
Parse.serverURL = 'https://parseapi.back4app.com/parse';
// Parse.setAsyncStorage(AsyncLocalStorage);
// Parse.user
const Question = Parse.Object.extend("Question");

const Quiz = Parse.Object.extend("Quiz");
const _quiz = new Quiz()
_quiz.id = 'LknqtdhTDb';


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
      .set('question_category', 'emotional_intelligence')
      .setACL(acl)
      ;
    list_data.push(_questions)
    // break;
  }
  try {

    // console.log(list_data[0].get('correct_answer'));
    Parse.Object.saveAll(list_data, { useMasterKey: true }).then(() => {
      console.log('save batch:-', data.length);
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
      "question": "Which of the following best describes Emotional Intelligence?",
      "options": [
          "Ability to understand and manage emotions",
          "Skill in solving complex math problems",
          "Physical fitness and endurance",
          "Knowing random historical facts"
      ],
      "correct_answer": "Ability to understand and manage emotions"
  },
  {
      "question": "Which component of Emotional Intelligence involves recognizing your own feelings accurately?",
      "options": [
          "Self-awareness",
          "Motivation",
          "Empathy",
          "Social skills"
      ],
      "correct_answer": "Self-awareness"
  },
  {
      "question": "What does empathy primarily mean in the context of Emotional Intelligence?",
      "options": [
          "Feeling sorry for others",
          "Understanding and sharing the feelings of another",
          "Arguing effectively in debates",
          "Hiding your own emotions to fit in"
      ],
      "correct_answer": "Understanding and sharing the feelings of another"
  },
  {
      "question": "Which term describes the ability to keep impulsive emotions and behavior under control?",
      "options": [
          "Self-awareness",
          "Self-regulation",
          "Empathy",
          "Assertiveness"
      ],
      "correct_answer": "Self-regulation"
  },
  {
      "question": "What is a sign of good self-awareness?",
      "options": [
          "Blaming others for your mistakes",
          "Having a clear idea of your strengths and weaknesses",
          "Ignoring feelings in difficult situations",
          "Refusing to ask for help"
      ],
      "correct_answer": "Having a clear idea of your strengths and weaknesses"
  },
  {
      "question": "What is a benefit of developing Emotional Intelligence in school?",
      "options": [
          "Higher emotional outbursts",
          "Better academic performance and teamwork",
          "Less interest in helping classmates",
          "Reduced focus on personal goals"
      ],
      "correct_answer": "Better academic performance and teamwork"
  },
  {
      "question": "How does self-regulation help in group projects?",
      "options": [
          "By allowing unchecked anger",
          "By promoting better communication and cooperation",
          "By ignoring others’ ideas",
          "By encouraging constant competition among teammates"
      ],
      "correct_answer": "By promoting better communication and cooperation"
  },
  {
      "question": "Which of the following behaviors reflects empathy?",
      "options": [
          "Interrupting someone to share your own story",
          "Offering help when you notice someone is upset",
          "Ignoring others' feelings intentionally",
          "Criticizing others without understanding their point of view"
      ],
      "correct_answer": "Offering help when you notice someone is upset"
  },
  {
      "question": "Which component of Emotional Intelligence helps you stay positive and pursue goals despite challenges?",
      "options": [
          "Relationship management",
          "Motivation",
          "Self-regulation",
          "Empathy"
      ],
      "correct_answer": "Motivation"
  },
  {
      "question": "Which is an example of using social skills effectively?",
      "options": [
          "Not listening to teammates during a discussion",
          "Ignoring conflict so it escalates",
          "Encouraging others to share their ideas and resolving disputes fairly",
          "Taking credit for others’ work"
      ],
      "correct_answer": "Encouraging others to share their ideas and resolving disputes fairly"
  },
  {
      "question": "How does Emotional Intelligence help in resolving conflicts?",
      "options": [
          "By avoiding any conversation regarding disagreements",
          "By recognizing emotions and communicating respectfully",
          "By shouting to assert dominance",
          "By placing blame on one person"
      ],
      "correct_answer": "By recognizing emotions and communicating respectfully"
  },
  {
      "question": "What is an example of self-motivation in a student’s life?",
      "options": [
          "Quitting at the first sign of difficulty",
          "Waiting for others to push you to do tasks",
          "Setting goals and working towards them persistently",
          "Avoiding all forms of responsibility"
      ],
      "correct_answer": "Setting goals and working towards them persistently"
  },
  {
      "question": "Which of the following statements about Emotional Intelligence is correct?",
      "options": [
          "It is fixed and cannot be improved",
          "It only focuses on self-awareness",
          "It involves understanding your own emotions, as well as others’",
          "It is not important in daily life"
      ],
      "correct_answer": "It involves understanding your own emotions, as well as others’"
  },
  {
      "question": "Which term refers to the ability to handle relationships and build networks?",
      "options": [
          "Social skills",
          "Assertiveness",
          "Self-regulation",
          "Self-awareness"
      ],
      "correct_answer": "Social skills"
  },
  {
      "question": "Why is empathy important in peer relationships?",
      "options": [
          "It helps you ignore other people’s emotions",
          "It allows you to manipulate friends easily",
          "It helps you understand and support others’ feelings",
          "It encourages you to always argue for your viewpoint"
      ],
      "correct_answer": "It helps you understand and support others’ feelings"
  },
  {
      "question": "Which action shows good self-regulation after making a mistake in class?",
      "options": [
          "Blaming a classmate for the error",
          "Becoming angry and shouting",
          "Accepting responsibility and working to fix the mistake",
          "Pretending no mistake was made"
      ],
      "correct_answer": "Accepting responsibility and working to fix the mistake"
  },
  {
      "question": "How can being aware of others’ emotions help in a team activity?",
      "options": [
          "Preventing you from listening to others",
          "Leading to more arguments",
          "Strengthening understanding and cooperation",
          "Encouraging you to complete all tasks alone"
      ],
      "correct_answer": "Strengthening understanding and cooperation"
  },
  {
      "question": "Which of these is an example of negative self-talk?",
      "options": [
          "I'm learning from my mistakes",
          "I will improve step by step",
          "I'm terrible at everything and there's no point trying",
          "Next time, I'll do better"
      ],
      "correct_answer": "I'm terrible at everything and there's no point trying"
  },
  {
      "question": "What is one way to develop better Emotional Intelligence?",
      "options": [
          "Ignore your emotions and focus only on tasks",
          "Learn to identify and label your feelings",
          "React immediately to every emotional trigger",
          "Blame your environment for your reactions"
      ],
      "correct_answer": "Learn to identify and label your feelings"
  },
  {
      "question": "Which behavior shows motivation in the face of a challenging assignment?",
      "options": [
          "Giving up when it seems hard",
          "Copying from a friend instead of trying",
          "Breaking the assignment into smaller tasks and persisting",
          "Skipping classes to avoid the assignment"
      ],
      "correct_answer": "Breaking the assignment into smaller tasks and persisting"
  },
  {
      "question": "How does empathy improve communication?",
      "options": [
          "By making people argue more",
          "By focusing only on one’s own needs",
          "By understanding others’ perspectives and responding kindly",
          "By promoting misunderstandings"
      ],
      "correct_answer": "By understanding others’ perspectives and responding kindly"
  },
  {
      "question": "Which of the following is a healthy way to cope with strong emotions?",
      "options": [
          "Bottling up emotions until you burst",
          "Taking a moment to reflect and then expressing them calmly",
          "Blaming others immediately for how you feel",
          "Hiding away from everyone"
      ],
      "correct_answer": "Taking a moment to reflect and then expressing them calmly"
  },
  {
      "question": "Why is self-awareness important for Emotional Intelligence?",
      "options": [
          "It helps you ignore your flaws",
          "It makes you more defensive about your mistakes",
          "It is the first step in recognizing how emotions affect your behavior",
          "It guarantees you will never feel sad"
      ],
      "correct_answer": "It is the first step in recognizing how emotions affect your behavior"
  },
  {
      "question": "Which of the following demonstrates good social skills?",
      "options": [
          "Avoiding group projects entirely",
          "Encouraging open discussion and handling disagreements calmly",
          "Interrupting others constantly",
          "Refusing to communicate during problem-solving"
      ],
      "correct_answer": "Encouraging open discussion and handling disagreements calmly"
  },
  {
      "question": "How does motivation contribute to Emotional Intelligence?",
      "options": [
          "It makes people only focus on themselves",
          "It drives a person to set and pursue goals despite challenges",
          "It discourages collaboration",
          "It leads to constant frustration"
      ],
      "correct_answer": "It drives a person to set and pursue goals despite challenges"
  },
  {
      "question": "Which of these is NOT a key component of Emotional Intelligence?",
      "options": [
          "Self-awareness",
          "Empathy",
          "Physical strength",
          "Social skills"
      ],
      "correct_answer": "Physical strength"
  },
  {
      "question": "Which phrase highlights empathy for a friend who is upset?",
      "options": [
          "\"You should just get over it; it’s not a big deal.\"",
          "\"I understand this must be tough. How can I help?\"",
          "\"You’re making too much noise. Quiet down.\"",
          "\"Don’t tell me about your problems; I have my own.\""
      ],
      "correct_answer": "\"I understand this must be tough. How can I help?\""
  },
  {
      "question": "When you are emotionally intelligent, how are you likely to handle criticism?",
      "options": [
          "By ignoring the other person entirely",
          "By listening carefully and looking for ways to improve",
          "By shouting back louder",
          "By blaming external factors for your mistakes"
      ],
      "correct_answer": "By listening carefully and looking for ways to improve"
  },
  {
      "question": "What is the best way to calm yourself when you feel stressed or angry?",
      "options": [
          "React immediately without thinking",
          "Practice deep breathing or quietly count to ten",
          "Yell at the nearest person",
          "Pretend you never feel stressed"
      ],
      "correct_answer": "Practice deep breathing or quietly count to ten"
  },
  {
      "question": "Which is an example of showing empathy to a classmate who failed a test?",
      "options": [
          "Mocking them for their poor performance",
          "Saying, \"I know you worked hard, it must be disappointing. Let's study together next time.\"",
          "Telling them to keep quiet about it",
          "Bragging about your own success"
      ],
      "correct_answer": "Saying, \"I know you worked hard, it must be disappointing. Let's study together next time.\""
  },
  {
      "question": "What is emotional intelligence?",
      "options": [
          "The ability to ignore emotions",
          "The ability to understand and manage your own emotions and those of others",
          "The ability to suppress emotions",
          "The ability to avoid emotional situations"
      ],
      "correct_answer": "The ability to understand and manage your own emotions and those of others"
  },
  {
      "question": "Which of the following is a key component of emotional intelligence?",
      "options": [
          "Ignoring others' feelings",
          "Self-awareness",
          "Avoiding social interactions",
          "Being indifferent to emotions"
      ],
      "correct_answer": "Self-awareness"
  },
  {
      "question": "How can self-awareness help in emotional intelligence?",
      "options": [
          "By ignoring your emotions",
          "By understanding your strengths and weaknesses",
          "By avoiding self-reflection",
          "By suppressing your feelings"
      ],
      "correct_answer": "By understanding your strengths and weaknesses"
  },
  {
      "question": "What is empathy?",
      "options": [
          "Ignoring others' emotions",
          "Understanding and sharing the feelings of others",
          "Being indifferent to others' problems",
          "Avoiding emotional connections"
      ],
      "correct_answer": "Understanding and sharing the feelings of others"
  },
  {
      "question": "How can empathy improve relationships?",
      "options": [
          "By making others feel understood and valued",
          "By ignoring others' feelings",
          "By avoiding communication",
          "By being indifferent to others' emotions"
      ],
      "correct_answer": "By making others feel understood and valued"
  },
  {
      "question": "What is the role of self-regulation in emotional intelligence?",
      "options": [
          "To act on impulses without thinking",
          "To manage and control your emotions effectively",
          "To ignore your emotions",
          "To avoid emotional situations"
      ],
      "correct_answer": "To manage and control your emotions effectively"
  },
  {
      "question": "How can self-regulation help in stressful situations?",
      "options": [
          "By reacting impulsively",
          "By staying calm and thinking clearly",
          "By ignoring the situation",
          "By avoiding responsibility"
      ],
      "correct_answer": "By staying calm and thinking clearly"
  },
  {
      "question": "What is social awareness in emotional intelligence?",
      "options": [
          "Ignoring social cues",
          "Understanding and responding to the emotions of others",
          "Avoiding social interactions",
          "Being indifferent to others' feelings"
      ],
      "correct_answer": "Understanding and responding to the emotions of others"
  },
  {
      "question": "How can social awareness improve teamwork?",
      "options": [
          "By ignoring team members' emotions",
          "By understanding and respecting team members' feelings",
          "By avoiding communication",
          "By being indifferent to team dynamics"
      ],
      "correct_answer": "By understanding and respecting team members' feelings"
  },
  {
      "question": "What is relationship management in emotional intelligence?",
      "options": [
          "Ignoring relationships",
          "Building and maintaining healthy relationships",
          "Avoiding emotional connections",
          "Being indifferent to others' feelings"
      ],
      "correct_answer": "Building and maintaining healthy relationships"
  },
  {
      "question": "How can relationship management help in resolving conflicts?",
      "options": [
          "By avoiding conflicts",
          "By communicating effectively and finding solutions",
          "By ignoring others' perspectives",
          "By being indifferent to the conflict"
      ],
      "correct_answer": "By communicating effectively and finding solutions"
  },
  {
      "question": "What is the importance of emotional intelligence in leadership?",
      "options": [
          "To ignore team members' emotions",
          "To understand and motivate team members effectively",
          "To avoid responsibility",
          "To be indifferent to team dynamics"
      ],
      "correct_answer": "To understand and motivate team members effectively"
  },
  {
      "question": "How can emotional intelligence help in academic performance?",
      "options": [
          "By ignoring stress and pressure",
          "By managing stress and staying focused",
          "By avoiding challenges",
          "By being indifferent to academic goals"
      ],
      "correct_answer": "By managing stress and staying focused"
  },
  {
      "question": "What is the role of emotional intelligence in decision-making?",
      "options": [
          "To make impulsive decisions",
          "To consider emotions and think rationally",
          "To ignore emotions",
          "To avoid making decisions"
      ],
      "correct_answer": "To consider emotions and think rationally"
  },
  {
      "question": "How can emotional intelligence improve communication?",
      "options": [
          "By ignoring others' feelings",
          "By understanding and responding to emotions effectively",
          "By avoiding conversations",
          "By being indifferent to others' perspectives"
      ],
      "correct_answer": "By understanding and responding to emotions effectively"
  },
  {
      "question": "What is the impact of emotional intelligence on mental health?",
      "options": [
          "To ignore mental health issues",
          "To manage emotions and reduce stress",
          "To avoid seeking help",
          "To be indifferent to mental health"
      ],
      "correct_answer": "To manage emotions and reduce stress"
  },
  {
      "question": "How can emotional intelligence help in building resilience?",
      "options": [
          "By avoiding challenges",
          "By managing emotions and bouncing back from setbacks",
          "By ignoring failures",
          "By being indifferent to difficulties"
      ],
      "correct_answer": "By managing emotions and bouncing back from setbacks"
  },
  {
      "question": "What is the role of emotional intelligence in peer pressure?",
      "options": [
          "To give in to peer pressure",
          "To understand and resist negative peer pressure",
          "To ignore peer pressure",
          "To be indifferent to peers' opinions"
      ],
      "correct_answer": "To understand and resist negative peer pressure"
  },
  {
      "question": "How can emotional intelligence help in building self-confidence?",
      "options": [
          "By ignoring your strengths",
          "By understanding and valuing your abilities",
          "By avoiding challenges",
          "By being indifferent to self-improvement"
      ],
      "correct_answer": "By understanding and valuing your abilities"
  },
  {
      "question": "What is the importance of emotional intelligence in friendships?",
      "options": [
          "To ignore friends' feelings",
          "To understand and support friends emotionally",
          "To avoid emotional connections",
          "To be indifferent to friends' problems"
      ],
      "correct_answer": "To understand and support friends emotionally"
  },
  {
      "question": "How can emotional intelligence help in dealing with failure?",
      "options": [
          "By ignoring failures",
          "By learning from failures and moving forward",
          "By avoiding challenges",
          "By being indifferent to failures"
      ],
      "correct_answer": "By learning from failures and moving forward"
  },
  {
      "question": "What is the role of emotional intelligence in anger management?",
      "options": [
          "To react impulsively",
          "To understand and control anger effectively",
          "To ignore anger",
          "To avoid situations that cause anger"
      ],
      "correct_answer": "To understand and control anger effectively"
  },
  {
      "question": "How can emotional intelligence help in building trust?",
      "options": [
          "By ignoring others' feelings",
          "By being honest and understanding others' emotions",
          "By avoiding communication",
          "By being indifferent to trust"
      ],
      "correct_answer": "By being honest and understanding others' emotions"
  },
  {
      "question": "What is the impact of emotional intelligence on personal growth?",
      "options": [
          "To ignore personal development",
          "To understand and improve yourself continuously",
          "To avoid challenges",
          "To be indifferent to self-improvement"
      ],
      "correct_answer": "To understand and improve yourself continuously"
  },
  {
      "question": "How can emotional intelligence help in handling criticism?",
      "options": [
          "By ignoring criticism",
          "By understanding and learning from constructive criticism",
          "By avoiding feedback",
          "By being indifferent to others' opinions"
      ],
      "correct_answer": "By understanding and learning from constructive criticism"
  },
  {
      "question": "What is the role of emotional intelligence in gratitude?",
      "options": [
          "To ignore gratitude",
          "To appreciate and express gratitude effectively",
          "To avoid expressing emotions",
          "To be indifferent to others' kindness"
      ],
      "correct_answer": "To appreciate and express gratitude effectively"
  },
  {
      "question": "How can emotional intelligence help in building positive habits?",
      "options": [
          "By ignoring habits",
          "By understanding and developing positive habits",
          "By avoiding self-discipline",
          "By being indifferent to personal growth"
      ],
      "correct_answer": "By understanding and developing positive habits"
  },
  {
      "question": "What is the importance of emotional intelligence in conflict resolution?",
      "options": [
          "To ignore conflicts",
          "To understand and resolve conflicts effectively",
          "To avoid communication",
          "To be indifferent to conflicts"
      ],
      "correct_answer": "To understand and resolve conflicts effectively"
  },
  {
      "question": "How can emotional intelligence help in achieving goals?",
      "options": [
          "By ignoring goals",
          "By staying motivated and managing setbacks",
          "By avoiding challenges",
          "By being indifferent to success"
      ],
      "correct_answer": "By staying motivated and managing setbacks"
  }
]

load_data(question_data);