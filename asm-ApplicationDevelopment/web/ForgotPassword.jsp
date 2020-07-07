<%-- 
    Document   : ForgotPassword
    Created on : May 21, 2020, 2:45:29 PM
    Author     : Ngoc Do Minh
--%>

<%@taglib prefix="s" uri="/struts-tags"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <style>
        @import url(https://fonts.googleapis.com/css?family=Roboto:300);

        .login-page {
            width: 440px;
            padding: 8% 0 0;
            margin: auto;
        }
        .form {
            position: relative;
            z-index: 1;
            background: #FFFFFF;
            max-width: 440px;
            margin: 0 auto 100px;
            padding: 45px;
            text-align: center;
            box-shadow: 0 0 20px 0 rgba(0, 0, 0, 0.2), 0 5px 5px 0 rgba(0, 0, 0, 0.24);
        }
        .form .button {
            font-family: "Roboto", sans-serif;
            outline: 0;
            background: #4CAF50;
            width: 100%;
            border: 0;
            padding: 15px;
            color: #FFFFFF;
            font-size: 14px;
            -webkit-transition: all 0.3 ease;
            transition: all 0.3 ease;
            cursor: pointer;
        }

        .form input {
            font-family: sans-serif;
            outline: 0;
            background: #f2f2f2;
            width: 100%;
            border: 0;
            margin: 0 0 15px;
            padding: 15px;
            font-size: 14px;
        }
        .form select
        {
            font-family: "Roboto", sans-serif;
            outline: 0;
            background: #f2f2f2;
            width: 100%;
            border: 0;
            margin: 0 0 15px;
            padding: 15px;
            box-sizing: border-box;
            font-size: 14px;
        }

        .form .message {
            margin: 15px 0 0;
            color: #b3b3b3;
            font-size: 12px;
        }
        .form button:hover,.form button:active,.form button:focus {
            background: #43A047;
        }
        .container {
            position: relative;
            z-index: 1;
            margin: 0 auto;
        }
    </style>
    <jsp:include page="header.jsp"/>
    <div class="login-page">
        <div class="form">
            <form class="login-form" action="" method="POST">
                <div class="message">
                    <h2>Forgot password</h2>
                </div>
                <div class="message">
                    <p>Enter your email and press "Send to email"
                         button. Your password will automatically 
                         send to your email.</p>
                </div>
                <input type="text" name="email" placeholder="Enter registed email"/>
                <select name="role"> 
                    <option value="1">Admin</option>
                    <option value="2">Staff</option>
                    <option value="3">Trainer</option>
                </select>
                <p id="message"></p>
                <div class="row">
                    <div class="col-md-1 col-lg-1 col-sm-1"></div>
                    <div class="col-md-5 col-lg-5 col-sm-5"><input type="submit" value="Send to email" class="button"/></div>
                    <div class="col-md-5 col-lg-5 col-sm-5"><a href="/Login.jsp"><button class="button btn-info">Back to login</button></a></div>
                    <div class="col-md-1 col-lg-1 col-sm-1"></div>
                                        
                </div>
            </form>
        </div>
    </div>
    <jsp:include page="footer.jsp"/>
</html>
