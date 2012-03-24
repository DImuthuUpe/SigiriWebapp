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
import models.Supplier;
import org.apache.struts2.ServletActionContext;

/**
 *
 * @author Pancha
 */
public class ProcurementAction extends ActionSupport{
    private List<Supplier> list;

    public List<Supplier> getList() {
        return list;
    }

    public void setList(List<Supplier> list) {
        this.list = list;
    }

    @Override
    public String execute() throws Exception {
        ServletContext scx = ServletActionContext.getServletContext();
        UserTransaction utx = (UserTransaction) scx.getAttribute("utx");
        EntityManagerFactory emf = (EntityManagerFactory) scx.getAttribute("emf");
        EntityManager em = emf.createEntityManager();
        utx.begin();
        Query query = em.createQuery("SELECT s FROM Supplier s");
        list = query.getResultList();
        utx.commit();

        return SUCCESS;
    }

}
