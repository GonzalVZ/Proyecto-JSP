package modelos;

public class Usuario {

    private int id_usuario;
    private String email;
    private String password;
    private int puntos;

    public Usuario() {
    }

    public Usuario(int id_usuario, String email, String password, int puntos) {
        this.id_usuario = id_usuario;
        this.email = email;
        this.password = password;
        this.puntos = puntos;
    }

    public int getId_usuario() {
        return id_usuario;
    }

    public void setId_usuario(int id_usuario) {
        this.id_usuario = id_usuario;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public int getPuntos() {
        return puntos;
    }

    public void setPuntos(int puntos) {
        this.puntos = puntos;
    }
}
