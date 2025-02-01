 // userValidation.js
const userSignup = async (request) => {
console.log(request.params);

  // if (!user) {
  //   logError('User not found');
  //   throw new Parse.Error(Parse.Error.OBJECT_NOT_FOUND, 'User not found');
  // }


    const isValid = await performAdditionalValidation(request);

  
  if (!isValid) {
    logError('User validation failed');
    throw new Parse.Error(Parse.Error.VALIDATION_ERROR, 'User validation failed');
  }
  else{
    return {"code":200,status:true};
  }
};

const performAdditionalValidation = async (request) => {
  // Perform any additional checks, e.g., checking user roles, permissions, etc.
  // Example: return user.get('isActive') && user.get('role') === 'admin';
  return true; // return true if valid, false otherwise
};

const logError = (message) => {
  // Log the error message (e.g., to a logging service or database)
  console.error('Validation Error:', message);
};

module.exports = {
  userSignup,
};
