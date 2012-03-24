/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package actions;

import com.opensymphony.xwork2.ActionSupport;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.servlet.ServletContext;
import javax.transaction.UserTransaction;
import models.Customer;
import org.apache.struts2.ServletActionContext;

/**
 *
 * @author pancha
 */
public class AddCustomerAction extends ActionSupport{
    
    private String name;
    private String address;
    private String vatNumber;
    private String svatNumber;
    private String tqbNumber;
    private String telephone;
    private String fax;
    private String owner;

    public String getOwner() {
        return owner;
    }

    public void setOwner(String owner) {
        this.owner = owner;
    }

    public String getFax() {
        return fax;
    }

    public void setFax(String fax) {
        this.fax = fax;
    }

    public String getTelephone() {
        return telephone;
    }

    public void setTelephone(String telephone) {
        this.telephone = telephone;
    }

    public String getTqbNumber() {
        return tqbNumber;
    }

    public void setTqbNumber(String tqbNumber) {
        this.tqbNumber = tqbNumber;
    }

    public String getSvatNumber() {
        return svatNumber;
    }

    public void setSvatNumber(String svatNumber) {
        this.svatNumber = svatNumber;
    }

    public String getVatNumber() {
        return vatNumber;
    }

    public void setVatNumber(String vatNumber) {
        this.vatNumber = vatNumber;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
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
        Customer customer = new Customer();
        customer.setName(name);
        customer.setAddress(address);
        customer.setSvatnumber(svatNumber);
        customer.setVatnumber(vatNumber);
        //System.out.println(telephone);
        customer.setTelephone(telephone);
        customer.setTqbnumber(tqbNumber);
        customer.setFax(fax);
        customer.setOwner(owner);
        customer.setDeleted(false);
        EntityManager em = emf.createEntityManager();
        utx.begin();
        em.persist(customer);
        utx.commit();
        return SUCCESS;
    }
    
}
