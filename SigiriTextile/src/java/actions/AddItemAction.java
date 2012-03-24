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
import models.Item;
import models.SubCategory;
import org.apache.struts2.ServletActionContext;

/**
 *
 * @author pancha
 */
public class AddItemAction extends ActionSupport{

    
    private long subCatId;

    private String[] id;
    private String[] name;
    private String[] type;
    private String[] purpose;
    private String[] reorder;

    public String[] getId() {
        return id;
    }

    public void setId(String[] id) {
        this.id = id;
    }

    public String[] getPurpose() {
        return purpose;
    }

    public void setPurpose(String[] purpose) {
        this.purpose = purpose;
    }

    public String[] getReorder() {
        return reorder;
    }

    public void setReorder(String[] reorder) {
        this.reorder = reorder;
    }

    public long getSubCatId() {
        return subCatId;
    }

    public void setSubCatId(long subCatId) {
        this.subCatId = subCatId;
    }

    

    public String[] getType() {
        return type;
    }

    public void setType(String[] type) {
        this.type = type;
    }

    public String[] getName() {
        return name;
    }

    public void setName(String[] name) {
        this.name = name;
    }   


    @Override
    public String execute() throws Exception {

        ServletContext scx = ServletActionContext.getServletContext();
        UserTransaction utx = (UserTransaction) scx.getAttribute("utx");
        EntityManagerFactory emf = (EntityManagerFactory) scx.getAttribute("emf");
        EntityManager em = emf.createEntityManager();

        utx.begin();
        for(int i=0;i<id.length;i++){
            Query query = em.createQuery("select scat from SubCategory scat where scat.id="+subCatId);
            List<SubCategory> list = query.getResultList();
            Item item = new Item();
            item.setSubCategory(list.get(0));
            item.setCode(id[i]);
            item.setName(name[i]);
            item.setPurpose(purpose[i]);
            item.setReorder(reorder[i]);
            item.setType(type[i]);
            em.persist(item);
        }
        utx.commit();

        return SUCCESS;
    }


}
