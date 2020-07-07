<%-- 
    Document   : AddNewCategory
    Created on : May 18, 2020, 1:39:19 PM
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
        function checkCategoryName()
        {
            $("#categoryName").keyup(function () {
                var categoryName = document.getElementById("categoryName").value;
                $.ajax({
                    type: "POST",
                    url: "checkCategoryName.action?categoryName=" + categoryName;
                    success: function ()
                    {
                        $("#msg").html("OK");
                    }
                });
            });
        }
    </script>
    <jsp:include page="header.jsp"/>
    <jsp:include page="navigationbar.jsp"/>
    <div class="table-content">
        <div id="msg" style="text-align: center;"></div>
        <form action="addCategory.action" method="POST">
            <table class="table table-responsive tbl">
                <thead class="table-responsive table-dark">
                    <tr>
                        <th colspan="4"><h4 style="text-align: center;">Add new category</h4></th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>Category ID:</td>
                        <td><input type="text" name="categoryID" style="width: 310px" value="<s:property value="categoryID"/>" readonly></td>
                    </tr>
                    <tr>
                        <td>Category Name:</td>
                        <td>
                            <input type="text" id="categoryName" name="categoryName" style="width: 310px" placeholder="Enter Category Name" onkeyup="checkCategoryName();" autocomplete="off"/>
                        </td>
                    </tr>
                    <tr>
                        <td>Category Description:</td>
                        <td><textarea name="categoryDescription" cols="40" row="10" placeholder="Enter Category Description"></textarea></td>
                    </tr>
                    <tr>
                        <td colspan="2"  style="text-align: center;">
                            <input type="submit" value="Add" class="btn btn-success"/>
                            <input type="reset" value="Reset" class="btn btn-blue"/>
                            <a href="loadCategory.action" class="btn btn-primary">Back</a>
                        </td>
                    </tr>
                </tbody>
            </table>
        </form>
    </div>
    <jsp:include page="footer.jsp"/>
</html>
