/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package actions;

import com.opensymphony.xwork2.ActionSupport;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Query;
import javax.servlet.ServletContext;
import javax.transaction.UserTransaction;
import models.Category;
import models.SubCategory;
import models.Supplier;
import org.apache.struts2.ServletActionContext;

/**
 *
 * @author pancha
 */
public class SupplierOrderAction extends ActionSupport{

    private List<Supplier> suppList;
    private List<Category> catList;
    private List<SubCategory> subCatList;
    private List<SubCategory> itemList;

    @Override
    public String execute() throws Exception {
        ServletContext scx = ServletActionContext.getServletContext();
        UserTransaction utx = (UserTransaction) scx.getAttribute("utx");
        EntityManagerFactory emf = (EntityManagerFactory) scx.getAttribute("emf");
        EntityManager em = emf.createEntityManager();
        utx.begin();
        Query query = em.createQuery("SELECT s FROM Supplier s");
        suppList = query.getResultList();
        query = em.createQuery("SELECT c FROM Category c");
        catList = query.getResultList();
        query = em.createQuery("SELECT c FROM SubCategory c");
        subCatList = query.getResultList();
        query = em.createQuery("SELECT c FROM Item c");
        itemList = query.getResultList();
        utx.commit();

        return SUCCESS;
    }

    public List<SubCategory> getItemList() {
        return itemList;
    }

    public void setItemList(List<SubCategory> itemList) {
        this.itemList = itemList;
    }


    public List<SubCategory> getSubCatList() {
        return subCatList;
    }

    public void setSubCatList(List<SubCategory> subCatList) {
        this.subCatList = subCatList;
    }


    public List<Supplier> getSuppList() {
        return suppList;
    }

    public void setSuppList(List<Supplier> suppList) {
        this.suppList = suppList;
    }

    public List<Category> getCatList() {
        return catList;
    }

    public void setCatList(List<Category> catList) {
        this.catList = catList;
    }

    



}
