<%-- 
    Document   : navigationbar
    Created on : May 15, 2020, 11:00:17 AM
    Author     : Ngoc Do Minh
--%>

<%@taglib prefix="s" uri="/struts-tags"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<s:if test="#session.login != 'true'">    
    <script>
        alert("Your login session has expired. Please log in again.");
        window.location = "Login.jsp";
    </script>
</s:if>
<style>
    .dropbtn {
        background-color: #4CAF50;
        color: white;
        padding: 16px;
        font-size: 16px;
        border: none;
        cursor: pointer;
    }

    .dropdown {
        position: relative;
        display: inline-block;
    }

    .dropdown-content {
        display: none;
        position: absolute;
        background-color: #f9f9f9;
        min-width: 160px;
        box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
        z-index: 1;
    }

    .dropdown-content a {
        color: black;
        padding: 12px 16px;
        text-decoration: none;
        display: block;
    }

    .dropdown-content a:hover {background-color: #f1f1f1}

    .dropdown:hover .dropdown-content {
        display: block;
    }

    .dropdown:hover .dropbtn {
        background-color: #3e8e41;
    }
    .isDisabled {
        color: currentColor;
        cursor: not-allowed;
        opacity: 0.5;
        text-decoration: none;
    }
</style>
<script>
    function confirm_Logout()
    {
        return confirm("Do you want to log out?");
    }
    ;
    function updateAccount()
    {
        var userID = document.getElementById("userID").value;
        var password = document.getElementById("password").value;
        var DoB = document.getElementById("DoB").value;
        var address = document.getElementById("address").value;
        var phoneNumber = document.getElementById("phoneNumber").value;
        var role = document.getElementById("role").value;
        var certificate = document.getElementById("certificate").value;
        var type = document.getElementById("type").value;
        $.ajax({
            url: "updateProfile.action",
            type: "POST",
            data: {
                userID: userID,
                password: password,
                userDoB: DoB,
                userPhoneNumber: phoneNumber,
                userAddress: address,
                userCertificate: certificate,
                userType: type,
                role: role
            },
            success: function (data) {                
                alert(data['msg']);
            }
        });
    }
</script>
<body id="top" data-spy="scroll" data-target=".navbar-collapse" data-offset="50">
    <!-- HEADER -->
    <!-- MENU -->
    <section class="navbar navbar-default navbar-static-top" role="navigation">
        <div class="container">
            <div class="navbar-header">
                <button class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                    <span class="icon icon-bar"></span>
                    <span class="icon icon-bar"></span>
                    <span class="icon icon-bar"></span>
                </button>

                <!-- lOGO TEXT HERE -->
                <a class="navbar-brand" href="loadCourse.action">Manage</a>
            </div>

            <!-- MENU LINKS -->
            <div class="collapse navbar-collapse">
                <ul class="nav navbar-nav navbar-left">
                    <s:if test="#session.role == 3">
                        <li>
                            <a href="loadCourse.action" class="smoothScroll">Manage Course</a>
                        </li>
                    </s:if>
                    <s:else>
                        <li><a href="loadCourse.action" class="smoothScroll">Manage Course</a></li>
                        <li><a href="loadCategory.action" class="smoothScroll">Manage Category</a></li>
                        <li><a href="loadTopic.action" class="smoothScroll">Manage Topic</a></li>

                        <li class="dropdown"><a class="smoothScroll">Manage Account</a>
                            <ul class="nav navbar-nav">
                                <div class="dropdown-content">
                                    <s:if test="#session.role == 1">
                                        <li><a href="viewStaff.action" class="smoothScroll" style=>Training staff</a></li>
                                        <li><a href="viewTrainer.action" class="smoothScroll">Trainer</a></li>
                                        </s:if>
                                    <li><a href="viewTrainee.action" class="smoothScroll">Trainee</a></li>
                                </div>
                            </ul>
                        </li>  
                    </s:else>
                </ul>
                <ul class="nav navbar-nav navbar-right dropitem">
                    <div class="dropdown">
                        <button class="dropbtn">Hello, <s:property value="#session.name"/></button>
                        <div class="dropdown-content">
                            <a data-toggle="modal" data-target="#detailAccount">View</a>
                            <a href="logoutAction.action" onclick="return confirm_Logout()">Logout</a>
                        </div>
                    </div>
                </ul>
            </div>   
        </div>
    </section>
    <div class="modal fade" id="detailAccount" role="dialog">
        <div class="modal-dialog">
            <!-- Modal content-->
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h4 class="modal-title">Detail account</h4>
                </div>
                <div class="modal-body">
                    <table class=" table tbl" style="text-align: center; border: 2px solid black;">
                        <input type="hidden" id="userID" name="userID" value="<s:property value="#session.userID"/>"/>
                        <input type="hidden" id="role" name="role" value="<s:property value="#session.role"/>"/>
                        <s:if test="#session.role == 3">
                            <tr>
                                <td>Email</td>
                                <td><input type="text" readonly id="email" name="username" style="width: 250px;" value="<s:property value="#session.username"/>"/></td>
                            </tr>
                            <tr>
                                <td>Name</td>
                                <td><input type="text" readonly name="fullName" style="width: 250px;" value="<s:property value="#session.fullName"/>"/></td>
                            </tr>
                            <tr>
                                <td>Password</td>
                                <td><input type="text" id="password" name="password" style="width: 250px;" value="<s:property value="#session.password"/>"/></td>
                            </tr>
                            <tr>
                                <td>Birthday</td>
                                <td><input type="date" id="DoB" name="DoB" style="width: 250px;" value="<s:property value="#session.DoB"/>"/></td>
                            </tr>
                            <tr>
                                <td>Address</td>
                                <td><textarea cols="32" id="address" name="address" rows="6"><s:property value="#session.address"/></textarea></td>
                            </tr>
                            <tr>
                                <td>Phone number</td>
                                <td><input type="text" id="phoneNumber" name="phoneNumber" style="width: 250px;" value="<s:property value="#session.phoneNumber"/>"/></td>
                            </tr>
                            <tr>
                                <td>Certificate</td>
                                <td><input type="text" id="certificate" name="certificate" style="width: 250px;" value="<s:property value="#session.certificate"/>"/></td>
                            </tr>
                            <tr>
                                <td>Type</td>
                                <td><input type="text" id="type" name="type" style="width: 250px;" value="<s:property value="#session.type"/>"/></td>
                            </tr>
                        </s:if>
                        <s:else>
                            <input type="hidden" id="certificate" value=""/>
                            <input type="hidden" id="type" value=""/>
                            <tr>
                                <td>Email</td>
                                <td><input type="text" id="email" name="username" readonly style="width: 250px;" value="<s:property value="#session.username"/>"/></td>
                            </tr>
                            <tr>
                                <td>Name</td>
                                <td><input type="text" readonly style="width: 250px;" value="<s:property value="#session.fullName"/>"/></td>
                            </tr>
                            <tr>
                                <td>Password</td>
                                <td><input type="text" id="password" style="width: 250px;" value="<s:property value="#session.password"/>"/></td>
                            </tr>
                            <tr>
                                <td>Birthday</td>
                                <td><input type="date" id="DoB" value="<s:property value="#session.DoB"/>" style="width: 250px;"/></td>
                            </tr>
                            <tr>
                                <td>Address</td>
                                <td><textarea cols="32" id="address" rows="6"><s:property value="#session.address"/></textarea></td>
                            </tr>
                            <tr>
                                <td>Phone number</td>
                                <td><input type="text" id="phoneNumber" value="<s:property value="#session.phoneNumber"/>" style="width: 250px;"/></td>
                            </tr>
                        </s:else>
                    </table>
                </div>
                <div class="modal-footer">
                    <button class="btn btn-info" onclick="updateAccount();">Update</button>
                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                </div>
            </div>
        </div>
    </div>
</body>
