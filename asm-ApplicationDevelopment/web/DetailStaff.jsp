<%-- 
    Document   : DetailStaff
    Created on : Jun 1, 2020, 10:49:35 PM
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
    function confirm_Delete()
    {
        return confirm("Do you want to delete? This action will not be recoverable");
    }
</script>
<html>
    <jsp:include page="header.jsp"/>
    <jsp:include page="navigationbar.jsp"/>
    <div class="table-content">
        <a href="loadCourse.action" class="btn btn-sm btn-default" style="margin-left: 40px; margin-top: 20px; margin-bottom: -20px; font-size: 10px;">Back to main page</a>
        <table class="table table-responsive tbl">
            <thead class="table-responsive table-dark">
                <tr>
                    <th colspan="4"><h4 style="text-align: center;">Detail staff</h4></th>
                </tr>
            </thead>
            <tbody>                    
                <tr>
                    <td>Staff ID</td>
                    <td><input type="text" name="staffID" style="width: 180px" value="<s:property value="staff.staffID"/>" readonly/></td>
                    <td>Password</td>
                    <td>
                        <input type="text" name="password" style="width: 180px;" value="<s:property value="staff.password"/>" readonly"/>
                    </td> 
                </tr>  
                <tr>
                    <td>Staff Name</td>
                    <td><input type="text" name="staffName" style="width: 180px" value="<s:property value="staff.staffName"/>" readonly/></td>
                    <td>Birthday</td>
                    <td>
                        <input type="text" name="staffDoB" style="width: 180px;" value="<s:property value="staff.staffDoB"/>" readonly/>
                    </td> 
                </tr>
                <tr>
                    <td>Phone number</td>
                    <td>
                        <input type="text" name="staffPhonenumber" style="width: 180px" value="<s:property value="staff.staffPhonenumber"/>" readonly/>
                    </td>
                    <td>Email</td>
                    <td>
                        <input type="email" name="staffEmail" style="width: 180px" value="<s:property value="staff.staffEmail"/>" readonly/>
                    </td>                        
                </tr>
                <tr>
                    <td>Staff address</td>
                    <td colspan="3">
                        <textarea name="staffAddress" cols="86" rows="4" readonly><s:property value="staff.staffAddress"/></textarea>
                    </td>
                </tr>
                <tr style="text-align: center;">
                    <td colspan="4">
                        <a class="btn btn-success" href="detailStaff.action?action=Update&staffID=<s:property value="staff.staffID"/>">Update</a>
                        <a class="btn btn-danger" onclick="return confirm_Delete();" href="deleteStaff.action?staffID=<s:property value="staffID"/>">Delete</a>
                        <a href="viewStaff.action" class="btn btn-primary">Back</a>
                    </td>
                </tr>
            </tbody>
        </table>
    </div>
    <jsp:include page="footer.jsp"/>
</html>
