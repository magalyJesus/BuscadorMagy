package com.uanl.medicina.dao;

import com.uanl.medicina.common.HibernateUtil;
import com.uanl.medicina.model.Bitacora;
import java.io.Serializable;

import java.util.List;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;

public class BitacoraDao implements Serializable {
    
    public Boolean agregarBitacora(Bitacora bitacora) {
        try {
            Session session = HibernateUtil.getSessionFactory().getCurrentSession();
            session.beginTransaction();
            session.save(bitacora);
            session.getTransaction().commit();
            return true;
        } catch (HibernateException he) {
            return false;
        }
    }
    
    public List<List> listaBitacora() {
        List<List> result = null;
        Session session = HibernateUtil.getSessionFactory().getCurrentSession();
        try {
            session.beginTransaction();
            Query query = session.createQuery("SELECT NEW LIST(bitacora.idBitacora, bitacora.accion, bitacora.modulo, bitacora.fecha, usuario.idUsuario, usuario.nombre, usuario.aPaterno, usuario.aMaterno, usuario.email) FROM Bitacora bitacora INNER JOIN bitacora.idUsuario usuario");
            result = query.list();
            session.getTransaction().commit();
        } catch (HibernateException ex) {
            session.getTransaction().rollback();
        }
        return result;
    }
}
