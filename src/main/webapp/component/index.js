
document.getElementById("phone").addEventListener("blur", function() {
  var mobile = this.value;
  if (!validateMobileNumber(mobile)) {
    document.getElementById("mobile-error").style.display = "inline";
  } else {
    document.getElementById("mobile-error").style.display = "none";
  }
});

document.getElementById("email").addEventListener("blur", function() {
  var email = this.value;
  if (!validateEmailAddress(email)) {
    document.getElementById("email-error").style.display = "inline";
  } else {
    document.getElementById("email-error").style.display = "none";
  }
});

function validateMobileNumber(number) {
  var regex = /^(0\/91)?[7-9][0-9]{9}$/;
  return regex.test(number);
}

function validateEmailAddress(email) {
  var regex = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/;
  return regex.test(email);
}