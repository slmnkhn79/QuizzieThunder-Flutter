// userValidation.js
const validateUser = async (request) => {
    const user = request.user;
  
    if (!user) {
      logError('User not found');
      throw new Parse.Error(Parse.Error.OBJECT_NOT_FOUND, 'User not found');
    }
  
    // if (!user.get('emailVerified')) {
    //   logError('Email not verified');
    //   throw new Parse.Error(Parse.Error.VALIDATION_ERROR, 'Email not verified');
    // }
  
    const isValid = await performAdditionalValidation(user);
    if (!isValid) {
      logError('User validation failed');
      throw new Parse.Error(Parse.Error.VALIDATION_ERROR, 'User validation failed');
    }
  };
  
  const performAdditionalValidation = async (user) => {
    // Perform any additional checks, e.g., checking user roles, permissions, etc.
    // Example: return user.get('isActive') && user.get('role') === 'admin';
    return true; // return true if valid, false otherwise
  };
  
  const logError = (message) => {
    // Log the error message (e.g., to a logging service or database)
    console.error('Validation Error:', message);
  };
  
  module.exports = {
    validateUser,
  };
  