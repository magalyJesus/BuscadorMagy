/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.uanl.medicina.service;

import com.uanl.medicina.model.Bitacora;
import com.uanl.medicina.model.User;
import java.io.UnsupportedEncodingException;
import java.net.InetAddress;
import java.net.UnknownHostException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.text.SimpleDateFormat;
import java.util.Base64;
import java.util.Calendar;
import java.util.Date;
import java.util.UUID;
import org.apache.commons.codec.binary.Hex;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author Abdiel Salas Pérez
 */
@Service
public class ResourcesService {

    @Autowired
    BitacoraService bs;

    public String getEncryptSHA1(String password) {
        MessageDigest md = null;

        try {
            md = MessageDigest.getInstance("SHA-512");
            md.update(password.getBytes());
            byte[] mb = md.digest();
            md = MessageDigest.getInstance("SHA-1");
            md.update(password.getBytes());
            mb = md.digest();
            return String.valueOf(Hex.encodeHex(mb));
        } catch (NoSuchAlgorithmException e) {
            e.printStackTrace();
            return null;
        }
    }

    public String getUuid() {
        return "" + UUID.randomUUID();
    }

    public String encodeUuid(String uuid) {
        return Base64.getEncoder().encodeToString(("" + uuid).getBytes());
    }

    public String decodeUuid(String uuid) {
        byte[] decodedBytes = Base64.getDecoder().decode(uuid);
        return new String(decodedBytes);
    }

    public String dateRangeDate(Integer rango, String hora) {
        Date fecha = new Date();
        Calendar calendar = Calendar.getInstance();
        calendar.setTime(fecha); // Configuramos la fecha que se recibe	
        calendar.add(Calendar.DAY_OF_YEAR, rango);  // numero de días a añadir, o restar en caso de días<0        
        SimpleDateFormat formatoDeFecha = null;
        if (hora == null) {
            formatoDeFecha = new SimpleDateFormat("yyyy-MM-dd");
        } else {
            formatoDeFecha = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
        }

        return formatoDeFecha.format(calendar.getTime());
    }

    public String getHour12() {
        Date fecha = new Date();
        Calendar calendar = Calendar.getInstance();
        calendar.setTime(fecha); // Configuramos la fecha que se recibe	
        calendar.add(Calendar.HOUR, 0);  // numero de días a añadir, o restar en caso de días<0        
        SimpleDateFormat formatoDeFecha = null;
        formatoDeFecha = new SimpleDateFormat("hh:mm:ss aa");
        return formatoDeFecha.format(calendar.getTime());
    }

    public String getHour24() {
        Date date = new Date();
        date.setTime(date.getTime());
        SimpleDateFormat simpDate;
        simpDate = new SimpleDateFormat("kk:mm:ss");
        return simpDate.format(date);
    }

    public String toUTF8(String word) {
        try {
            return new String(word.getBytes(), "UTF-8");
        } catch (UnsupportedEncodingException ex) {
            return null;
        }
    }

    public String getIpAddress() throws UnknownHostException {
        String ipAddress = InetAddress.getLocalHost().getHostAddress();
        return ipAddress;
    }

    public Boolean saveBitacora(String accion, String modulo, Integer userIdLogged) {
        Bitacora bitacora = new Bitacora();
        bitacora.setAccion(accion);
        bitacora.setModulo(modulo);
        bitacora.setFecha(dateRangeDate(0, "Si"));
        bitacora.setIdUsuario(new User(userIdLogged));
        return bs.agregarBitacora(bitacora);
    }
}
