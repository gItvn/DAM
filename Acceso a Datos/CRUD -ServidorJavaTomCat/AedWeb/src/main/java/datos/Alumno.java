package datos;

/**
 *
 * @author ymir
 */
public class Alumno {

    String nombre, apellidos, direccion, datosFamilia;
    int id, edad, curso, nota;


    public Alumno(String nombre, String apellidos, int edad, String direccion, int curso, String datosFamilia, int nota) {
        this.nombre = nombre;
        this.apellidos = apellidos;
        this.edad = edad;
        this.direccion = direccion;
        this.curso = curso;
        this.datosFamilia=datosFamilia;
        this.nota=nota;
    }

    public Alumno(int id, String nombre, String apellidos, int edad, String direccion, int curso, String datosFamilia, int nota) {
        this.id = id;
        this.nombre = nombre;
        this.apellidos = apellidos;
        this.edad = edad;
        this.direccion = direccion;
        this.curso = curso;
        this.datosFamilia = datosFamilia;
        this.nota=nota;
    }



    public int getId() {
        return this.id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getNombre() {
        return this.nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getApellidos() {
        return this.apellidos;
    }

    public void setApellidos(String apellidos) {
        this.apellidos = apellidos;
    }

    public String getDireccion() {
        return this.direccion;
    }

    public void setDireccion(String direccion) {
        this.direccion = direccion;
    }

    public int getCurso() {
        return this.curso;
    }

    public void setCurso(int curso) {
        this.curso = curso;
    }

    public String getDatosFamilia() {
        return this.datosFamilia;
    }

    public void setDatosFamilia(String datosFamilia) {
        this.datosFamilia = datosFamilia;
    }

    public int getEdad() {
        return this.edad;
    }

    public void setEdad(int edad) {
        this.edad = edad;
    }

    public int getNota() {
        return nota;
    }


    public String toString() {
        return "Alumno{ID=" + this.id + ", nombre=" + this.nombre + ", apellidos=" + this.apellidos + ", edad=" + this.edad + ", direccion=" + this.direccion + ", curso=" + this.curso + ", datosFamilia=" + this.datosFamilia + "}";
    }
}
