<%-- 
    Document   : AddNewTopic
    Created on : May 22, 2020, 10:36:23 AM
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
    <jsp:include page="header.jsp"/>
    <jsp:include page="navigationbar.jsp"/>
    <div class="table-content">
        <form action="addTopic.action" method="POST" id="addForm">
            <table class="table table-responsive tbl">
                <thead class="table-responsive table-dark">
                    <tr>
                        <th colspan="4"><h4 style="text-align: center;">Add new topic</h4></th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>Topic ID:</td>
                        <td>
                            <input type="text" id="topicID" name="topicID" style="width: 310px" value="<s:property value="topicID"/>" readonly>
                        </td>
                    </tr>
                    <tr>
                        <td>Topic Name:</td>
                        <td>
                            <input type="text" name="topicName" style="width: 310px" placeholder="Enter Topic Name" onkeyup="checkName();" autocomplete="off">
                            <div id="msg"></div>
                        </td>
                    </tr>
                    <tr>
                        <td>Topic Description:</td>
                        <td><textarea name="topicDescription" cols="40" row="10" placeholder="Enter Topic Description"></textarea></td>
                    </tr>
                    <tr>
                        <td colspan="2"  style="text-align: center;">
                            <input type="submit" value="Add" class="btn btn-success"/>
                            <input type="reset" value="Reset" class="btn btn-blue"/>
                            <a href="loadTopic.action" class="btn btn-primary">Back</a>
                        </td>
                    </tr>
                </tbody>
            </table>
        </form>
    </div>
    <jsp:include page="footer.jsp"/>
</html>

