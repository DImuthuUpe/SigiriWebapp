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
import models.Item;
import models.SubCategory;
import org.apache.struts2.ServletActionContext;

/**
 *
 * @author Pancha
 */
public class ItemConfigurationAction  extends ActionSupport{

    private List<Category> catlist;
    private List<SubCategory> subcatlist;
    private List<Item> itemlist;

    public List<Item> getItemlist() {
        return itemlist;
    }

    public void setItemlist(List<Item> itemlist) {
        this.itemlist = itemlist;
    }




    public List<SubCategory> getSubcatlist() {
        return subcatlist;
    }

    public void setSubcatlist(List<SubCategory> subcatlist) {
        this.subcatlist = subcatlist;
    }

    public List<Category> getCatlist() {
        return catlist;
    }

    public void setCatlist(List<Category> catlist) {
        this.catlist = catlist;
    }



    @Override
    public String execute() throws Exception {
        ServletContext scx = ServletActionContext.getServletContext();
        UserTransaction utx = (UserTransaction) scx.getAttribute("utx");
        EntityManagerFactory emf = (EntityManagerFactory) scx.getAttribute("emf");
        EntityManager em = emf.createEntityManager();
        utx.begin();
        Query query = em.createQuery("select cat from Category cat");
        catlist = query.getResultList();

        query = em.createQuery("select scat from SubCategory scat");
        subcatlist = query.getResultList();

        query = em.createQuery("select itm from Item itm");
        itemlist = query.getResultList();

        utx.commit();
//        for(int i=0;i<subcatlist.size();i++){
//            System.out.println(subcatlist.get(i).getName());
//        }
        //System.out.println("hooooooooo");
        return SUCCESS;
    }


}
