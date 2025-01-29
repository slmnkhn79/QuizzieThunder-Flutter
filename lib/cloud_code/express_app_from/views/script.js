function generateRadioButtons(items, name) {
    return items.map(item => `
        <div class="formbold-radio-group">
            <label class="formbold-radio-label" for="${item.name}">
                <input class="formbold-input-radio" type="checkbox" name="${name}" value="${item.name}" id="${item.name}" />
                ${item.name}
                <span class="formbold-radio-checkmark"></span>
            </label>
        </div>
    `).join('');
}

function filterItems(items, filterInputId, containerId, name) {
    const filterValue = document.getElementById(filterInputId).value.toLowerCase();//lowercoase
    const filteredItems = items.filter(item => item.value.toLowerCase().includes(filterValue.toLowerCase()));
    document.getElementById(containerId).innerHTML = generateRadioButtons(filteredItems, name);
}

function checkPasswords() {
    const password = document.getElementById('password').value;
    const confirmPassword = document.getElementById('confirmPassword').value;
    const message = document.getElementById('message');

    if (password === confirmPassword) {
        message.textContent = 'Passwords match';
        message.className = 'success';
    } else {
        message.textContent = 'Passwords do not match';
        message.className = 'error';
    }
}

document.addEventListener("DOMContentLoaded", function () {
    const form = document.getElementById('signupForm');
    const submitButton = document.getElementById('submitData');
    const errorMessageDiv = document.getElementById('errorMessage');
    const responseMessage = document.getElementById('responseMessage');
    let isValid = true;

    const studentInterests =
        [
            { "name": "Science", "value": "Science" },
            { "name": "Mathematics", "value": "Mathematics" },
            { "name": "Literature", "value": "Literature" },
            { "name": "Art", "value": "Art" },
            { "name": "Music", "value": "Music" },
            { "name": "Sports", "value": "Sports" },
            { "name": "Technology", "value": "Technology" },
            { "name": "History", "value": "History" },
            { "name": "Geography", "value": "Geography" },
            { "name": "Drama", "value": "drama" },
            { "name": "Coding", "value": "coding" },
            { "name": "Debate", "value": "debate" },
            { "name": "Photography", "value": "photography" },
            { "name": "Environmental Studies", "value": "environmentalstudies" },
            { "name": "Robotics", "value": "robotics" },
            { "name": "Astronomy", "value": "astronomy" },
            { "name": "Creative Writing", "value": "creativewriting" },
            { "name": "Chess", "value": "chess" },
            { "name": "Cooking", "value": "cooking" },
            { "name": "Dance", "value": "dance" },
            { "name": "Film Making", "value": "filmmaking" },
            { "name": "Gardening", "value": "gardening" },
            { "name": "Languages", "value": "languages" },
            { "name": "Public Speaking", "value": "publicspeaking" },
            { "name": "Volunteering", "value": "volunteering" },
            { "name": "Yoga", "value": "yoga" },
            { "name": "Meditation", "value": "meditation" },
            { "name": "Hiking", "value": "hiking" },
            { "name": "Traveling", "value": "traveling" },
            { "name": "Bird Watching", "value": "birdwatching" },
            { "name": "Fishing", "value": "fishing" },
            { "name": "Martial Arts", "value": "martialarts" },
            { "name": "Graphic Design", "value": "graphicdesign" },
            { "name": "Video Games", "value": "videogames" },
            { "name": "Blogging", "value": "blogging" },
            { "name": "Podcasting", "value": "podcasting" },
            { "name": "Fashion Design", "value": "fashiondesign" },
            { "name": "Interior Design", "value": "interiordesign" },
            { "name": "Baking", "value": "baking" },
            { "name": "Cycling", "value": "cycling" },
            { "name": "Swimming", "value": "swimming" },
            { "name": "Running", "value": "running" },
            { "name": "Fitness Training", "value": "fitnesstraining" },
            { "name": "Animal Care", "value": "animalcare" },
            { "name": "Community Service", "value": "communityservice" },
            { "name": "Entrepreneurship", "value": "entrepreneurship" },
            { "name": "Investing", "value": "investing" },
            { "name": "Puzzle Solving", "value": "puzzlesolving" },
            { "name": "Board Games", "value": "boardgames" },
            { "name": "Magic Tricks", "value": "magictricks" }
        ];

    const studentSkills = [
        { "name": "Critical Thinking", "value": "criticalthinking" },
        { "name": "Research Skills", "value": "researchskills" },
        { "name": "Reading Comprehension", "value": "readingcomprehension" },
        { "name": "Writing Skills", "value": "writingskills" },
        { "name": "Note-Taking", "value": "notetaking" },
        { "name": "Time Management", "value": "timemanagement" },
        { "name": "Active Listening", "value": "activelistening" },
        { "name": "Presentation Skills", "value": "presentationskills" },
        { "name": "Public Speaking", "value": "publicspeaking" },
        { "name": "Test-Taking Strategies", "value": "testtakingstrategies" },
        { "name": "Problem-Solving", "value": "problemsolving" },
        { "name": "Analytical Thinking", "value": "analyticalthinking" },
        { "name": "Information Literacy", "value": "informationliteracy" },
        { "name": "Digital Literacy", "value": "digitalliteracy" },
        { "name": "Collaboration", "value": "collaboration" },
        { "name": "Communication Skills", "value": "communicationskills" },
        { "name": "Adaptability", "value": "adaptability" },
        { "name": "Flexibility", "value": "flexibility" },
        { "name": "Leadership Skills", "value": "leadershipskills" },
        { "name": "Self-Motivation", "value": "selfmotivation" },
        { "name": "Self-Discipline", "value": "selfdiscipline" },
        { "name": "Resilience", "value": "resilience" },
        { "name": "Stress Management", "value": "stressmanagement" },
        { "name": "Emotional Intelligence", "value": "emotionalintelligence" },
        { "name": "Creativity", "value": "creativity" },
        { "name": "Curiosity", "value": "curiosity" },
        { "name": "Cultural Awareness", "value": "culturalawareness" },
        { "name": "Organization Skills", "value": "organizationskills" },
        { "name": "Goal Setting", "value": "goalsetting" },
        { "name": "Decision Making", "value": "decisionmaking" },
        { "name": "Conflict Resolution", "value": "conflictresolution" },
        { "name": "Negotiation", "value": "negotiation" },
        { "name": "Networking", "value": "networking" },
        { "name": "Financial Literacy", "value": "financialliteracy" },
        { "name": "Coding", "value": "coding" },
        { "name": "Foreign Language Proficiency", "value": "foreignlanguageproficiency" },
        { "name": "Interpersonal Skills", "value": "interpersonalskills" },
        { "name": "Project Management", "value": "projectmanagement" },
        { "name": "Data Analysis", "value": "dataanalysis" },
        { "name": "Data Visualization", "value": "datavisualization" },
        { "name": "Technical Writing", "value": "technicalwriting" },
        { "name": "Social Media Literacy", "value": "socialmedialiteracy" },
        { "name": "Design Thinking", "value": "designthinking" },
        { "name": "Growth Mindset", "value": "growthmindset" },
        { "name": "Continuous Learning", "value": "continuouslearning" },
        { "name": "Mentoring", "value": "mentoring" },
        { "name": "Self-Awareness", "value": "selfawareness" },
        { "name": "Empathy", "value": "empathy" },
        { "name": "Active Learning", "value": "activelearning" },
        { "name": "Experimentation", "value": "experimentation" },
        { "name": "Ethics and Integrity", "value": "ethicsandintegrity" },
        { "name": "Professionalism", "value": "professionalism" },
        { "name": "Attention to Detail", "value": "attentiontodetail" },
        { "name": "Perseverance", "value": "perseverance" },
        { "name": "Problem Diagnosis", "value": "problemdiagnosis" },
        { "name": "Solution Implementation", "value": "solutionimplementation" }
    ];

    function togglePassword() {
        const passwordField = document.getElementById('password');
        const toggleBtn = document.querySelector('.toggle-btn');
        if (passwordField.type === 'password') {
            passwordField.type = 'text';
            toggleBtn.textContent = 'Hide';
        } else {
            passwordField.type = 'password';
            toggleBtn.textContent = 'Show';
        }
    }
    


    document.getElementById('interest-radio-buttons-container').innerHTML = generateRadioButtons(studentInterests, 'interest');
    document.getElementById('skill-radio-buttons-container').innerHTML = generateRadioButtons(studentSkills, 'skill');

    document.getElementById('interest-filter-input').addEventListener('input', () => {
        filterItems(studentInterests, 'interest-filter-input', 'interest-radio-buttons-container', 'interest');
    });

    document.getElementById('skill-filter-input').addEventListener('input', () => {
        filterItems(studentSkills, 'skill-filter-input', 'skill-radio-buttons-container', 'skill');
    });

    function getSelectedSkillsValues() {
        const checkboxes = document.querySelectorAll('input[name="skill"]:checked');
        const selectedValues = Array.from(checkboxes).map(checkbox => checkbox.value);
        // document.getElementById('selectedValues').textContent = 'Selected values: ' + selectedValues.join(', ');
        return selectedValues;
    }
    function getSelectedInterestsValues() {
        const checkboxes = document.querySelectorAll('input[name="interest"]:checked');
        const selectedValues = Array.from(checkboxes).map(checkbox => checkbox.value);
        // document.getElementById('selectedValues').textContent = 'Selected values: ' + selectedValues.join(', ');
        return selectedValues;
    }

    function getExtraSkills(){
        const skillsStr = document.getElementById('other_skills');
        let skillArr = skillsStr.value.split(",");
        return skillArr;
    }
    function getExtraInterest(){
        const interestsStr = document.getElementById('other_interests');
        let interestArr = interestsStr.value.split(",");
        return interestArr;
    }

    function validateForm() {
        isValid = true;
        const fields = [
            { id: 'firstname', errorId: 'firstnameError' },
            { id: 'lastname', errorId: 'lastnameError' },
            { id: 'email', errorId: 'emailError' },
            { id: 'dob', errorId: 'dobError' },
            { id: 'state', errorId: 'cityError' },
            { id: 'country', errorId: 'stateError' },
            { id: 'username', errorId: 'usernameError' },
            { id: 'password', errorId: 'passwordError' },
            { id: 'confirmPassword', errorId: 'confirmPasswordError' },
            { id: 'age', errorId: 'ageError' }
        ];

        fields.forEach(field => {
            const input = document.getElementById(field.id);
            const error = document.getElementById(field.errorId);
            if (!input.value) {
                error.style.display = 'block';
                isValid = false;
            } else {
                error.style.display = 'none';
            }
        });

        const interests = document.getElementsByName('interest');
        const interestsError = document.getElementById('interestError');
        let isInterestSelected = Array.from(interests).some(interest => interest.checked);

        if (!isInterestSelected) {
            interestsError.style.display = 'block';
            isValid = false;
        } else {
            interestsError.style.display = 'none';
        }

        const skills = document.getElementsByName('skill');
        const skillsError = document.getElementById('skillError');
        let isSkillSelected = Array.from(skills).some(skill => skill.checked);

        if (!isSkillSelected) {
            skillsError.style.display = 'block';
            isValid = false;
        } else {
            skillsError.style.display = 'none';
        }

        const interestsStr = document.getElementById('other_interests');
        let interestArr = interestsStr.value.split(",");
        if(interestArr)

        return isValid;
    }

    submitButton.addEventListener('click', (event) => {
        event.preventDefault();
        if (validateForm()) {
            const formData = new FormData(form);
            const jsonObject = {};
            formData.forEach((value, key) => {
                jsonObject[key] = value;
            });

            
            jsonObject["skill"] =  getSelectedSkillsValues() //.concat(getExtraSkills());
            jsonObject["interest"] = getSelectedInterestsValues() //.concat(getExtraInterest());
            jsonObject['standard'] = 'U8GnAJhDxO';
            jsonObject['school'] = 'vtFGpzk5d1';
            jsonObject['demographics'] = 'ycRE7bg2TP';
            jsonObject["other_interests"] = getExtraInterest();
            jsonObject["other_skills"] = getExtraSkills();

            // jsonObject[]
            // jsonObject["skill"].push(getExtraSkills());

            // console.log(jsonObjectx);


            fetch('https://parseapi.back4app.com/parse/functions/signUpData', {
                method: 'POST',
                body: JSON.stringify(jsonObject),
                headers: {
                    'Content-Type': 'application/json',
                    'X-Parse-Application-Id': 'ihzu049k4lkpefeqFXYxwCn6kuo7qph3scKcq1sE',
                    'X-Parse-REST-API-Key': 'Zhql5mJQna2oJ7ztrmSCFyDtVQ4uxmbMYtMjfe9Q'
                },
            })
                .then(response => {
                    if (!response.ok) {
                        throw new Error('Network response was not ok');
                    }
                    return response.json();
                })
                .then(data => {
                    // if(response)
                    console.log(data);
                    if(data.result.code == 400)
                    {
                        responseMessage.textContent = data.result.message;
                    }
                    else if(data.result.code == 200){
                        responseMessage.textContent = data.result.message;
                        form.reset();
                    }
                    
                   
                })
                .catch(error => {
                    console.error('There was a problem submitting the form:', error);
                    responseMessage.textContent = error;
                });
        } else {
            errorMessageDiv.textContent = 'Please fill all the details!';
            errorMessageDiv.style.display = 'block';
        }
    });
});
