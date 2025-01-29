AWS.config.update({
 
});
const s3 = new AWS.S3();

function validateYear() {
    const helpText = document.getElementById('yearValid');
    const yearInput = this.value;
    const currentYear = new Date().getFullYear();
    if (/^\d{4}$/.test(yearInput) && yearInput >= 1900 && yearInput <= currentYear) {
        helpText.textContent = '';
    } else {
        helpText.textContent = 'Please enter a valid year between 1900 and ' + currentYear;
    }
}

function getFormData() {
    const formData = {
        header_image_url: document.getElementById('header_image_url').value,
        school_name: document.getElementById('school_name').value,
        year: document.getElementById('year').value,
        photo1_url: document.getElementById('photo1_url').value,
        photo2_url: document.getElementById('photo2_url').value,
        videoId: document.getElementById('videoId').value,
        videoCaption: document.getElementById('videoCaption').value,
        photo3_url: document.getElementById('photo3_url').value,
        faculty_ratio: document.getElementById('faculty_ratio').value,
        number_of_students: document.getElementById('number_of_students').value,
        logo: document.getElementById('logo').value,
        logo_url: document.getElementById('logo_url').value,
        description: document.getElementById('description').value,
        pullTop1Quote: document.getElementById('pullTop1Quote').value,
        pullTop1QuoteBottom: document.getElementById('pullTop1QuoteBottom').value,
        pullQuote2: document.getElementById('pullQuote2').value,
        historyInfo2: document.getElementById('historyInfo2').value,
        constructionInfo1: document.getElementById('constructionInfo1').value,
        callOut2: document.getElementById('callOut2').value,
        constructionInfo2: document.getElementById('constructionInfo2').value,
        extraInfo1: document.getElementById('extraInfo1').value,
        pullQuote3: document.getElementById('pullQuote3').value
        , locationInfo2: document.getElementById('locationInfo2').value
    };
    return formData;
}

function validateForm() {
    const requiredFields = [
        // 'header_image_url', 'photo1_url', 'photo2_url', 'photo3_url',
        // 'dropdown', 'faculty_ratio', 'number_of_students', 'logo_url',
        // 'type', 'board_type', 'year', 'description1', 'description2', 'description3'

        'header_image_url'
        , 'school_name'
        , 'year'
        , 'photo1_url'
        , 'photo2_url'
        , 'videoId'
        , 'videoCaption'
        , 'photo3_url'
        , 'faculty_ratio'
        , 'number_of_students'
        , 'logo'
        , 'logo_url'
        , 'description'
        , 'pullTop1Quote'
        , 'pullTop1QuoteBottom'
        , 'pullQuote2'
        , 'historyInfo2'
        , 'constructionInfo1'
        , 'callOut2'
        , 'constructionInfo2'
        , 'extraInfo1'
        , 'pullQuote3'
        ,'locationInfo2'
    ];

    for (const fieldId of requiredFields) {
        const field = document.getElementById(fieldId);
        if (!field.value.trim()) {
            showValidationError(`The field ${fieldId.replace('_', ' ')} is required.`);
            return false;
        }
    }

    const facultyRatio = document.getElementById('faculty_ratio').value;
    const facultyRatioPattern = /^\d+:\d+$/;
    if (!facultyRatioPattern.test(facultyRatio)) {
        showValidationError('Faculty ratio must be in the format number:number');
        return false;
    }

    const numberOfStudents = document.getElementById('number_of_students').value;
    if (!Number.isInteger(Number(numberOfStudents)) || numberOfStudents <= 0) {
        showValidationError('Number of students must be a positive integer');
        return false;
    }

    return true;
}

