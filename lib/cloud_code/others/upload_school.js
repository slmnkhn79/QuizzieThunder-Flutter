
const Parse = require('parse/node');



// Parse.initialize("myappID", "mymasterKey");
Parse.initialize(Parse.applicationId = "ihzu049k4lkpefeqFXYxwCn6kuo7qph3scKcq1sE", javaScriptKey = "zggqV0XYpXvBSE6hYidabBVK6ulCBujgGlscMT4t", masterKey = "984yh9uosBGDkVpj5bCEGdnWMSI2Kty6LXHOKkWJ");
Parse.serverURL = 'https://parseapi.back4app.com/parse';
// Parse.setAsyncStorage(AsyncLocalStorage);
// Parse.user
const Question = Parse.Object.extend("Schools");


function load_data(data) {
    var list_data = [];
    for (const item of data) {

        const _questions = new Question();


        // do stuff with your user

        _questions
            .set("school_images", item["school_images"])
            .set("others", item["others"])
            .set("achievements", item["achievements"])
            .set("number_of_students", item["number_of_students"])
            .set("city", item["city"])
            .set("name", item["name"])
            .set("district", item["district"])
            .set("some_other_events_image", item["some_other_events_image"])
            .set("faculty_ratio", item["faculty_ratio"])
            .set("state", item["state"])
            .set("final_image", item["final_image"])
            .set("courses_offered", item["courses_offered"])
            .set("map_location", item["map_location"])
            .set("type", item["type"])
            .set("fee_structure", item["fee_structure"])
            .set("total_facilities", item["total_facilities"])
            .set("campus_life", item["campus_life"])
            .set("description", item["description"])
            .set("alumni", item["alumni"])
            .set("attributes", item["attributes"])

            ;
        list_data.push(_questions)
        // break;
    }
    Parse.Object.saveAll(list_data).then(() => {
        console.log('save batch:-');
    }).catch((err) => {
        console.log('error:-', err.toString());
    });

    // console.log(list_data[2].get('name'));

}

