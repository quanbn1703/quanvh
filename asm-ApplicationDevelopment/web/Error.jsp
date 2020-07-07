<%-- 
    Document   : Error
    Created on : May 15, 2020, 12:58:34 PM
    Author     : Ngoc Do Minh
--%>

<%@taglib prefix="s" uri="/struts-tags"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <div style="text-align: center;">
        <h1><s:property value="msg"/></h1>
        <p>Press <a href="<s:property value="url"/>">here</a> to go back</p>
    </div>
</html>
