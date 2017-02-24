/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

/**
 *
 * @author Aleja
 */
public class User {

////////////////////////////////// Properties //////////////////////////////////
    private int id;
    private String nif, password, voted;

////////////////////////////////// Constructs //////////////////////////////////
    /**
     *
     * @param nif
     */
    public User(String nif) {
        this.nif = nif;
    }

    /**
     *
     * @param nif
     * @param password
     */
    public User(String nif, String password) {
        this.nif = nif;
        this.password = password;
    }

//////////////////////////////// Common Methods ////////////////////////////////
    @Override
    public String toString() {
        return "User{" + "id=" + id + ", nif=" + nif + ", password=" + password + ", voted=" + voted + '}';
    }

///////////////////////////////// Get Methods //////////////////////////////////
    /**
     *
     * @return
     */
    public int getId() {
        return id;
    }

    /**
     *
     * @return
     */
    public String getNif() {
        return nif;
    }

    /**
     *
     * @return
     */
    public String getPassword() {
        return password;
    }

    /**
     *
     * @return
     */
    public String getVoted() {
        return voted;
    }

///////////////////////////////// Set Methods //////////////////////////////////
    /**
     *
     * @param id
     */
    public void setId(int id) {
        this.id = id;
    }

    /**
     *
     * @param nif
     */
    public void setNif(String nif) {
        this.nif = nif;
    }

    /**
     *
     * @param password
     */
    public void setPassword(String password) {
        this.password = password;
    }
    
    /**
     *
     * @param voted
     */
    public void setVoted(String voted) {
        this.voted = voted;
    }

//////////////////////////////// Push Methods //////////////////////////////////
//////////////////////////////// Drop Methods //////////////////////////////////
/////////////////////////////////// Methods ////////////////////////////////////
}
