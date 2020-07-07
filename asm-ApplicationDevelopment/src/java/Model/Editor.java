/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

/**
 *
 * @author Ngoc Do Minh
 */
public class Editor {

    public static String addTable(String msg) {
        String colorMsg = "<p>Your new password is :" + msg + ". Click <a href=\"http://localhost:8080/ApplicationDevelopment/Login.jsp\">here</a> to login";
        return colorMsg;
    }
}
