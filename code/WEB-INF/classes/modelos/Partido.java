package modelos;

public class Partido {

    private int id_partido;
    private String fecha;

    public Partido() {
    }

    public Partido(int id_partido, String fecha) {
        this.id_partido = id_partido;
        this.fecha = fecha;
    }

    public int getId_partido() {
        return id_partido;
    }

    public void setId_partido(int id_partido) {
        this.id_partido = id_partido;
    }

    public String getFecha() {
        return fecha;
    }

    public void setFecha(String fecha) {
        this.fecha = fecha;
    }
}
