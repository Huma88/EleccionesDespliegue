/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import model.*;
import java.sql.*;
import java.util.ArrayList;

/**
 *
 * @author Aleja
 */
public class Operation {

////////////////////////////////// Properties //////////////////////////////////
    private static Operation operation = null;
    private Connection connection;
////////////////////////////////// Constructs //////////////////////////////////

    private Operation() {
        try {
            connection = DBConnection.GetConexion().GetCon();
        } catch (ClassNotFoundException | SQLException cnfe) {

        }
    }
    //////////////////////////////// Common Methods ////////////////////////////////

    public synchronized static Operation getOperation() {
        if (operation == null) {
            operation = new Operation();
        }
        return operation;
    }

/////////////////////////////////// Methods ////////////////////////////////////
    public int getIdByNif(String nif) {
        String sqlOrder = "SELECT id";
        sqlOrder += " FROM user";
        sqlOrder += " WHERE nif = ?";
        try {
            PreparedStatement prepStm = connection.prepareCall(sqlOrder);
            prepStm.setString(1, nif);
            ResultSet rs = prepStm.executeQuery();
            String a = rs.getNString("id");
            if (rs.next()) {
                return Integer.parseInt(rs.getNString("id"));
            } else {
                String b;
            }
        } catch (SQLException sqle) {
        }
        return -1;
    }

    public String userHasVoted(User user)
            throws SQLException {
        String sqlOrder = "SELECT voted";
        sqlOrder += " FROM user";
        sqlOrder += " WHERE nif = ?";
        PreparedStatement prepStm = connection.prepareStatement(sqlOrder);
        prepStm.setString(1, user.getNif());
        ResultSet rs = prepStm.executeQuery();
        rs.next();
        return rs.getNString("voted");
    }

    public boolean loginUser(User user)
            throws SQLException {
        String sqlOrder = "SELECT *";
        sqlOrder += " FROM user";
        sqlOrder += " WHERE nif = ?";
        sqlOrder += " AND password = AES_ENCRYPT(?,'encripted')";
        PreparedStatement prepStm = connection.prepareCall(sqlOrder);
        prepStm.setString(1, user.getNif());
        prepStm.setString(2, user.getPassword());
        ResultSet rs = prepStm.executeQuery();
        if (rs.next()) {
            return true;
        }
        return false;
    }

    public boolean registerUser(User user)
            throws SQLException {
        String sqlOrder = "INSERT INTO user(nif,password)";
        sqlOrder += " VALUES(?,AES_ENCRYPT(?,'encripted'))";
        PreparedStatement prepStm = connection.prepareCall(sqlOrder);
        prepStm.setString(1, user.getNif());
        prepStm.setString(2, user.getPassword());
        prepStm.executeUpdate();
//            prepStm.close();
        return true;
    }

    public boolean unsubscribeUser(User user) {
        try {
            String sqlOrder = "DELETE FROM user";
            sqlOrder += " WHERE nif = ?";
            PreparedStatement prepStm = connection.prepareCall(sqlOrder);
            prepStm.setString(1, user.getNif());
            prepStm.executeUpdate();
//            prepStm.close();
            return true;
        } catch (SQLException sqle) {
        }
        return false;
    }

    public ArrayList getElectoralCensus()
            throws SQLException {
        ArrayList<User> census = new ArrayList<User>();
        User user;
        String sqlOrder = "SELECT *";
        sqlOrder += " FROM user";
        PreparedStatement prepStm = connection.prepareCall(sqlOrder);
        ResultSet rs = prepStm.executeQuery();
        while (rs.next()) {
            user = new User(rs.getNString("nif"));
            user.setVoted(rs.getNString("voted"));
            census.add(user);

        }
        return census;
    }

    public boolean vote(User user, PoliticalParty party)
            throws SQLException {
        this.addVote(party);
        this.userVoted(user);
        return true;
    }

    private boolean addVote(PoliticalParty party)
            throws SQLException {
        try {
            String sqlOrder = "UPDATE politicalparty";
            sqlOrder += " SET votes = votes + 1";
            sqlOrder += " WHERE name = ?";
            PreparedStatement prepStm = connection.prepareStatement(sqlOrder);
            prepStm.setString(1, party.getName());
            prepStm.executeUpdate();
//            prepStm.close();
            return true;
        } catch (SQLException sqle) {
        }
        return false;
    }

    private boolean userVoted(User user)
            throws SQLException {
        String sqlOrder = "UPDATE user";
        sqlOrder += " SET voted = 'Y'";
        sqlOrder += " WHERE nif = ?";
        PreparedStatement prepStm = connection.prepareStatement(sqlOrder);
        prepStm.setString(1, user.getNif());
        prepStm.executeUpdate();
//            prepStm.close();
        return true;
    }

    public ArrayList getScrutiny()
            throws SQLException {
        ArrayList<PoliticalParty> scrutiny = new ArrayList<PoliticalParty>();
        PoliticalParty party;
        String sqlOrder = "SELECT *";
        sqlOrder += " FROM politicalparty";
        PreparedStatement prepStm = connection.prepareCall(sqlOrder);
        ResultSet rs = prepStm.executeQuery();
        while (rs.next()) {
            party = new PoliticalParty(rs.getNString("name"), rs.getNString("logo"));
            party.setVotes(rs.getInt("votes"));
            scrutiny.add(party);

        }
        return scrutiny;
    }
}
