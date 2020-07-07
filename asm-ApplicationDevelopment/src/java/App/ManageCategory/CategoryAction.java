/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package App.ManageCategory;

import Entity.Category;
import Model.CategoryDataProcess;
import com.opensymphony.xwork2.ActionSupport;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Ngoc Do Minh
 */
public class CategoryAction extends ActionSupport {
    private String categoryID;
    private String categoryName;
    private String categoryDescription;
    private List<Category> listCategory = new ArrayList<Category>();
    private List<Category> listCategory1 = new ArrayList<Category>();
    private Category category;
    private String action;
    private String msg;
    private String url;
    private String searchContent;

    public String getSearchContent() {
        return searchContent;
    }

    public void setSearchContent(String searchContent) {
        this.searchContent = searchContent;
    }

    public List<Category> getListCategory1() {
        return listCategory1;
    }

    public void setListCategory1(List<Category> listCategory1) {
        this.listCategory1 = listCategory1;
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public String getAction() {
        return action;
    }

    public void setAction(String action) {
        this.action = action;
    }
    
    public Category getCategory() {
        return category;
    }

    public void setCategory(Category category) {
        this.category = category;
    }

    public String getCategoryID() {
        return categoryID;
    }

    public void setCategoryID(String categoryID) {
        this.categoryID = categoryID;
    }

    public String getCategoryName() {
        return categoryName;
    }

    public void setCategoryName(String categoryName) {
        this.categoryName = categoryName;
    }

    public String getCategoryDescription() {
        return categoryDescription;
    }

    public void setCategoryDescription(String categoryDescription) {
        this.categoryDescription = categoryDescription;
    }

    public List<Category> getListCategory() {
        return listCategory;
    }

    public void setListCategory(List<Category> listCategory) {
        this.listCategory = listCategory;
    }
    
    public CategoryAction() {
    }
    
    public String getData() throws Exception {
        CategoryDataProcess categoryDataProcess = new CategoryDataProcess();
        listCategory = categoryDataProcess.getData();
        return "CATEGORYLIST";
    }
    
    public String getDataByID()
    {
        CategoryDataProcess categoryDataProcess = new CategoryDataProcess();
        category = categoryDataProcess.getDataByID(categoryID);
        if (("Update").equals(action))
        {
            return "DETAILCATEGORYFORUPDATE";
        }
        return "DETAILCATEGORYFORVIEW";
    }
    
    public String addCategory()
    {
        CategoryDataProcess categoryDataProcess = new CategoryDataProcess();
        if (categoryDataProcess.addCategory(categoryID, categoryName, categoryDescription))
        {
            msg = "Successfully add new category";
            return "ADDCATEGORYSUCCESS";
        }
        msg = "Cannot add new category";
        url = "loadCategory.action";
        return "ADDCATEGORYFAILED";
    }
    public String deleteCategory()
    {
        CategoryDataProcess categoryDataProcess = new CategoryDataProcess();
        if (categoryDataProcess.deleteCategory(categoryID))
        {
            msg = "Successfully deleted";
            return "DELETESUCCESS";
        }
        msg = "Cannot delete this category";
        url = "loadCategory.action";
        return "DELETEFAILED";
    }
    public String searchCategory()
    {
        CategoryDataProcess categoryDataProcess = new CategoryDataProcess();
        listCategory1 = categoryDataProcess.searchCategoryByName(searchContent);
        return "SEARCHLIST";
    }
    public String loadAddCategoryForm()
    {
        CategoryDataProcess categoryDataProcess = new CategoryDataProcess();
        categoryID = categoryDataProcess.generateCategoryID();
        return "LISTFORCHECK";
    }
    public String updateCategory()
    {
        CategoryDataProcess categoryDataProcess = new CategoryDataProcess();
        if (categoryDataProcess.updateCategory(categoryID, categoryName, categoryDescription))
        {
            msg = "Successfully updated";
            return "UPDATESUCCESS";
        }
        msg = "Cannot update category";
        url = "loadDetailCategory.action?action=Update&categoryID=" + categoryID;
        return "UPDATEFAILED";
    }
    public String checkCategoryName()
    {
        CategoryDataProcess categoryDataProcess = new CategoryDataProcess();
        if (categoryDataProcess.checkCategoryName(categoryName))
        {
            msg = "This name is available";
            return "VALID";
        }
        msg = "This name already exists on the system";
        return "INVALID";
    }
}
