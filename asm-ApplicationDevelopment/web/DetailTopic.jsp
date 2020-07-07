30<%-- 
    Document   : DetailTopic
    Created on : May 22, 2020, 10:57:09 AM
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
        <table class="table table-responsive tbl">
            <thead class="table-responsive table-dark">
                <tr>
                    <th colspan="4"><h4 style="text-align: center;">Topic detail</h4></th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td>Topic ID:</td>
                    <td><input type="text" name="topicID" style="width: 310px" readonly value="<s:property value="topic.topicID"/>"></td>
                </tr>
                <tr>
                    <td>Topic Name:</td>
                    <td><input type="text" name="topicName" style="width: 310px" readonly value="<s:property value="topic.topicName"/>"></td>
                </tr>
                <tr>
                    <td>Topic Description:</td>
                    <td><textarea name="topiccategoryDescription" cols="37" row="10" readonly><s:property value="topic.topicDescription"/></textarea></td>
                </tr>
                <tr>
                    <td colspan="2"  style="text-align: center;">
                        <a class="btn btn-success" href="getTopicDetail.action?action=Update&topicID=<s:property value="topic.getTopicID()"/>">Update</a>
                        <a class="btn btn-danger" href="deleteTopic.action?topicID=<s:property value="topic.getTopicID()"/>" onclick="return confirm_Delete();">Delete</a>
                        <a href="loadTopic.action" class="btn btn-primary">Back</a>
                    </td>
                </tr>
            </tbody>
        </table>
    </div>
    <jsp:include page="footer.jsp"/>
</html>
