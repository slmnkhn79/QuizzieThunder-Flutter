const {validateUser} = require('./userValidation.js');

const updateStreak =  async (request,activity) => {
  
  try{
    
    const User = request.user;
  // const userId = request.params.userId;
  // userId = User.id;
  // const activity = request.params.activity;

  const query = new Parse.Query("UserStreak");
  query.equalTo("user", User);
  // query.equalTo("activity", activity);
  query.descending('updatedAt')
  const streak = await query.first({ useMasterKey: true });

  const now = new Date();
  if (streak) {
    const lastCompleted = streak.get("lastCompleted");
    const diffDays = Math.floor((now - lastCompleted) / (1000 * 60 * 60 * 24));

    if (diffDays === 1) {
      streak.increment("streakCount");
    } else if (diffDays > 1) {
      streak.set("streakCount", 1);
    }
    streak.set("lastCompleted", now);
    await streak.save(null, { useMasterKey: true });
  } else {
    const newStreak = new Parse.Object("Streak");
    newStreak.set("userId", userId);
    newStreak.set("activity", activity);
    newStreak.set("lastCompleted", now);
    newStreak.set("streakCount", 1);
    await newStreak.save(null, { useMasterKey: true });
  }
  }catch(error){
    return {
      code: 500,
      status: false,
      message: "Streak not updated"
    }
  }
}

Parse.Cloud.define("getStreak", async (request) => {
  try{
    await validateUser(request);
  const userId = request.params.userId;
  const activity = request.params.activity;

  const query = new Parse.Query("Streak");
  query.equalTo("userId", userId);
  query.equalTo("activity", activity);
  const streak = await query.first({ useMasterKey: true });

  if (streak) {
    return {
      streakCount: streak.get("streakCount"),
      lastCompleted: streak.get("lastCompleted"),
    };
  } else {
    return { streakCount: 0, lastCompleted: null };
  }
  }catch(error){
    return {'error':error.toString()};
  }
});

module.exports = {
  updateStreak
}