package com.uanl.medicina.controllers;

import com.uanl.medicina.model.Imagen;
import com.uanl.medicina.service.ImagenService;
import com.uanl.medicina.service.ResourcesService;
import java.io.File;
import java.io.IOException;
import java.net.URL;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

/**
 *
 * @author Abdiel Salas Pérez
 */
@Controller
public class ImagenController {

    @Autowired
    ImagenService imgSv;
    @Autowired
    ResourcesService rs;

    @RequestMapping(value = "uploadFile")
    public String sendMail(String nombre, String descripcion, String tipo, MultipartFile file, Integer activo, Integer userIdLogged, String where) throws IOException {

        String response = "";
        String nombreArchivo = saveFile(file, "");

        Imagen imagen = new Imagen();
        imagen.setNombre(rs.toUTF8(nombre));
        imagen.setActivo(activo);
        imagen.setTipo(tipo);
        imagen.setUrl(nombreArchivo);
        imagen.setDescripcion(rs.toUTF8(descripcion));
        rs.saveBitacora("Guadar", "Slider", userIdLogged);
        if (!nombreArchivo.equals("")) {
            if (!imgSv.agregarImagen(imagen)) {
                response = "redirect:/errorUpload";
            } else {
                response = "redirect:/home?start="+ where;
            }
        } else {
            response = "redirect:/errorUpload";
        }
        return response;
    }

    @RequestMapping(value = "errorUpload")
    public String errorUploadFile() {
        return "/gestion/recursos/error";
    }

    @RequestMapping(value = "editarImagenes")
    public @ResponseBody
    Boolean editImage(Imagen imagen) {
        return imgSv.actualizarImagen(imagen);
    }

    @RequestMapping(value = "editarImagen1")
    public String editarImagen1(Integer idImagen, String nombre, String descripcion, String tipo, MultipartFile file, Integer activo, String url, Integer userIdLogged, String where) throws IOException {
        System.out.println("Id Imagen: " + idImagen + " nombre " + nombre + " descripcion " + descripcion + " file: " + file.getName() + " activo: " + activo + " url: " + url + " logged: " + userIdLogged);
        String response = "";
        if(activo ==null){
            activo = 1;
        }
       String nombreArchivo = "";
        if (!file.isEmpty()) {
            nombreArchivo = saveFile(file, "");
        } else {
            nombreArchivo = url;
        }
        if(nombre==null){
            nombre = "";
        }
        if(descripcion==null){
            descripcion = "";
        }
        Imagen imagen = new Imagen();
        imagen.setIdImagen(idImagen);
        imagen.setNombre(rs.toUTF8(nombre));
        imagen.setActivo(activo);
        imagen.setTipo(tipo);
        imagen.setUrl(rs.toUTF8(nombreArchivo));
        imagen.setDescripcion(rs.toUTF8(descripcion));
        rs.saveBitacora("Actualizar", "Slider", userIdLogged);
        
        if (!nombreArchivo.equals("")) {
            if (imgSv.actualizarImagen(imagen)) {
                response = "redirect:/home?start=" + where;
            } else {
                response = "redirect:/errorUpload";
            }
        } else {
            response = "redirect:/errorUpload";
        }
        return response;
    }

    @RequestMapping(value = "eliminarImagen")
    public @ResponseBody
    Boolean deleteImage(Imagen imagen, Integer userIdLogged) {
        Boolean response = false;
        rs.saveBitacora("Eliminar", "Imagen", userIdLogged);
        if (imgSv.eliminarImagen(imagen)) {
            if (removeImagen(imagen.getUrl())) {
                response = true;
            }
        }
        return response;
    }

    @RequestMapping(value = "listarImagenes")
    public @ResponseBody
    List listarImagenes() {
        return imgSv.listaImagen();
    }

    public String saveFile(MultipartFile file, String nombreImagen) throws IOException {
        String Recurso = ImagenController.class.getSimpleName() + ".class";
        URL url = ImagenController.class.getResource(Recurso);
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
        rutaArchivo += "src/main/webapp/WEB-INF/resources/img/sliders/";
        rutaArchivo = rutaArchivo.replace("%20", " ");

        String formats[] = {"bmp", "gif", "jpg", "peg", "png"};
        String fileOriginalName = file.getOriginalFilename();
        Integer sizeFile = fileOriginalName.length();
        String formato = "";
        String nombreArchivo = "";
        if (!file.isEmpty()) {
            for (int i = 0; i < formats.length; i++) {
                if (fileOriginalName.substring(sizeFile - 3, sizeFile).equalsIgnoreCase(formats[i])) {
                    formato = formats[i];
                }
            }
        }

        if (!formato.equals("")) {
            byte[] bytes = file.getBytes();
            nombreArchivo = rs.getUuid() + "." + formato;
            Path path = Paths.get(rutaArchivo + nombreArchivo);
            Files.write(path, bytes);
            return nombreArchivo;
        } else {
            return "";
        }
    }

    public Boolean removeImagen(String nombre) {
        Boolean response = false;
        String Recurso = ImagenController.class.getSimpleName() + ".class";
        URL url = ImagenController.class.getResource(Recurso);
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
        rutaArchivo += "src/main/webapp/WEB-INF/resources/img/sliders/";
        rutaArchivo = rutaArchivo.replace("%20", " ");
        if (!nombre.equals("")) {
            File fileDel = new File(rutaArchivo + nombre);
            fileDel.delete();
            response = true;
        }
        return response;
    }
    
    @RequestMapping(value = "atulizarDescripcionImagen")
    public @ResponseBody Boolean atulizarDescripcionImagen(Imagen imagen, Integer userIdLogged) {
        rs.saveBitacora("Actualizar", "Titulo carrusel", userIdLogged);
        return imgSv.actualizarImagen(imagen);
    }
    
    @RequestMapping(value = "updateSocialMedia")
    public String updateSocialMedia(Integer idImagen, String nombre, String tipo, Integer activo, String url, String where) throws IOException {
        String response = "";
        
        Imagen imagen = new Imagen();
        imagen.setIdImagen(idImagen);
        imagen.setNombre(nombre);
        imagen.setActivo(activo);
        imagen.setTipo(tipo);
        imagen.setUrl(url);
        
            if (imgSv.actualizarImagen(imagen)) {
                response = "redirect:/home?start=" + where;
            } else {
                response = "redirect:/errorUpload";
            }
        
        return response;
    }
    
}
