

$(document).ready(function () {
    // Populate dropdown from API
    $.ajax({
        url: 'https://parseapi.back4app.com/classes/Standard', // Replace with your API endpoint
        method: 'GET',
        headers: {
            'Content-Type': 'application/json',
                    'X-Parse-Application-Id':appId,
                    'X-Parse-REST-API-Key':restApiKey
          
        },
        success: function (data) {
            const items = data['results'];
            items.forEach(function (option) {
                $('#dropdown').append(`<option value="${option['objectId']}">${option['standard_name']}</option>`);
            });
        }
    });
    $('#copyButton').click(function() {
        const text = $('#longText').text();
        navigator.clipboard.writeText(text).then(function() {
            alert('Text copied to clipboard!');
        }, function(err) {
            alert('Failed to copy text: ', err);
        });
    });

    // Form submission
    $('#studyPlanForm').submit(function(event) {
        event.preventDefault();
        $('.progress').show();
        console.log($(this));
        let formDataArray = $(this).serializeArray();
        let formData = {};

        formDataArray.forEach(function(item) {
            if(item.name == 'plan_attributes'){

                console.log('here');
               

                formData[item.name] = item.value;
            }else{
                formData[item.name] = item.value;
            }
            
        });

        $.ajax({
            url: 'https://parseapi.back4app.com/parse/functions/createStudyPlanUsingJson', // Replace with your API endpoint
            method: 'POST',
            headers: {
                'Content-Type': 'application/json',
                'X-Parse-Application-Id':appId,
                'X-Parse-REST-API-Key':restApiKey
               
            },
            contentType: 'application/json',
            data: JSON.stringify(formData),
            success: function(response) {
                $('.progress').hide();
                alert('Form submitted successfully!');
            },
            error: function() {
                $('.progress').hide();
                alert('There was an error submitting the form.');
            }
        });
    });
});