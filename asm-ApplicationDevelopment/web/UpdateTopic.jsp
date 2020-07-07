<%-- 
    Document   : UpdateTopic
    Created on : May 22, 2020, 11:14:47 AM
    Author     : Ngoc Do Minh
--%>

<%@taglib prefix="s" uri="/struts-tags"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    <style>
        .table-content {
            width: 600px;        
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
            margin-left: 100px;
            width: 400px;
        }
    </style>
    <script>
        function confirm_Delete()
        {
            return confirm("Do you want to delete? This action will not be recoverable");
        }
    </script>
    <jsp:include page="header.jsp"/>
    <jsp:include page="navigationbar.jsp"/>
    <div class="table-content">
        <form action="updateTopic.action" method="POST">
            <table class="table table-responsive tbl">
                <thead class="table-responsive table-dark">
                    <tr>
                        <th colspan="4"><h4 style="text-align: center;">Update topic</h4></th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>Category ID:</td>
                        <td><input type="text" name="topicID" style="width: 310px" value="<s:property value="topic.getTopicID()"/>" readonly></td>
                    </tr>
                    <tr>
                        <td>Category Name:</td>
                        <td><input type="text" name="topicName" style="width: 310px" value="<s:property value="topic.getTopicName()"/>"></td>
                    </tr>
                    <tr>
                        <td>Category Description:</td>
                        <td><textarea name="topicDescription" cols="40" row="10"><s:property value="topic.getTopicDescription()"/></textarea></td>
                    </tr>
                    <tr>
                        <td colspan="2"  style="text-align: center;">
                            <input type="submit" value="Update" class="btn btn-success"/>
                            <a href="deleteTopic.action?topicID=<s:property value="topic.getTopicID()"/>" class="btn btn-danger" onclick="return confirm_Delete();">Delete</a>
                            <a href="loadTopic.action" class="btn btn-primary">Back</a>
                        </td>
                    </tr>
                </tbody>
            </table>
        </form>
    </div>
    <jsp:include page="footer.jsp"/>
</html>
