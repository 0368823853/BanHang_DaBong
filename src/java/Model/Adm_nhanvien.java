/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

/**
 *
 * @author ADMIN
 */
public class Adm_nhanvien {
    private int idnv;
    private String tennv;
    private String email;
    private String matkhau;

    public Adm_nhanvien() {
    }

    public Adm_nhanvien(int idnv, String tennv, String email, String matkhau) {
        this.idnv = idnv;
        this.tennv = tennv;
        this.email = email;
        this.matkhau = matkhau;
    }

    public int getIdnv() {
        return idnv;
    }

    public void setIdnv(int idnv) {
        this.idnv = idnv;
    }

    public String getTennv() {
        return tennv;
    }

    public void setTennv(String tennv) {
        this.tennv = tennv;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getMatkhau() {
        return matkhau;
    }

    public void setMatkhau(String matkhau) {
        this.matkhau = matkhau;
    }
    
    
}