function showValidationError(message) {
    document.getElementById('validationErrorMessage').textContent = message;
    $('#validationErrorModal').modal('show');
}
function generateRandomString(length) {
    const characters = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789';
    let result = '';
    for (let i = 0; i < length; i++) {
        result += characters.charAt(Math.floor(Math.random() * characters.length));
    }
    return result;
}
function checkSchoolNameLength() {
    const schoolName = document.getElementById('school_name').value;
    const inputElements = document.querySelectorAll('input');
    const textAreas = document.querySelectorAll('textarea');

    if (schoolName.length >= 8) {

        // console.log(inputElements);
        inputElements.forEach(field =>
            field.id == 'school_name' ? field.disabled = false : field.disabled = false);
        textAreas.forEach(field =>
            field.disabled = false);


    } else {

        // console.log(inputElements);
        inputElements.forEach(field =>
            field.id == 'school_name' ? field.disabled = false : field.disabled = true);
        textAreas.forEach(field =>
            field.disabled = true);


    }
}

function uploadToS3(inputId, urlFieldId) {
    const schoolName = document.getElementById('school_name').value.trim().replace(/\s+/g, '_');
    const randomString = generateRandomString(6);
    const fileName = `${schoolName}_${randomString}`;

    const fileInput = document.getElementById(inputId);
    const file = fileInput.files[0];
    if (file) {
        // Show progress modal
        $('#progressModal').modal('show');
        const progressBar = document.getElementById('progressBar');
        progressBar.style.width = '0%';
        progressBar.setAttribute('aria-valuenow', 0);

        // Create an S3 client
        const s3 = new AWS.S3();

        // Set up the parameters for the upload
        const params = {
            Bucket: 'academy-v1',
            Key: 'school_profile_data/' + fileName + '_' + file.name,
            Body: file,
        };

        // Upload the file to S3
        s3.upload(params).on('httpUploadProgress', function (evt) {
            const progress = Math.round((evt.loaded / evt.total) * 100);
            progressBar.style.width = progress + '%';
            progressBar.setAttribute('aria-valuenow', progress);
        }).send(function (err, data) {
            if (err) {
                console.error('Error uploading file:', err);
                alert('Error uploading file. Please try again.');
            } else {
                // Hide progress modal
                $('#progressModal').modal('hide');
                // Set the URL to the corresponding input field
                document.getElementById(urlFieldId).value = data.Location;
            }
        });
    }
}

document.addEventListener('DOMContentLoaded', function () {
    const inputElements = document.querySelectorAll('input');
    // console.log(inputElements);
    inputElements.forEach(field => {
        field.id == 'school_name' ? field.disabled = false : field.disabled = true
    });

    const textAreas = document.querySelectorAll('textarea');
    textAreas.forEach(field =>
        field.disabled = true);

    fetch('https://parseapi.back4app.com/classes/Demographics', {
        method: 'GET',

        headers: {
            'Content-Type': 'application/json',
           
        }
    })
        .then(response => response.json())
        .then(data => {
            const dropdown = document.getElementById('city');
            const items = data['results']
            items.forEach(option => {
                const opt = document.createElement('option');
                opt.value = option['objectId'];
                opt.textContent = option['city'] + ',' + option['state'];
                dropdown.appendChild(opt);
            });
        });
    document.getElementById('submitForm').addEventListener('click', async function (event) {
        console.log("clicked");
        event.preventDefault();
        if (validateForm()) {
            const formData = getFormData();
            
    
            try {
                const response = await fetch('https://parseapi.back4app.com/parse/functions/createSchool', { // replace with actual API URL
                    method: 'POST',
                    
                    headers: {
                        'Content-Type': 'application/json',
                        
                    },
                    body: JSON.stringify(formData)
                });
                if (response.ok) {
                    if(response['results']['code'] == 200){
                        formData.reset();
                        alert('Data Submitted Succesfully!')
                    }else{
                        alert(response['result']['message']);
                    }
                } else {
                    alert('Failed to submit data');
                }
            } catch (error) {
                console.error('Error:', error);
                alert('Error submitting data'+error.toString());
            }
        }
        else {

        }
    });

    // Add validation for year input
    // document.getElementById('year').addEventListener('input', validateYear);
    document.getElementById('school_name').addEventListener('input', checkSchoolNameLength);
});



