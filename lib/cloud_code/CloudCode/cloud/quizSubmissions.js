 const getSubmission = async (request) =>{
     const {quizId, skip} = request.params;
   
   const User = request.user;
   if(!quizId){
     return {
       code: 500, status : false, message:"No quiz id found"
     }
   }
   if(!User){
     return {
       code: 500, status : false, message:"No user found"
     }
   }
  

   // const Quiz = new Parse.Object("Quiz");
   // Quiz.id = quizId;


   const QuizQuery = new Parse.Query("Quiz");
   QuizQuery.include('quiz_type');
   const QuizObject =  await QuizQuery.get(quizId,{useMasterKey:true});
   const QUIZ_TYPE = QuizObject.get('quiz_type').get('type_id');
   if(QUIZ_TYPE == 'photo_1'){
   
  const Answered = new Parse.Object("Answered");
  const allAsweredQuery = new Parse.Query(Answered);
  allAsweredQuery.include('like')
  allAsweredQuery.equalTo("quiz",QuizObject);
  allAsweredQuery.skip(skip ?? 0);
  allAsweredQuery.limit(9);
  const allResult = await allAsweredQuery.find({useMasterKey:true});
  

   const selfAnsweredQuery = new Parse.Query(Answered);
   selfAnsweredQuery.equalTo('quiz',QuizObject);
   selfAnsweredQuery.equalTo('user',User);
   const selfResult = await selfAnsweredQuery.first();

   return {
     code: 200,
     status : true,
     message: "",
     data:{
       'allResults' : await Promise.all( allResult.map( async (e)=>{
        const AnsweredLikeQuery = new Parse.Query("AnsweredLike");
        AnsweredLikeQuery.equalTo('user',User);
        AnsweredLikeQuery.equalTo('answered',e);
        const isLiked = await AnsweredLikeQuery.first({useMasterKey:true});
         
         
         return {
         id: e.id,
        'imageUrl' : e.get('ans_map')['imageUrl'],
        'isLiked' :  isLiked ? true :false
        
       }
       })),
    'self': selfResult != null ? {
      id:selfResult.id,
      imageUrl : selfResult.get('ans_map')['imageUrl']
      
    }: null
     }
   }
   }
   else
   {
      
     return {
     code: 200,
     status : true,
     message: "",
     data:{
       // 'allResults' : allResult.map((e)=>{
       //   return {
       //   id: e.id,
       //  'imageUrl' : e.get('ans_map')['imageUrl']
       // }
       // }),
       //  'self': selfResult != null ? {
       //    id:selfResult.id,
       //    imageUrl : e.get('ans_map')['imageUrl']
          
       //  }: null
     }
   }
   }
 };
module.exports = {
  getSubmission,
};