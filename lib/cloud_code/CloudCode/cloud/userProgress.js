 const createUserProgress = async (request) =>{
   const {courseId, milestoneId, moduleId} = request.params;
   const USER = request.user;

   if(!courseId || !moduleId || !milestoneId) {
     return {
       code:400,
       status: false,
       message:"Missing values"
     }
   }
   const Course = new Parse.Query("Course");
   const courseObject = await Course.get(courseId,{useMasterkey:true});
   if(!courseObject){
      return {
       code:400,
       status: false,
       message:"Invalid Course Id"
     }
   }
   const Module = new Parse.Query("Module");
   const moduleObject = await Module.get(moduleId,{useMasterkey:true});
   if(!moduleObject){
      return {
       code:400,
       status: false,
       message:"Invalid Module Id"
     }
   }

   const Milestone= new Parse.Query("Milestone");
   const milestoneObject = await Milestone.get(milestoneId,{useMasterKey:true});
   if(!milestoneObject){
      return {
       code:400,
       status: false,
       message:"Invalid Milestone Id"
     }
   }

   const UserProgressQuery= new Parse.Query("UserProgress");
   UserProgressQuery.equalTo('course',courseObject);
   UserProgressQuery.equalTo('completedModules',moduleObject);
   UserProgressQuery.equalTo('user',USER)
   const isCompleted = await UserProgressQuery.first({useMasterKey:true});
     if(!isCompleted){
   
   const UserProgress = new Parse.Object('UserProgress');
   UserProgress.set('course',courseObject);
   UserProgress.relation('completedModules').add(moduleObject);
   UserProgress.set('rewardPoints', milestoneObject.get('rewardPoints'));
   UserProgress.relation('milestonesAchieved').add(milestoneObject);
   UserProgress.set('user',USER);

   const UserProgressResult = await UserProgress.save(null,{useMasterKey:true});
   console.log(UserProgressResult);
       
   return (
  {
    code: '200' ,
    status : 'true' ,
    message: "",
    userProgress : [{
        id: UserProgressResult.id,
        createdAt: UserProgressResult.get('createdAt').toJSON(),
        updatedAt: UserProgressResult.get('updatedAt').toJSON(),
        user: UserProgressResult.get('user').id,
        currentModule: UserProgressResult.get('currentModule'),
        rewardPoint :  UserProgressResult.get('rewardPoints')
    }]
  });
     }
 };
const getUserProgress = async (request) =>{
  const {courseId} = request.params;

  const UserProgress = new Parse.Object('UserProgress');
  const UserProgressQuery = new Parse.Query(UserProgress);
  UserProgressQuery.include('user')
  if(courseId){
    const Course = new Parse.Object("Course");
    Course.id = courseId;
    UserProgressQuery.equalTo('course',Course);
  }
  const userProgress = await UserProgressQuery.find({useMasterKey:true});
  return (
  {
    code: '200' ,
    status : 'true' ,
    message: "",
    userProgress :userProgress.map((u)=>{
      return{
        id:u.id,
        createdAt: u.get('createdAt').toJSON(),
        updatedAt: u.get('updatedAt').toJSON(),
        user: u.get('user').id,
        currentModule: u.get('currentModule'),
        rewardPoint :  u.get('rewardPoints')
      }
      })
    
  })
};
module.exports = {
  createUserProgress,
  getUserProgress
  
}