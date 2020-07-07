<%-- 
    Document   : DetailCategory
    Created on : May 21, 2020, 4:38:35 PM
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
    <script type="text/javascript">
        function confirm_click()
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
                    <th colspan="4"><h4 style="text-align: center;">Category detail</h4></th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td>Category ID:</td>
                    <td><input type="text" name="categoryID" style="width: 310px" value="<s:property value="categoryID"/>" readonly></td>
                </tr>
                <tr>
                    <td>Category Name:</td>
                    <td><input type="text" name="categoryName" style="width: 310px" value="<s:property value="category.getCategoryName()"/>" readonly></td>
                </tr>
                <tr>
                    <td>Category Description:</td>
                    <td><textarea name="categoryDescription" cols="40" row="10" readonly><s:property value="category.getCategoryDescription()"/></textarea></td>
                </tr>
                <tr>
                    <td colspan="2"  style="text-align: center;">
                        <a class="btn btn-success" href="loadDetailCategory.action?action=Update&categoryID=<s:property value="categoryID"/>">Update</a>
                        <a class="btn btn-danger" href="deleteCategory.action?categoryID=<s:property value="categoryID"/>" onclick="return confirm_click()">Delete</a>
                        <a href="loadCategory.action" class="btn btn-primary">Back</a>
                    </td>
                </tr>
            </tbody>
        </table>
    </div>
    <jsp:include page="footer.jsp"/>
</html>

