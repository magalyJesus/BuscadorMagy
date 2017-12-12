package com.uanl.medicina.dao;

import com.uanl.medicina.model.Role;
import com.uanl.medicina.common.HibernateUtil;
import com.uanl.medicina.model.Imagen;
import java.io.Serializable;

import java.util.List;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;

public class ImagenDao implements Serializable {

    public Boolean agregarImagen(Imagen imagen) {
        int id = 0;
        try {
            Session session = HibernateUtil.getSessionFactory().getCurrentSession();
            session.beginTransaction();
            session.save(imagen);
            session.getTransaction().commit();
            return true;
        } catch (HibernateException he) {
            return false;
        }
    }
    public Boolean actualizarImagen(Imagen imagen) {
        Session session = HibernateUtil.getSessionFactory().getCurrentSession();
        try {
            session.beginTransaction();
            session.update(imagen);
            session.getTransaction().commit();
            return true;
        } catch (HibernateException he) {
            session.getTransaction().rollback();
            return false;
        }
    }
    public Boolean eliminarImagen(Imagen imagen) {
        Session session = HibernateUtil.getSessionFactory().getCurrentSession();
        try {
            session.beginTransaction();
            session.delete(imagen);
            session.getTransaction().commit();
            return true;
        } catch (HibernateException he) {
            session.getTransaction().rollback();
            return false;
        }
    }

    public List<List> listaImagen() {
        List<List> result = null;
        Session session = HibernateUtil.getSessionFactory().getCurrentSession();
        try {
            session.beginTransaction();
            Query query = session.createQuery("FROM Imagen ORDER BY activo");
            result = query.list();
            session.getTransaction().commit();
        } catch (HibernateException ex) {
            session.getTransaction().rollback();
        }
        return result;
    }
    
    public Boolean atulizarDescripcionImagen(Imagen imagen) {
        Session session = HibernateUtil.getSessionFactory().getCurrentSession();
        try {
            session.beginTransaction();

            Query query = session.createQuery("UPDATE Imagen SET descripcion = ? WHERE idImagen = ?");
            query.setParameter(0, imagen.getDescripcion());
            query.setParameter(1, imagen.getIdImagen());

            query.executeUpdate();
            session.getTransaction().commit();
            return true;
        } catch (HibernateException he) {
            session.getTransaction().rollback();
            return false;
        }
    }
}
