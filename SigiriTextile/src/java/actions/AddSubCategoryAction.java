/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package actions;

import com.opensymphony.xwork2.ActionSupport;
import java.lang.Class;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Query;
import javax.servlet.ServletContext;
import javax.transaction.UserTransaction;
import models.Category;
import models.SubCategory;
import org.apache.struts2.ServletActionContext;

/**
 *
 * @author Pancha
 */
public class AddSubCategoryAction extends ActionSupport {

    private long catId;
    private String name;

    public long getCatId() {
        return catId;
    }

    public void setCatId(long catId) {
        this.catId = catId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    @Override
    public String execute() throws Exception {
        ServletContext scx = ServletActionContext.getServletContext();
        UserTransaction utx = (UserTransaction) scx.getAttribute("utx");
        EntityManagerFactory emf = (EntityManagerFactory) scx.getAttribute("emf");

        EntityManager em = emf.createEntityManager();
        utx.begin();
        Category cat= em.find(Category.class, catId);
        
        if(cat!=null){
            SubCategory subcat = new SubCategory();
            subcat.setCategory(cat);
            subcat.setName(name);            
            em.persist(subcat);
            utx.commit();
        }
        return SUCCESS;
    }
}
