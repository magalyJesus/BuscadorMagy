package com.uanl.medicina.dao;

import com.uanl.medicina.common.HibernateUtil;
import com.uanl.medicina.model.Busqueda;
import java.io.Serializable;

import java.util.List;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;

public class BusquedaDao implements Serializable {
    
    public List<List> listarBusqueda(String palabra) {
        List<List> result = null;
        Session session = HibernateUtil.getSessionFactory().getCurrentSession();
        try {
            session.beginTransaction();
            Query query = session.createQuery("FROM Busqueda WHERE titulo LIKE  CONCAT('%', ? , '%') OR resumen LIKE  CONCAT('%', ? , '%')");
            query.setParameter(0, palabra);
            query.setParameter(1, palabra);
            query.setMaxResults(20);
            result = query.list();
            session.getTransaction().commit();
        } catch (HibernateException ex) {
            session.getTransaction().rollback();
        }
        return result;
    }
    
    public List<List> buscar(String palabra) {
        List<List> result = null;
        Session session = HibernateUtil.getSessionFactory().getCurrentSession();
        try {
            session.beginTransaction();
            Query query = session.createQuery("FROM Busqueda WHERE resumen = ?");
            query.setParameter(0, palabra);
            query.setMaxResults(1);
            result = query.list();
            session.getTransaction().commit();
        } catch (HibernateException ex) {
            session.getTransaction().rollback();
        }
        return result;
    }
}
