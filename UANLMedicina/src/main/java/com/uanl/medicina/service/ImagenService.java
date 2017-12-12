package com.uanl.medicina.service;

import com.uanl.medicina.dao.ImagenDao;
import com.uanl.medicina.model.Imagen;
import java.util.List;
import org.springframework.stereotype.Service;

/**
 *
 * @author Abdiel Salas Pérez
 */

@Service
public class ImagenService {
    
    public Boolean agregarImagen(Imagen imagen) {
        return new ImagenDao().agregarImagen(imagen);
    }
    
    public Boolean actualizarImagen(Imagen imagen) {
        return new ImagenDao().actualizarImagen(imagen);
    }
    
    public Boolean eliminarImagen(Imagen imagen) {
        return new ImagenDao().eliminarImagen(imagen);
    }
    
    public List listaImagen() {
        return new ImagenDao().listaImagen();
    }
    public Boolean atulizarDescripcionImagen(Imagen imagen) {
        return new ImagenDao().atulizarDescripcionImagen(imagen);
    }
}
