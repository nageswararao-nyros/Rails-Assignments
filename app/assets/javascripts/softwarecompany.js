
	function formValidate() {
		
		 var nameInput = document.getElementById('name').value;
		 var emailInput = document.getElementById('email').value;
		 var phoneInput = document.getElementById('phone').value;
		 var subjectInput = document.getElementById('subject').value;
		 var descriptionInput = document.getElementById('description').value;

		 var nameRegExp = /^([\w]{3,})$/;
		 var emailRegExp = /([\w\s]+.+)@([\w\s]+)([\.])([\w]{2,5})/;
		 var phoneRegExp = /^([\d]{10})$/;
		 var subjectRegExp = /^([\w]{3,})$/;
		 var descriptionRegExp = /^([\w]{3,})$/;


		 var nameTest = nameRegExp.test(nameInput);
		 var emailTest = emailRegExp.test(emailInput);
		 var phoneTest = phoneRegExp.test(phoneInput);
		 var subjectTest = subjectRegExp.test(subjectInput);
		 var descriptionTest = descriptionRegExp.test(descriptionInput);


		 if(nameTest && emailTest && phoneTest && subjectTest && descriptionTest){
		 	alert("success!!!! we will contact you later!")
		 }else{
		 	
		 	if(!emailTest){
		 		alert("invalid email");
		 	}
		 	if(!phoneTest){
		 		alert('Invalid Phone Number')
		 	}

		 	else{
		 		alert('invalid credentials');
		 	}

		}

		
 }
