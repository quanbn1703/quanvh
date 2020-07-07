<%-- 
    Document   : AddNewStaff
    Created on : Jun 1, 2020, 4:08:53 PM
    Author     : Ngoc Do Minh
--%>

<%@taglib prefix="s" uri="/struts-tags"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<style>
    .table-content {
        width: 900px;        
        margin: 50px auto;
        border: 1px solid black;
    }
    td {
        padding-left: -100px;
        width: 100px;
    }
    td select{
        width: 180px;
    }
    input {
        font-family: "Roboto", sans-serif;
        width: auto;
        height: 50%;
        border: 1;
        box-sizing: border-box;
        font-size: 14px;
    }
    .table-content .tbl
    {
        margin-left: 50px;
        width: 800px;
    }
</style>
<script>
    $(function () {
        $.datepicker.setDefaults({
            onClose: function (date, inst) {
                $("#trainerDoB").html(date);
            }
        });

        $("#trainerDoB").datepicker();
    });
</script>
<html>
    <jsp:include page="header.jsp"/>
    <jsp:include page="navigationbar.jsp"/>
    <div class="table-content">
        <a href="loadCourse.action" class="btn btn-sm btn-default" style="margin-left: 40px; margin-top: 20px; margin-bottom: -20px; font-size: 10px;">Back to main page</a>
        <form action="addStaff.action" method="POST">
            <table class="table table-responsive tbl">
                <thead class="table-responsive table-dark">
                    <tr>
                        <th colspan="4"><h4 style="text-align: center;">Add new staff</h4></th>
                    </tr>
                </thead>
                <tbody>                    
                    <tr>
                        <td>Staff ID</td>
                        <td><input type="text" name="staffID" style="width: 180px" placeholder="Enter staff ID" required/></td>
                        <td>Password</td>
                        <td>
                            <input type="password" name="password" style="width: 180px;" autocomplete="false" placeholder="Enter staff password" required/>
                        </td> 
                    </tr>  
                    <tr>
                        <td>Staff Name</td>
                        <td><input type="text" name="staffName" style="width: 180px" placeholder="Enter staff name" required/></td>
                        <td>Birthday</td>
                        <td>
                            <input type="date" name="staffDoB" style="width: 180px;" autocomplete="false"/>
                        </td> 
                    </tr>
                    <tr>
                        <td>Phone number</td>
                        <td>
                            <input type="text" name="staffPhonenumber" style="width: 180px" placeholder="Enter staff phonenumber"/>
                        </td>
                        <td>Email</td>
                        <td>
                            <input type="email" name="staffEmail" style="width: 180px" placeholder="Enter trainer email"/>
                        </td>                        
                    </tr>
                    <tr>
                        <td>Staff address</td>
                        <td colspan="3">
                            <textarea name="staffAddress" cols="86" rows="4" placeholder="Enter trainer address"></textarea>
                        </td>
                    </tr>
                    <tr style="text-align: center;">
                        <td colspan="4">
                            <input type="submit" value="Add new staff" class="btn btn-success">
                            <input type="reset" value="Reset" class="btn btn-info">
                            <a href="viewStaff.action" class="btn btn-primary">Back</a>
                        </td>
                    </tr>
                </tbody>
            </table>
        </form>
    </div>
    <jsp:include page="footer.jsp"/>
</html>
