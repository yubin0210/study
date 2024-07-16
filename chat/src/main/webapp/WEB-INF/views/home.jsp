<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<c:set var="cpath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
/* Reset some basic elements */
body, h1, h2, form, input, a {
    margin: 0;
    padding: 0;
    font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, "Helvetica Neue", Arial, sans-serif;
}

body {
    display: flex;
    justify-content: center;
    align-items: center;
    height: 100vh;
    background: #f2f2f7;
}

.container {
    background: #fff;
    border-radius: 10px;
    box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1);
    padding: 20px 40px;
    width: 100%;
    max-width: 400px;
    text-align: center;
}

h1 {
    color: #333;
    margin-bottom: 30px;
    font-size: 24px;
    font-weight: 700;
}

.form-box {
    margin-bottom: 20px;
}

h2 {
    font-size: 20px;
    color: #555;
    margin-bottom: 20px;
    font-weight: 600;
}

form {
    display: flex;
    flex-direction: column;
    align-items: center;
}

label {
    width: 100%;
    text-align: left;
    margin-bottom: 8px;
    font-weight: 600;
    font-size: 14px;
}

input[type="text"], input[type="password"] {
    width: 100%;
    padding: 12px 10px;
    margin-bottom: 20px;
    border: 1px solid #ddd;
    border-radius: 8px;
    font-size: 16px;
}

input[type="submit"] {
    width: 100%;
    background: #007aff;
    color: white;
    border: none;
    padding: 12px;
    border-radius: 8px;
    cursor: pointer;
    font-size: 16px;
    font-weight: 600;
    transition: background 0.3s ease;
}

input[type="submit"]:hover {
    background: #005bb5;
}

.register-link {
    margin-top: 20px;
}

.register-link a {
    color: #007aff;
    text-decoration: none;
    font-weight: 600;
    font-size: 16px;
    transition: color 0.3s ease;
}

.register-link a:hover {
    color: #005bb5;
}
</style>
</head>
<body>
    <div class="container">
        <h1>iMessage</h1>
        <div class="form-box">
            <h2>Login</h2>
            <form method="post">
                <label for="loginUsername">ID</label>
                <input type="text" id="loginUsername" name="username" required>

                <label for="loginPassword">Password</label>
                <input type="password" id="loginPassword" name="password" required>
                
                <input type="submit" value="Start Chat">
            </form>
        </div>

        <div class="register-link">
            <a href="${cpath }/register">Sign up</a>
        </div>
    </div>
</body>
</html>