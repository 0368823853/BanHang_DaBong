/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

/**
 *
 * @author ADMIN
 */
public class Ctm_cart {
    private int idcart;
    private int idkh;
    private int idsp;
    private String tenp;
    private String img;
    private int soluong;
    private float dongia;
    private float totalPrice;

    public Ctm_cart() {
    }

    public Ctm_cart(int idcart, int idkh, int idsp, String tenp, String img, int soluong, float dongia, float totalPrice) {
        this.idcart = idcart;
        this.idkh = idkh;
        this.idsp = idsp;
        this.tenp = tenp;
        this.img = img;
        this.soluong = soluong;
        this.dongia = dongia;
        this.totalPrice = totalPrice;
    }

    public int getIdcart() {
        return idcart;
    }

    public void setIdcart(int idcart) {
        this.idcart = idcart;
    }

    public int getIdkh() {
        return idkh;
    }

    public void setIdkh(int idkh) {
        this.idkh = idkh;
    }

    public int getIdsp() {
        return idsp;
    }

    public void setIdsp(int idsp) {
        this.idsp = idsp;
    }

    public String getTenp() {
        return tenp;
    }

    public void setTenp(String tenp) {
        this.tenp = tenp;
    }

    public String getImg() {
        return img;
    }

    public void setImg(String img) {
        this.img = img;
    }

    public int getSoluong() {
        return soluong;
    }

    public void setSoluong(int soluong) {
        this.soluong = soluong;
    }

    public float getDongia() {
        return dongia;
    }

    public void setDongia(float dongia) {
        this.dongia = dongia;
    }

    public float getTotalPrice() {
        return totalPrice;
    }

    public void setTotalPrice(float totalPrice) {
        this.totalPrice = totalPrice;
    }
    
}
