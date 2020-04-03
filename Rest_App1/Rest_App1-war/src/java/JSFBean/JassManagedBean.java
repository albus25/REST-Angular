/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package JSFBean;

import javax.inject.Named;
import javax.enterprise.context.RequestScoped;
import javax.faces.context.FacesContext;
import javax.jms.Session;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Albus
 */
@Named(value = "jassManagedBean")
@RequestScoped
public class JassManagedBean {
    
    private String username,password,temp;

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getTemp() {
        return temp;
    }

    public void setTemp(String temp) {
        this.temp = temp;
    }
    
    public JassManagedBean() {
    }
    
    public String login()
    {
        try {
            temp = "";
            HttpServletRequest request = (HttpServletRequest) FacesContext.getCurrentInstance().getExternalContext().getRequest();
            HttpSession session = (HttpSession) FacesContext.getCurrentInstance().getExternalContext().getSession(true);
            request.login(username, password);
            
            if(request.isUserInRole("Admin"))
            {
                session.setAttribute("AdminName", username);
                return "/Admin/AdminL.xhtml";
            }
            else if(request.isUserInRole("User"))
            {
                session.setAttribute("UserName", username);
                return "/User/UserL.xhtml";
            }
            else
            {
                temp = "Either Login or Password is incorrect";
                return "login.xhtml";
            }
        } catch (Exception e) {
            temp = "Error";
        }
        
        return null;
    }
    
    public String logout()
    {
        HttpServletRequest request = (HttpServletRequest) FacesContext.getCurrentInstance().getExternalContext().getRequest();
        HttpSession session = (HttpSession) FacesContext.getCurrentInstance().getExternalContext().getSession(true);
        
        try {
            session.invalidate();
            request.logout();
            return "/faces/login.xhtml";
        } catch (Exception e) {
            temp = "Session is still running";
        }
        
        return null;
    }
  
}
