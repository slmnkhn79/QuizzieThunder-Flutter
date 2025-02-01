$(document).ready(function () {
    // Add attribute fields
    $('#addAttribute').click(function () {
        $('#planAttributesContainer').append(`
            <div class="form-group plan-attributes">
                <label for="type">Type</label>
                <select class="form-control" name="type[]" required>
                    <option value="title">Title</option>
                    <option value="heading">Heading</option>
                    <option value="subheading">Subheading</option>
                    <option value="image">Image</option>
                </select>
                <label for="heading">Heading</label>
                <input type="text" class="form-control" name="heading[]" required>
                <label for="content">Content</label>
                <textarea class="form-control" name="content[]" rows="6" required></textarea>
                <button type="button" class="btn btn-danger remove-attribute mt-2">Remove</button>
            </div>
        `);
    });

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

    // Remove attribute fields
    $(document).on('click', '.remove-attribute', function() {
        $(this).closest('.plan-attributes').remove();
    });

    // Form submission
    $('#studyPlanForm').submit(function(event) {
        event.preventDefault();
        $('.progress').show();

        let formDataArray = $(this).serializeArray();
        let formData = {};
        let planAttributes = [];
        let currentAttribute = {};

        formDataArray.forEach(function(item) {
            if (item.name === 'type[]' || item.name === 'heading[]' || item.name === 'content[]') {
                if (item.name === 'type[]') {
                    currentAttribute.type = item.value;
                } else if (item.name === 'heading[]') {
                    currentAttribute.heading = item.value;
                } else if (item.name === 'content[]') {
                    currentAttribute.content = item.value;
                }

                if (currentAttribute.type && currentAttribute.heading && currentAttribute.content) {
                    planAttributes.push(currentAttribute);
                    currentAttribute = {};
                }
            } else {
                formData[item.name] = item.value;
            }
        });

        formData.plan_attributes = { data: planAttributes };

        $.ajax({
            url: 'https://parseapi.back4app.com/parse/functions/createStudyPlan', // Replace with your API endpoint
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
                if(response['result']['code'] == 200){
                alert('Form submitted successfully!');
                }
                else{
                    alert(response['result'['message']]);
                }
            },
            error: function() {
                $('.progress').hide();
                alert('There was an error submitting the form.');
            }
        });
    });
});