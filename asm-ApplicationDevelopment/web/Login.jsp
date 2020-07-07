<%-- 
    Document   : Login
    Created on : May 15, 2020, 11:31:32 AM
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
            text-transform: uppercase;
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
            <form class="login-form" action="checkLogin.action" method="POST">
                <div class="message">
                    <h2>Login</h2>
                    <p><s:property value="msg"/></p>
                </div>
                <input type="email" name="username" placeholder="Enter email" autocomplete="off"/>
                <input type="password" name="password" placeholder="Enter password"/>
                <select name="role"> 
                    <option value="1">Admin</option>
                    <option value="2">Staff</option>
                    <option value="3">Trainer</option>
                </select>
                <div class="row message">
                    <div class="col-lg-6 col-md-6 col-sm-6" style="text-align: left;"><label class="checkbox-inline" for="remember"><input type="checkbox" name="remember" id="remember" style="width: fit-content;"/>Remember me</label></div>
                    <div class="col-lg-6 col-md-6 col-sm-6" style="text-align: right;">
                        <a href="RecoveryPassword.jsp" class="checkbox-inline">Forgot password</a>
                    </div>
                </div>
                <div style="padding: 20px">
                    <input type="submit" value="Login" class="button" tabindex="-1"/>
                </div>
            </form>
        </div>
    </div>
    <jsp:include page="footer.jsp"/>
</html>
