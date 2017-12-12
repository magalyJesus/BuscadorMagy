package com.uanl.medicina.dao;

import com.uanl.medicina.common.HibernateUtil;
import com.uanl.medicina.model.Menu;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.io.Serializable;
import java.net.URL;
import java.util.List;
import org.hibernate.HibernateException;
import org.hibernate.Query;

import org.hibernate.Session;

/**
 *
 * @author Abdiel Salas Pérez
 */
public class MenuDao implements Serializable {

    public Boolean agregarMenu(Menu menu) throws IOException {
        Session session = HibernateUtil.getSessionFactory().getCurrentSession();
        try {
            if (menu.getTipo().equals("S")) {
                String Recurso = MenuDao.class.getSimpleName() + ".class";
                URL url = MenuDao.class.getResource(Recurso);
                String split[] = url.toString().split("/");
                split[0] = "";
                String rutaArchivo = "";
                Boolean found = false;
                for (Integer i = 1; i < split.length; i++) {
                    if (found == false) {
                        if (split[i].equals("UANLMedicina")) {
                            found = true;
                            rutaArchivo += split[i] + "/";
                            rutaArchivo += split[i + 1] + "/";
                        } else {
                            rutaArchivo += split[i] + "/";
                        }
                    }
                }
                rutaArchivo += "src/main/webapp/WEB-INF/jsp/authentication/jspbymenus/";
                menu.setRuta("jspbymenus/" + menu.getNombre() + ".jsp");
                menu.setNombre(menu.getNombre() + ".jsp");
                String ruta = rutaArchivo.replace("%20", " ") + menu.getNombre() + ".jsp";
                File archivo = new File(ruta);
                BufferedWriter bw;
                if (archivo.exists()) {
                    bw = new BufferedWriter(new FileWriter(archivo));
                    bw.write("<%-- \n" + "    Author : Abdiel Salas Pérez\n" + "--%>");
                } else {
                    bw = new BufferedWriter(new FileWriter(archivo));
                    bw.write("<%-- \n" + "    Author : Abdiel Salas Pérez\n" + "--%>");
                }
                bw.close();
            } else {
                menu.setRuta("#");
            }
            session.beginTransaction();
            session.save(menu);
            session.getTransaction().commit();
            return true;
        } catch (HibernateException he) {
            session.getTransaction().rollback();
            return false;
        }
    }

    public Boolean actualizarMenu(Menu menu) {
        Session session = HibernateUtil.getSessionFactory().getCurrentSession();
        try {
            session.beginTransaction();
            session.update(menu);
            session.getTransaction().commit();
            return true;
        } catch (HibernateException he) {
            session.getTransaction().rollback();
            return false;
        }
    }

    public Boolean eliminarMenu(Menu menu) {
        Session session = HibernateUtil.getSessionFactory().getCurrentSession();
        try {
            session.beginTransaction();
            session.delete(menu);
            session.getTransaction().commit();
            return true;
        } catch (HibernateException he) {
            session.getTransaction().rollback();
            return false;
        }
    }

    public List<List> listaMenu() {
        List<List> result = null;
        Session session = HibernateUtil.getSessionFactory().getCurrentSession();
        try {
            session.beginTransaction();
            Query query = session.createQuery("FROM Menu");
            result = query.list();
            session.getTransaction().commit();
        } catch (HibernateException ex) {
            session.getTransaction().rollback();
        }
        return result;
    }

//modificado por parametros
    public Menu obtenerMenuPorId(Integer idMenu) {
        Menu menu = null;
        List<Menu> result = null;
        Session session = HibernateUtil.getSessionFactory().getCurrentSession();
        try {
            session.beginTransaction();
            Query query1 = session.createQuery("FROM Menu WHERE idMenu = ?");
            query1.setParameter(0, idMenu);
            result = query1.list();

            session.getTransaction().commit();
            for (Menu newUsers : result) {
                menu = newUsers;
            }

        } catch (HibernateException ex) {
        }

        return menu;
    }
}
