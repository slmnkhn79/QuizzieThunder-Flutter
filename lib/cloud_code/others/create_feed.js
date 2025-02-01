const Parse = require('parse/node');



Parse.initialize(Parse.applicationId = "ihzu049k4lkpefeqFXYxwCn6kuo7qph3scKcq1sE",javaScriptKey= "zggqV0XYpXvBSE6hYidabBVK6ulCBujgGlscMT4t", masterKey="984yh9uosBGDkVpj5bCEGdnWMSI2Kty6LXHOKkWJ");
Parse.serverURL = 'https://parseapi.back4app.com/parse';



function getPosts (){
    
    const Posts = new Parse.Query("Posts");
    Posts.find().then((data)=>{
        data.map((e)=>{
            const Feed = new Parse.Object("Feed");
            Feed.set('post',e);
            Feed.set('likes',e.get('likes')) 
            Feed.save().then((data2)=>{
                console.log(data2);
            })
        });
        
        
    });
}

console.log(getPosts());