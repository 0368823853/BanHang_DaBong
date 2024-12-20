/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

/**
 *
 * @author ADMIN
 */
public class Adm_Login {
    private int maadmin;
    private String tenadmin;
    private String taikhoan;
    private String matkhau;
    private String email;

    public Adm_Login() {
    }

    public Adm_Login(String matkhau, String email) {
        this.matkhau = matkhau;
        this.email = email;
    }

    public int getMaadmin() {
        return maadmin;
    }

    public void setMaadmin(int maadmin) {
        this.maadmin = maadmin;
    }

    public String getTenadmin() {
        return tenadmin;
    }

    public void setTenadmin(String tenadmin) {
        this.tenadmin = tenadmin;
    }

    public String getTaikhoan() {
        return taikhoan;
    }

    public void setTaikhoan(String taikhoan) {
        this.taikhoan = taikhoan;
    }

    public String getMatkhau() {
        return matkhau;
    }

    public void setMatkhau(String matkhau) {
        this.matkhau = matkhau;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }
    
}
