/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package models;

import javax.annotation.Resource;
import javax.persistence.EntityManagerFactory;
import javax.persistence.PersistenceUnit;
import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.transaction.UserTransaction;

/**
 *
 * @author pancha
 */
public class ApplicationListner implements ServletContextListener{
    @PersistenceUnit(unitName="SigiriTextilePU")
    EntityManagerFactory emf;

    @Resource
    UserTransaction utx;

    public void contextInitialized(ServletContextEvent sce) {
        ServletContext ctx = sce.getServletContext();
        ctx.setAttribute("emf",emf);
        ctx.setAttribute("utx",utx);

    }

    public void contextDestroyed(ServletContextEvent sce) {

    }
    
}
