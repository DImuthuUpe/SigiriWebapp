/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package actions;

import com.opensymphony.xwork2.ActionSupport;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Query;
import javax.servlet.ServletContext;
import javax.transaction.UserTransaction;
import models.Item;
import models.SubCategory;
import org.apache.struts2.ServletActionContext;

/**
 *
 * @author pancha
 */
public class EditItemAction extends ActionSupport{
    private Item item;
    private long subcatId;

    public long getSubcatId() {
        return subcatId;
    }

    public void setSubcatId(long subcatId) {
        this.subcatId = subcatId;
    }

    public Item getItem() {
        return item;
    }

    public void setItem(Item item) {
        this.item = item;
    }

    @Override
    public String execute() throws Exception {
        ServletContext scx = ServletActionContext.getServletContext();
        UserTransaction utx = (UserTransaction) scx.getAttribute("utx");
        EntityManagerFactory emf = (EntityManagerFactory) scx.getAttribute("emf");
        EntityManager em = emf.createEntityManager();
        utx.begin();
        Query query = em.createQuery("select subcat from SubCategory subcat where subcat.id="+subcatId);
        List<SubCategory> list= query.getResultList();
        item.setSubCategory(list.get(0));
               
        em.merge(item);
        utx.commit();
        return SUCCESS;
    }



}
