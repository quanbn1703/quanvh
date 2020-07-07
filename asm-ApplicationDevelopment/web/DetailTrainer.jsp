<%-- 
    Document   : DetailTrainer
    Created on : Jun 2, 2020, 2:52:23 PM
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
<html>
    <jsp:include page="header.jsp"/>
    <jsp:include page="navigationbar.jsp"/>
    <div class="table-content">
        <a href="loadCourse.action" class="btn btn-sm btn-default" style="margin-left: 40px; margin-top: 20px; margin-bottom: -20px; font-size: 10px;">Back to main page</a>
        <table class="table table-responsive tbl">
            <thead class="table-responsive table-dark">
                <tr>
                    <th colspan="4"><h4 style="text-align: center;">Detail trainer</h4></th>
                </tr>
            </thead>
            <tbody>                    
                <tr>
                    <td>Trainer ID</td>
                    <td><input type="text" name="trainerID" style="width: 180px" value="<s:property value="trainer.trainerID"/>" readonly></td>
                    <td>Password</td>
                    <td>
                        <input type="text" name="trainerPassword" style="width: 180px;" value="<s:property value="trainer.password"/>" readonly/>
                    </td> 
                </tr>  
                <tr>
                    <td>Trainer Name</td>
                    <td><input type="text" name="trainerName" style="width: 180px" value="<s:property value="trainer.trainerName"/>" readonly></td>
                    <td>Birthday</td>
                    <td>
                        <input type="text" name="trainerDoB" style="width: 180px;" value="<s:property value="trainer.trainerDoB"/>" readonly/>
                        </td> 
                    </tr>
                    <tr>
                        <td>Phone number</td>
                        <td>
                            <input type="text" name="trainerPhoneNumber" style="width: 180px" value="<s:property value="trainer.trainerPhoneNumber"/>" readonly>
                        </td>
                        <td>Email</td>
                        <td>
                            <input type="email" name="trainerEmail" style="width: 180px" value="<s:property value="trainer.trainerEmail"/>" readonly/>
                        </td>                        
                    </tr>
                    <tr>
                        <td>
                            Trainer certificate
                        </td>
                        <td>
                            <input type="text" name="trainerCertificate" style="width: 180px" value="<s:property value="trainer.trainerCertificate"/>" readonly/>
                        </td>
                        <td>Trainer type</td>
                        <td colspan="3">
                            <input type="text" name="trainerType" style="width: 180px" value="<s:property value="trainer.trainerType"/>" readonly>
                        </td>
                    </tr>
                    <tr>
                        <td>Trainer address</td>
                        <td colspan="3">
                            <textarea name="trainerAddress" cols="86" rows="4" readonly><s:property value="trainer.trainerAddress"/></textarea>
                        </td>
                    </tr>
                    <tr>
                        <td></td>
                        <td>Select topic</td>
                        <td>
                            <input type="text" value="<s:property value="topicName"/>" style="width: 180px;" readonly=""/>
                        </td>
                    </tr>
                    <tr>
                        <td>Topic description</td>
                        <td colspan="3">
                            <textarea name="topicDescription" cols="86" rows="4" readonly><s:property value="topicDescription"/></textarea>
                        </td>
                    </tr>
                    <tr style="text-align: center;">
                        <td colspan="4">
                            <a href="detailTrainer.action?action=Update&trainerID=<s:property value="trainerID"/>" class="btn btn-success">Update</a>
                            <a href="" class="btn btn-danger">Delete</a>
                            <a href="viewTrainer.action" class="btn btn-primary">Back</a>
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>
        <jsp:include page="footer.jsp"/>
    </html>