var question_data =
    [
        {
            "objectId": "1a2b3c",
            "createdAt": "2022-03-01T08:00:00Z",
            "updatedAt": "2023-09-12T14:30:00Z",
            "ACL": { "read": "public", "write": "admin" },
            "school_images": [
                "https://images.pexels.com/photos/2340001/pexels-photo-2340001.jpeg",
                "https://images.pexels.com/photos/2340002/pexels-photo-2340002.jpeg"
            ],
            "others": "Partnered with local libraries for student resources",
            "achievements": ["Best STEM Program 2022", "Top Math Scores in District"],
            "number_of_students": 1200,
            "city": "Austin",
            "name": "Austin High School",
            "district": "Austin Independent School District",
            "some_other_events_image": "https://images.pexels.com/photos/2340003/pexels-photo-2340003.jpeg",
            "faculty_ratio": "1:20",
            "state": "TX",
            "final_image": "https://images.pexels.com/photos/2340004/pexels-photo-2340004.jpeg",
            "courses_offered": ["Physics", "Advanced Mathematics", "Chemistry", "World Literature"],
            "map_location": "https://maps.google.com/abcd1234",
            "type": "Public",
            "fee_structure": { "tuition": "free", "books": "variable" },
            "total_facilities": 30,
            "campus_life": "Vibrant campus with a focus on sports and arts",
            "description": "A well-rounded public high school with a focus on STEM and the arts.",
            "alumni": ["Jane Doe - CEO at Tech Innovators", "John Smith - NBA Player"],
            "attributes": ["STEM Focus", "Sports Facilities", "Art Studios"]
        },
        {
            "objectId": "4d5e6f",
            "createdAt": "2021-05-22T10:30:00Z",
            "updatedAt": "2023-01-15T13:45:00Z",
            "ACL": { "read": "public", "write": "admin" },
            "school_images": [
                "https://images.pexels.com/photos/2340010/pexels-photo-2340010.jpeg",
                "https://images.pexels.com/photos/2340011/pexels-photo-2340011.jpeg"
            ],
            "others": "Scholarships for high-achieving students",
            "achievements": ["Green Campus Award 2021"],
            "number_of_students": 800,
            "city": "Seattle",
            "name": "Greenwood Secondary",
            "district": "Seattle Public Schools",
            "some_other_events_image": "https://images.pexels.com/photos/2340012/pexels-photo-2340012.jpeg",
            "faculty_ratio": "1:15",
            "state": "WA",
            "final_image": "https://images.pexels.com/photos/2340013/pexels-photo-2340013.jpeg",
            "courses_offered": ["Environmental Science", "Biology", "Literature"],
            "map_location": "https://maps.google.com/efgh5678",
            "type": "Charter",
            "fee_structure": { "tuition": "variable", "books": "provided" },
            "total_facilities": 18,
            "campus_life": "Small, community-focused with green initiatives",
            "description": "Focused on eco-friendly practices and environmental studies.",
            "alumni": ["Alex Green - Environmental Scientist", "Dana White - Author"],
            "attributes": ["Eco-Friendly", "Community-Oriented", "Small Class Sizes"]
        },
        {
            "objectId": "7g8h9i",
            "createdAt": "2019-09-05T09:20:00Z",
            "updatedAt": "2022-12-11T16:55:00Z",
            "ACL": { "read": "public", "write": "admin" },
            "school_images": [
                "https://images.pexels.com/photos/2340020/pexels-photo-2340020.jpeg",
                "https://images.pexels.com/photos/2340021/pexels-photo-2340021.jpeg"
            ],
            "others": "Partnered with local tech companies for internships",
            "achievements": ["Top Technology Program 2022"],
            "number_of_students": 1500,
            "city": "San Francisco",
            "name": "Tech Future High",
            "district": "SF Unified School District",
            "some_other_events_image": "https://images.pexels.com/photos/2340022/pexels-photo-2340022.jpeg",
            "faculty_ratio": "1:18",
            "state": "CA",
            "final_image": "https://images.pexels.com/photos/2340023/pexels-photo-2340023.jpeg",
            "courses_offered": ["Computer Science", "Engineering", "Digital Arts"],
            "map_location": "https://maps.google.com/ijkl7890",
            "type": "Public",
            "fee_structure": { "tuition": "free", "books": "variable" },
            "total_facilities": 40,
            "campus_life": "Tech-savvy with innovation hubs and workshops",
            "description": "High school with a focus on technology and innovation.",
            "alumni": ["Lily James - CEO of StartUpX", "Tom Reed - CTO of InnovateNow"],
            "attributes": ["Tech Programs", "Innovation Labs", "Large Campus"]
        },
        {
            "objectId": "3j4k5l",
            "createdAt": "2020-01-15T11:45:00Z",
            "updatedAt": "2023-07-30T12:10:00Z",
            "ACL": { "read": "public", "write": "admin" },
            "school_images": [
                "https://images.pexels.com/photos/2340030/pexels-photo-2340030.jpeg",
                "https://images.pexels.com/photos/2340031/pexels-photo-2340031.jpeg"
            ],
            "others": "Focus on bilingual education",
            "achievements": ["Excellence in Language Education 2021"],
            "number_of_students": 950,
            "city": "Miami",
            "name": "Miami Language Academy",
            "district": "Miami-Dade County Public Schools",
            "some_other_events_image": "https://images.pexels.com/photos/2340032/pexels-photo-2340032.jpeg",
            "faculty_ratio": "1:12",
            "state": "FL",
            "final_image": "https://images.pexels.com/photos/2340033/pexels-photo-2340033.jpeg",
            "courses_offered": ["Spanish", "French", "Italian", "Chinese"],
            "map_location": "https://maps.google.com/mnop1234",
            "type": "Magnet",
            "fee_structure": { "tuition": "free", "books": "variable" },
            "total_facilities": 25,
            "campus_life": "Culturally diverse with language clubs and events",
            "description": "A high school dedicated to bilingual and multilingual education.",
            "alumni": ["Carlos Ruiz - Diplomat", "Sophia Kim - Translator"],
            "attributes": ["Bilingual Programs", "Language Labs", "Cultural Exchange"]
        },
        {
            "objectId": "6m7n8o",
            "createdAt": "2018-04-18T15:00:00Z",
            "updatedAt": "2023-05-22T09:30:00Z",
            "ACL": { "read": "public", "write": "admin" },
            "school_images": [
                "https://images.pexels.com/photos/2340040/pexels-photo-2340040.jpeg",
                "https://images.pexels.com/photos/2340041/pexels-photo-2340041.jpeg"
            ],
            "others": "Strong arts and drama program",
            "achievements": ["Best Arts Program in State 2022"],
            "number_of_students": 800,
            "city": "New York City",
            "name": "New York Arts High",
            "district": "New York City Public Schools",
            "some_other_events_image": "https://images.pexels.com/photos/2340042/pexels-photo-2340042.jpeg",
            "faculty_ratio": "1:14",
            "state": "NY",
            "final_image": "https://images.pexels.com/photos/2340043/pexels-photo-2340043.jpeg",
            "courses_offered": ["Theater", "Dance", "Music"],
            "map_location": "https://maps.google.com/mnop1234",
            "type": "Magnet",
            "fee_structure": { "tuition": "free", "books": "variable" },
            "total_facilities": 25,
            "campus_life": "Culturally diverse with language clubs and events",
            "description": "A high school dedicated to bilingual and multilingual education.",
            "alumni": ["Carlos Ruiz - Diplomat", "Sophia Kim - Translator"],
            "attributes": ["Bilingual Programs", "Language Labs", "Cultural Exchange"]
              },
             {
            "objectId": "1a2b3c",
            "createdAt": "2022-03-01T08:00:00Z",
            "updatedAt": "2023-09-12T14:30:00Z",
            "ACL": { "read": "public", "write": "admin" },
            "school_images": [
                "https://images.pexels.com/photos/2340001/pexels-photo-2340001.jpeg",
                "https://images.pexels.com/photos/2340002/pexels-photo-2340002.jpeg"
            ],
            "others": "Partnered with local libraries for student resources",
            "achievements": ["Best STEM Program 2022", "Top Math Scores in District"],
            "number_of_students": 1200,
            "city": "New York",
            "name": "Peter's High School",
            "district": "Austin Independent School District",
            "some_other_events_image": "https://images.pexels.com/photos/2340003/pexels-photo-2340003.jpeg",
            "faculty_ratio": "1:20",
            "state": "TX",
            "final_image": "https://images.pexels.com/photos/2340004/pexels-photo-2340004.jpeg",
            "courses_offered": ["Physics", "Advanced Mathematics", "Chemistry", "World Literature"],
            "map_location": "https://maps.google.com/abcd1234",
            "type": "Public",
            "fee_structure": { "tuition": "free", "books": "variable" },
            "total_facilities": 30,
            "campus_life": "Vibrant campus with a focus on sports and arts",
            "description": "A well-rounded public high school with a focus on STEM and the arts.",
            "alumni": ["Jane Doe - CEO at Tech Innovators", "John Smith - NBA Player"],
            "attributes": ["Bilingual Programs", "Language Labs", "Cultural Exchange"]
        },
        {
            "objectId": "1a2b3c",
            "createdAt": "2022-03-01T08:00:00Z",
            "updatedAt": "2023-09-12T14:30:00Z",
            "ACL": { "read": "public", "write": "admin" },
            "school_images": [
                "https://images.pexels.com/photos/2340001/pexels-photo-2340001.jpeg",
                "https://images.pexels.com/photos/2340002/pexels-photo-2340002.jpeg"
            ],
            "others": "Partnered with local libraries for student resources",
            "achievements": ["Best STEM Program 2022", "Top Math Scores in District"],
            "number_of_students": 1200,
            "city": "New York",
            "name": "Sebastian's High School",
            "district": "Austin Independent School District",
            "some_other_events_image": "https://images.pexels.com/photos/2340003/pexels-photo-2340003.jpeg",
            "faculty_ratio": "1:20",
            "state": "TX",
            "final_image": "https://images.pexels.com/photos/2340004/pexels-photo-2340004.jpeg",
            "courses_offered": ["Physics", "Advanced Mathematics", "Chemistry", "World Literature"],
            "map_location": "https://maps.google.com/abcd1234",
            "type": "Public",
            "fee_structure": { "tuition": "free", "books": "variable" },
            "total_facilities": 30,
            "campus_life": "Vibrant campus with a focus on sports and arts",
            "description": "A well-rounded public high school with a focus on STEM and the arts.",
            "alumni": ["Jane Doe - CEO at Tech Innovators", "John Smith - NBA Player"],
            "attributes": ["Bilingual Programs", "Language Labs", "Cultural Exchange"]
        },
        {
            "objectId": "1a2b3c",
            "createdAt": "2022-03-01T08:00:00Z",
            "updatedAt": "2023-09-12T14:30:00Z",
            "ACL": { "read": "public", "write": "admin" },
            "school_images": [
                "https://images.pexels.com/photos/2340001/pexels-photo-2340001.jpeg",
                "https://images.pexels.com/photos/2340002/pexels-photo-2340002.jpeg"
            ],
            "others": "Partnered with local libraries for student resources",
            "achievements": ["Best STEM Program 2022", "Top Math Scores in District"],
            "number_of_students": 1200,
            "city": "New York",
            "name": "Aunts's High School",
            "district": "Austin Independent School District",
            "some_other_events_image": "https://images.pexels.com/photos/2340003/pexels-photo-2340003.jpeg",
            "faculty_ratio": "1:20",
            "state": "TX",
            "final_image": "https://images.pexels.com/photos/2340004/pexels-photo-2340004.jpeg",
            "courses_offered": ["Physics", "Advanced Mathematics", "Chemistry", "World Literature"],
            "map_location": "https://maps.google.com/abcd1234",
            "type": "Public",
            "fee_structure": { "tuition": "free", "books": "variable" },
            "total_facilities": 30,
            "campus_life": "Vibrant campus with a focus on sports and arts",
            "description": "A well-rounded public high school with a focus on STEM and the arts.",
            "alumni": ["Jane Doe - CEO at Tech Innovators", "John Smith - NBA Player"],
            "attributes": ["Bilingual Programs", "Language Labs", "Cultural Exchange"]
        }
    ];

load_data(question_data);