package com.uanl.medicina.dao;

import com.uanl.medicina.common.HibernateUtil;
import com.uanl.medicina.model.User;
import com.uanl.medicina.model.Role;
import java.io.Serializable;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.List;
import org.hibernate.HibernateException;
import org.hibernate.Query;

import org.hibernate.Session;
import org.springframework.beans.factory.annotation.Autowired;

/**
 *
 * @author JoseJuanReyes
 */
public class UserDao implements Serializable {

    public Boolean agregarUsuario(User user) {
        Session session = HibernateUtil.getSessionFactory().getCurrentSession();
        try {
            session.beginTransaction();
            session.save(user);
            session.getTransaction().commit();
            return true;
        } catch (HibernateException he) {
            session.getTransaction().rollback();
            System.out.println("" + he.getMessage());
            return false;
        }
    }

    public Boolean userUpdate(User user) {
        Session session = HibernateUtil.getSessionFactory().getCurrentSession();
        try {
            session.beginTransaction();
            session.update(user);
            session.getTransaction().commit();
            return true;
        } catch (HibernateException he) {
            session.getTransaction().rollback();
            return false;
        }
    }
    
    public Boolean deleteUser(User user) {
        Session session = HibernateUtil.getSessionFactory().getCurrentSession();
        try {
            session.beginTransaction();
            session.delete(user);
            session.getTransaction().commit();
            return true;
        } catch (HibernateException he) {
            session.getTransaction().rollback();
            return false;
        }
    }

    public List<List> listaUsuario() {
        List<List> result = null;
        Session session = HibernateUtil.getSessionFactory().getCurrentSession();
        try {
            session.beginTransaction();
            Query query = session.createQuery("SELECT new list(user.idUsuario, user.nombre, user.aPaterno, user.aMaterno, user.email, user.password, user.activo, role.roleId, role.description) FROM User user INNER JOIN user.roleList role");
            result = query.list();
            session.getTransaction().commit();
        } catch (HibernateException ex) {
            session.getTransaction().rollback();
        }
        return result;
    }

    public User getUserByUsername(String username) {
        User users = null;
        List<User> result = null;
        Session session = HibernateUtil.getSessionFactory().getCurrentSession();
        try {

            session.beginTransaction();

            Query query1 = session.createQuery("from User where email =?  ");
            query1.setParameter(0, username);
            result = query1.list();

            session.getTransaction().commit();
            for (User newUsers : result) {
                users = newUsers;
            }

        } catch (HibernateException ex) {
            session.getTransaction().rollback();
        }
        return users;
    }


    public List<List> getUserByEmail(String email) {
        List<List> listaResultados = null;
        Session session = HibernateUtil.getSessionFactory().getCurrentSession();
        try {
            session.beginTransaction();
            Query query = session.createQuery("SELECT new list(user.idUsuario, user.nombre, user.aPaterno, "
                    + "user.aMaterno, user.email, user.password"
                    + "user.activo) "
                    + "FROM User user INNER JOIN user.roleList role "
                    + "WHERE role.description = 'EDITOR' and user.email = ?");
            query.setParameter(0, email);
            if (!query.list().isEmpty()) {
                listaResultados = query.list();
            }
            session.getTransaction().commit();
        } catch (HibernateException he) {
            session.getTransaction().rollback();
            return null;
        }
        return listaResultados;
    }
    
    public List<List> getUserToSendMail() {
        List<List> listaResultados = null;
        Session session = HibernateUtil.getSessionFactory().getCurrentSession();
        try {
            session.beginTransaction();
            Query query = session.createQuery("SELECT new list(user.idUsuario, user.email, user.password)"
                    + "FROM User user INNER JOIN user.roleList role "
                    + "WHERE role.description = 'MAILSENDER'");
            query.setMaxResults(1);
            if (!query.list().isEmpty()) {
                listaResultados = query.list();
            }
            session.getTransaction().commit();
        } catch (HibernateException he) {
            session.getTransaction().rollback();
            return null;
        }
        return listaResultados;
    }
}
