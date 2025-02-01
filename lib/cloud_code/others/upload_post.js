
const Parse = require('parse/node');



Parse.initialize(Parse.applicationId = "ihzu049k4lkpefeqFXYxwCn6kuo7qph3scKcq1sE",javaScriptKey= "zggqV0XYpXvBSE6hYidabBVK6ulCBujgGlscMT4t", masterKey="984yh9uosBGDkVpj5bCEGdnWMSI2Kty6LXHOKkWJ");
Parse.serverURL = 'https://parseapi.back4app.com/parse';
// Parse.setAsyncStorage(AsyncLocalStorage);
// Parse.user


const Posts = Parse.Object.extend("Posts");

function load_data(data) {
    var list_data = [];
    for (const item of data) {

        const _post = new Posts();

        // do stuff with your user

        _post
            .set('caption', item['caption'])
            .set('imageUrl', item['imageUrl'])
            .set('title', item['title'])
            .set('likes', item['likes'])
            ;
        list_data.push(_post)
        // break;
    }
    Parse.Object.saveAll(list_data).then(() => {
        console.log('save batch:-');
    }).catch((err) => {
        console.log('error:-', err.toString());
    });
    // console.log(list_data[2].get('date'));
}

var post_data =
[
    {
        "caption": "First day of school excitement!",
        "imageUrl": "https://images.pexels.com/photos/2340000/pexels-photo-2340000.jpeg",
        "title": "First Day Fun",
        "likes": 120
    },
    {
        "caption": "Learning about history in the classroom.",
        "imageUrl": "https://images.pexels.com/photos/5450000/pexels-photo-5450000.jpeg",
        "title": "History Class",
        "likes": 89
    },
    {
        "caption": "All set for today's science lab.",
        "imageUrl": "https://images.pexels.com/photos/8970000/pexels-photo-8970000.jpeg",
        "title": "Science Experiment",
        "likes": 200
    },
    {
        "caption": "Creative artwork on display!",
        "imageUrl": "https://cdn.pixabay.com/photo/2017/02/01/00/32/pencil-2021192_1280.jpg",
        "title": "Art Class",
        "likes": 75
    },
    {
        "caption": "Outdoor learning day!",
        "imageUrl": "https://images.pexels.com/photos/6780000/pexels-photo-6780000.jpeg",
        "title": "Learning Outside",
        "likes": 150
    },
    {
        "caption": "Math drills with classmates.",
        "imageUrl": "https://images.pexels.com/photos/2560000/pexels-photo-2560000.jpeg",
        "title": "Math Practice",
        "likes": 95
    },
    {
        "caption": "Ready for music practice!",
        "imageUrl": "https://images.pexels.com/photos/3140000/pexels-photo-3140000.jpeg",
        "title": "Music Class",
        "likes": 104
    },
    {
        "caption": "Learning about the solar system.",
        "imageUrl": "https://images.pexels.com/photos/3450000/pexels-photo-3450000.jpeg",
        "title": "Astronomy",
        "likes": 300
    },
    {
        "caption": "Library study sessions with friends.",
        "imageUrl": "https://cdn.pixabay.com/photo/2016/11/29/09/08/library-1862098_1280.jpg",
        "title": "Library Time",
        "likes": 187
    },
    {
        "caption": "Colorful artwork by talented students!",
        "imageUrl": "https://cdn.pixabay.com/photo/2015/09/05/22/35/child-925910_1280.jpg",
        "title": "Student Art Display",
        "likes": 92
    },
    {
        "caption": "School buses ready for a new day.",
        "imageUrl": "https://images.pexels.com/photos/1590000/pexels-photo-1590000.jpeg",
        "title": "Bus Stop",
        "likes": 213
    },
    {
        "caption": "Solving equations like a pro!",
        "imageUrl": "https://cdn.pixabay.com/photo/2016/02/17/20/51/mathematics-1206806_1280.jpg",
        "title": "Math Skills",
        "likes": 135
    },
    {
        "caption": "School playground during recess.",
        "imageUrl": "https://images.pexels.com/photos/8910000/pexels-photo-8910000.jpeg",
        "title": "Playground Fun",
        "likes": 160
    },
    {
        "caption": "Science lab experiments with friends.",
        "imageUrl": "https://images.pexels.com/photos/6490000/pexels-photo-6490000.jpeg",
        "title": "Lab Work",
        "likes": 245
    },
    {
        "caption": "Reading time in the school library.",
        "imageUrl": "https://images.pexels.com/photos/2610000/pexels-photo-2610000.jpeg",
        "title": "Quiet Library",
        "likes": 89
    },
    {
        "caption": "Music notes filling the room.",
        "imageUrl": "https://cdn.pixabay.com/photo/2015/09/05/22/35/musical-925911_1280.jpg",
        "title": "Music Practice",
        "likes": 123
    },
    {
        "caption": "Exciting gym activities today!",
        "imageUrl": "https://images.pexels.com/photos/3400000/pexels-photo-3400000.jpeg",
        "title": "Gym Class",
        "likes": 110
    },
    {
        "caption": "Painting landscapes with vibrant colors.",
        "imageUrl": "https://cdn.pixabay.com/photo/2016/11/29/09/07/brush-1862097_1280.jpg",
        "title": "Painting Session",
        "likes": 130
    },
    {
        "caption": "Science fair projects on display.",
        "imageUrl": "https://cdn.pixabay.com/photo/2016/11/29/12/49/experiment-1862068_1280.jpg",
        "title": "Science Fair",
        "likes": 167
    },
    {
        "caption": "Exploring history through hands-on projects.",
        "imageUrl": "https://images.pexels.com/photos/3380000/pexels-photo-3380000.jpeg",
        "title": "Hands-on History",
        "likes": 144
    },
    {
        "caption": "After school study group.",
        "imageUrl": "https://images.pexels.com/photos/2380000/pexels-photo-2380000.jpeg",
        "title": "Study Group",
        "likes": 76
    },
    {
        "caption": "Basketball practice with the team!",
        "imageUrl": "https://cdn.pixabay.com/photo/2017/08/02/14/56/basketball-2578294_1280.jpg",
        "title": "Basketball Time",
        "likes": 230
    },
    {
        "caption": "Building teamwork with group activities.",
        "imageUrl": "https://cdn.pixabay.com/photo/2017/02/01/00/32/team-2021214_1280.jpg",
        "title": "Group Activity",
        "likes": 68
    },
    {
        "caption": "Practice makes perfect in sports!",
        "imageUrl": "https://images.pexels.com/photos/3230000/pexels-photo-3230000.jpeg",
        "title": "Sports Practice",
        "likes": 182
    },
    {
        "caption": "Beautiful morning at school.",
        "imageUrl": "https://cdn.pixabay.com/photo/2015/09/05/22/34/school-925903_1280.jpg",
        "title": "Morning School",
        "likes": 190
    },
    {
        "caption": "Let's learn multiplication today!",
        "imageUrl": "https://cdn.pixabay.com/photo/2017/08/30/07/55/board-2699279_1280.jpg",
        "title": "Multiplication Lesson",
        "likes": 97
    }
    // Add remaining items following the same format until you reach 100 entries.
]

;

load_data(post_data);