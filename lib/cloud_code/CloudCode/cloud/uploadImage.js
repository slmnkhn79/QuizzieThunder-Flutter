const AWS = require('aws-sdk');
require('dotenv').config();
const s3 = new AWS.S3({
  accessKeyId: process.env.accessKeyId,
  secretAccessKey:  process.env.secretAccessKey,
  region: process.env.region,
});

const uploadImage = async (request) =>{
  const { base64, fileName , quizId} = request.params;
  const User = request.user;

  const buffer = Buffer.from(base64, 'base64');
  const params = {
    Bucket: 'academy-v1',
    Key: 'quiz_upload/'+fileName,
    Body: buffer,
    ContentEncoding: 'base64',
    ContentType: 'image/jpeg' // Adjust the content type based on your image type
  };
  
    const data = await s3.upload(params).promise();
    const imageUrl = data.Location;

    const Quiz = new Parse.Object('Quiz');
    Quiz.id = quizId;
    
    const Answered = Parse.Object.extend('Answered');
    const answered = new Answered();
    answered.set('ans_map', {'imageUrl':imageUrl});
    answered.set('quiz',Quiz);
    answered.set('user',User )
  
    var result = await answered.save(null,{useMasterKey:true});
    return {
      code: 200,
      status:true,
      message: "file successfully uploaded",
      data : {
          'hasAttempted' : true,
          'imageUrl': imageUrl
      }
    }
};

const likeQuizPhoto = async (request)=>{
  const {photoId} = request.params;
  const User = request.user;
  const Answered = new Parse.Query("Answered");
  const curObject = await Answered.get(photoId,{useMasterKey:true});
  // console.log("curObject",curObject);
  
  const AnsweredLike = new Parse.Query("AnsweredLike");
  AnsweredLike.equalTo('user',User);
  AnsweredLike.equalTo('answered',curObject);
  const isLike = await AnsweredLike.first({useMasterKey:true});
  // console.log("isLike",isLike)
  
  if(!isLike){
    const AddLike = new Parse.Object("AnsweredLike");
    AddLike.set('user',User);
    AddLike.set('answered',curObject);

    
    const AddLikeACL = new Parse.ACL();
    AddLikeACL.setPublicReadAccess(true);
    AddLikeACL.setPublicWriteAccess(false);
    AddLikeACL.setWriteAccess(User,true);
    AddLike.setACL(AddLikeACL);
    
    const addLikeResult = await AddLike.save(null, {useMasterKey:true});
    // console.log("addLikeResult",addLikeResult)
    
    if(addLikeResult){
    const relation = curObject.relation("like");
    relation.add(addLikeResult);
    const isLikeSaved = await curObject.save(null,{useMasterKey:true});
      if(isLikeSaved){
        // console.log(isLikeSaved)
      return {
        code:200,
        status : true,
        message : "Liked"
      }
      }
    }
  }
}
const dislikeQuizPhoto = async (request) =>{
  const {photoId} = request.params;
  const User = request.user;

  //find the answer to like
  const Answered = new Parse.Query("Answered");
  const curObject =await Answered.get(photoId,{useMasterKey:true});
  // console.log('curObject',curObject)

  //find the like to delete
  const AnsweredLike = new Parse.Query("AnsweredLike");
  AnsweredLike.equalTo('user',User);
  AnsweredLike.equalTo('answered',curObject);
  const isLike = await AnsweredLike.first({useMasterKey:true});
  // console.log('isLike',isLike)
  
  if(isLike){
    const relation = curObject.relation("like");
    relation.remove(isLike);
    const isUnlikeSaved = await curObject.save(null,{useMasterKey:true});
    // console.log('isUnlikeSaved',isUnlikeSaved);
    if(isUnlikeSaved){
    const destroyed = await isLike.destroy({useMasterKey:true});
    console.log('destroyed',destroyed);
    if(destroyed){
      return {
        code:200,
        status : true,
        message : "Unliked"
      }
      }
    }
    }
  };
module.exports = {
  uploadImage,
  likeQuizPhoto,
  dislikeQuizPhoto
};
