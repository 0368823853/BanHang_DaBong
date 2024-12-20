/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

/**
 *
 * @author ADMIN
 */
public class Adm_khachhang {
    private int idkh;
    private String tenkh;
    private String email;
    private String sdt;
    private String diachi;
    private String gioitinh;
    private String matkhau;
    private String img;

    public Adm_khachhang() {
    }

    public Adm_khachhang(int idkh, String tenkh, String email, String sdt, String diachi, String gioitinh, String matkhau, String img) {
        this.idkh = idkh;
        this.tenkh = tenkh;
        this.email = email;
        this.sdt = sdt;
        this.diachi = diachi;
        this.gioitinh = gioitinh;
        this.matkhau = matkhau;
        this.img = img;
    }

    public int getIdkh() {
        return idkh;
    }

    public void setIdkh(int idkh) {
        this.idkh = idkh;
    }

    public String getTenkh() {
        return tenkh;
    }

    public void setTenkh(String tenkh) {
        this.tenkh = tenkh;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getSdt() {
        return sdt;
    }

    public void setSdt(String sdt) {
        this.sdt = sdt;
    }

    public String getDiachi() {
        return diachi;
    }

    public void setDiachi(String diachi) {
        this.diachi = diachi;
    }

    public String getGioitinh() {
        return gioitinh;
    }

    public void setGioitinh(String gioitinh) {
        this.gioitinh = gioitinh;
    }

    public String getMatkhau() {
        return matkhau;
    }

    public void setMatkhau(String matkhau) {
        this.matkhau = matkhau;
    }

    public String getImg() {
        return img;
    }

    public void setImg(String img) {
        this.img = img;
    }
    
    
}
