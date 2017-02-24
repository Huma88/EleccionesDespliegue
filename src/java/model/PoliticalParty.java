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
public class PoliticalParty {
////////////////////////////////// Properties //////////////////////////////////

    private String name;
    private String logo;
    private int votes;

////////////////////////////////// Constructs //////////////////////////////////
    /**
     *
     * @param name
     * @param logo
     */
    public PoliticalParty(String name, String logo) {
        this.name = name;
        this.logo = logo;
        this.votes = 0;
    }

    /**
     *
     * @param name
     */
    public PoliticalParty(String name) {
        this.name = name;
    }

//////////////////////////////// Common Methods ////////////////////////////////
    /**
     *
     * @return
     */
    @Override
    public String toString() {
        return "PoliticalParty{" + "name=" + name + ", logo=" + logo + ", votes=" + votes + '}';
    }

///////////////////////////////// Get Methods //////////////////////////////////
    /**
     *
     * @return
     */
    public String getName() {
        return name;
    }

    /**
     *
     * @return
     */
    public String getLogo() {
        return logo;
    }

    /**
     *
     * @return
     */
    public int getVotes() {
        return votes;
    }

///////////////////////////////// Set Methods //////////////////////////////////
    /**
     *
     * @param name
     */
    public void setName(String name) {
        this.name = name;
    }

    /**
     *
     * @param logo
     */
    public void setLogo(String logo) {
        this.logo = logo;
    }

    /**
     *
     * @param votes
     */
    public void setVotes(int votes) {
        this.votes = votes;
    }

//////////////////////////////// Push Methods //////////////////////////////////
//////////////////////////////// Drop Methods //////////////////////////////////
/////////////////////////////////// Methods ////////////////////////////////////
}
