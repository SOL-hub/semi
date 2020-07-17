<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<jsp:include page="/template/header.jsp"></jsp:include>
<link
	href="https://fonts.googleapis.com/css2?family=Nanum+Myeongjo:wght@700&family=Noto+Sans+KR:wght@300&display=swap"
	rel="stylesheet">
	<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/css/admin.css">
<head>
    <title>Contact Form</title>
    <style>
    #contact-form{
    	margin-top:30px;
    	margin-left: 700px;
    }
    
    #contact-form > .email-input,
     #contact-form > textarea{
    	display: block;
    	border: 1px solid #3333;
    	color: #AAAAAA;
    }
    #contact-form > .email-input:focus,
     #contact-form > textarea:focus{
     	outline: none;
     	
     	
     }
    
    #contact-form > textarea {
    	resize: none;
    	width: 500px;
    	height: 500px;
    
    }
    
    #emailsubmit {
    	margin-left : 400px;
    	margin-top:10px;
    	background-color: #C80A1E;
    	border: 1px solid transparent;
    	color:white;
    	width:100px;
    	height:50px;
    	
    }
    
    h2 {
    
    margin-top:150px;
    margin-left: 900px;
    
    }
    
    
    </style>
    
    <script type="text/javascript" src="https://cdn.jsdelivr.net/npm/emailjs-com@2.4.1/dist/email.min.js"></script>
    <script type="text/javascript">
        (function() {
            emailjs.init("user_FAxHgltDN9uv7z3bc0HU1");
        })();

    </script>
    <script type="text/javascript">
        window.onload = function() {
            document.getElementById('contact-form').addEventListener('submit', function(event) {
                event.preventDefault();
                // generate the contact number value
                this.contact_number.value = Math.random() * 100000 | 0;
                emailjs.sendForm('saebom', 'template_bYvK94Cy', this)    
                
                .then(function(response){
                    location.href="/ssemi/board/cs_email_result.jsp"  
                });
            });
        }

    </script>
</head>

<body>

<h2>신고하기</h2>
    <form id="contact-form">
        <input type="hidden" name="contact_number">
        <label>이름</label>
        <input type="text" name="user_name" class="email-input">
        <label>Email</label>
        <input type="email" name="user_email" class="email-input">
        <label>신고 내용</label>
        <textarea name="message"></textarea>
        <input type="submit" value="보내기" id="emailsubmit">
    </form>
</body>

</html>
    <jsp:include page="/template/footer.jsp"></jsp:include>