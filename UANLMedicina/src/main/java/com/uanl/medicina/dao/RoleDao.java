package com.uanl.medicina.dao;

import com.uanl.medicina.model.Role;
import com.uanl.medicina.common.HibernateUtil;
import java.io.Serializable;

import java.util.List;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;

public class RoleDao implements Serializable {

    public int addRole(Role role) {
        int id = 0;
        try {
            Session session = HibernateUtil.getSessionFactory().getCurrentSession();
            session.beginTransaction();

            session.save(role);
            id = role.getIdRole();
            session.getTransaction().commit();
            return id;
        } catch (HibernateException he) {
            return id;
        }
    }

    public List<Role> getAllRole() {
        List<Role> result = null;
        try {

            Session session = HibernateUtil.getSessionFactory().getCurrentSession();
            session.beginTransaction();
            result = (List<Role>) session.createQuery("from Role").list();
            session.getTransaction().commit();
        } catch (HibernateException ex) {
        }
        return result;
    }
//modificado por parametros

    public Role getRoleById(int IdRole) {
        Role roles = null;

        try {
            Session session = HibernateUtil.getSessionFactory().getCurrentSession();
            session.beginTransaction();
            Query query1 = session.createQuery("from Role where  IdRole =? ");
            query1.setParameter(0, IdRole);
            roles = (Role) query1.list();
            session.getTransaction().commit();

        } catch (HibernateException ex) {
        }

        return roles;
    }
}
