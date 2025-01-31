document.addEventListener('DOMContentLoaded', function () {
    // Configure AWS SDK
    const AWS = require('aws-sdk');

    // Replace these with your actual AWS credentials and S3 bucket details
    AWS.config.update({
        accessKeyId: accessKeyId,
        secretAccessKey: secretAccessKey,
        region: region, // e.g., 'us-east-1'
    });

    const s3 = new AWS.S3();

    function generateRandomString(length) {
        const characters = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789';
        let result = '';
        for (let i = 0; i < length; i++) {
            result += characters.charAt(Math.floor(Math.random() * characters.length));
        }
        return result;
    }
    // Function to upload image to S3
    function uploadImage() {
        const fileInput = document.getElementById('thumbnail');
        const randomString = generateRandomString(6);
        const file = fileInput.files[0];
        if (!file) {
            alert('Please select an image file.');
            return;
        }

        // Set up S3 upload parameters
        const params = {
            Bucket: 'academy-v1', // Replace with your S3 bucket name
            Key: 'videos/'+randomString+'/'+randomString+'_thumbnail.jpg', // Unique file name
            Body: file,
            ContentType: file.type,
        };

        // Upload the file to S3
        const upload = s3.upload(params);

        // Track upload progress
        upload.on('httpUploadProgress', (progress) => {
            const progressBar = document.getElementById('progress');
            const percentage = Math.round((progress.loaded / progress.total) * 100);
            progressBar.style.width = `${percentage}%`;
            progressBar.setAttribute('aria-valuenow', percentage);
        });

        // Handle upload completion
        upload.send((err, data) => {
            if (err) {
                console.error('Error uploading file:', err);
                alert('Error uploading file. Please try again.');
            } else {
                console.log('File uploaded successfully:', data.Location);
                document.getElementById('thumbnailUrl').value = data.Location; // Set the S3 URL
                alert('Upload complete!');
            }
        });
    }

    // Handle form submission
    document.getElementById('videoForm').addEventListener('submit', async function (e) {
        e.preventDefault();

        // Validate form inputs
        const title = document.getElementById('title').value;
        const thumbnailUrl = document.getElementById('thumbnailUrl').value;
        const duration = document.getElementById('duration').value;
        const videoLink = document.getElementById('videoLink').value;

        if (!title || !thumbnailUrl || !duration || !videoLink) {
            alert('Please fill out all fields.');
            return;
        }

        // Simulate API submission
        const formData = {
            title,
            thumbnailUrl,
            duration,
            videoType: document.getElementById('videoType').value,
            videoLink,
        };

        try {
            const response = await fetch('https://parseapi.back4app.com/parse/functions/createMentorVideo', { // replace with actual API URL
                method: 'POST',

                headers: {
                    'Content-Type': 'application/json',
                    'X-Parse-Application-Id': appId,
                    'X-Parse-REST-API-Key': restApiKey
                },
                body: JSON.stringify(formData)
            });
            if (response.ok) {
                if (response['result']['code'] == 200) {
                    alert('Form submitted successfully!');
                    document.getElementById('videoForm').reset();
                    document.getElementById('progress').style.width = '0%';
                } else {
                    alert(response['result']['message']);
                }
            } else {
                alert('Failed to submit data');
            }
        } catch (error) {
            console.error('Error:', error);
            alert('Error submitting data' + error.toString());
        }
    });
});