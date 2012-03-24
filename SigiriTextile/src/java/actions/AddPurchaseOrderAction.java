/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package actions;

import com.opensymphony.xwork2.ActionSupport;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Query;
import javax.servlet.ServletContext;
import javax.transaction.UserTransaction;
import models.Item;
import models.POItem;
import models.PurchaseOrder;
import models.Supplier;
import org.apache.struts2.ServletActionContext;

/**
 *
 * @author pancha
 */
public class AddPurchaseOrderAction extends ActionSupport{

private long suppId;
private String orderNo;
private String attention;
private String paymentTerm;
private String dates;
private String deliveryDate;
private String deliveryTo;

private long itemId[];
private String unit[];
private String qty[];
private String note;

    @Override
    public String execute() throws Exception {
        ServletContext scx = ServletActionContext.getServletContext();
        UserTransaction utx = (UserTransaction) scx.getAttribute("utx");
        EntityManagerFactory emf = (EntityManagerFactory) scx.getAttribute("emf");
        EntityManager em = emf.createEntityManager();

        utx.begin();
        PurchaseOrder po = new PurchaseOrder();

        Query query= em.createQuery("select s from Supplier s where s.id="+suppId);
        List<Supplier> list = query.getResultList();
        po.setSupplier(list.get(0));
        po.setOrderNo(orderNo);
        po.setAttention(attention);
        po.setPaymentTerm(paymentTerm);
        po.setDates(dates);
        po.setDeliveryDate(deliveryDate);
        po.setDeliveryTo(deliveryTo);
        Collection<POItem> poItems = new ArrayList<POItem>();
        for(int i=0;i<itemId.length;i++){
            POItem poitem = new POItem();
            poitem.setPurchaseOrder(po);
            poitem.setQty(qty[i]);
            poitem.setUnit(unit[i]);
            query = em.createQuery("select i from Item i where i.id="+itemId[i]);
            List<Item> items = query.getResultList();
            poitem.setItem(items.get(0));
            poItems.add(poitem);
        }
        po.setPOItems(poItems);
        em.persist(po);
        utx.commit();
        return SUCCESS;
    }




    public String getAttention() {
        return attention;
    }

    public void setAttention(String attention) {
        this.attention = attention;
    }

    public String getDates() {
        return dates;
    }

    public void setDates(String dates) {
        this.dates = dates;
    }

    public String getDeliveryDate() {
        return deliveryDate;
    }

    public void setDeliveryDate(String deliveryDate) {
        this.deliveryDate = deliveryDate;
    }

    public String getDeliveryTo() {
        return deliveryTo;
    }

    public void setDeliveryTo(String deliveryTo) {
        this.deliveryTo = deliveryTo;
    }

    public long[] getItemId() {
        return itemId;
    }

    public void setItemId(long[] itemId) {
        this.itemId = itemId;
    }

    public String getNote() {
        return note;
    }

    public void setNote(String note) {
        this.note = note;
    }

    public String getOrderNo() {
        return orderNo;
    }

    public void setOrderNo(String orderNo) {
        this.orderNo = orderNo;
    }

    public String getPaymentTerm() {
        return paymentTerm;
    }

    public void setPaymentTerm(String paymentTerm) {
        this.paymentTerm = paymentTerm;
    }

    public String[] getQty() {
        return qty;
    }

    public void setQty(String[] qty) {
        this.qty = qty;
    }

    public long getSuppId() {
        return suppId;
    }

    public void setSuppId(long suppId) {
        this.suppId = suppId;
    }

    public String[] getUnit() {
        return unit;
    }

    public void setUnit(String[] unit) {
        this.unit = unit;
    }






}
