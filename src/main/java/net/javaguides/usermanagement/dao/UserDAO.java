package net.javaguides.usermanagement.dao;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import net.javaguides.usermanagement.model.User;

public class UserDAO {

    private String jdbcURL = "jdbc:mysql://localhost/student?allowPublicKeyRetrieval=true&useSSL=false&serverTimezone=UTC";
    private String jdbcUsername = "root";
    private String jdbcPassword = "Selva123";

    private static final String INSERT_USERS_SQL =
        "INSERT INTO users (username, password, firstname, lastname, dob, address) VALUES (?, ?, ?, ?, ?, ?)";
    private static final String SELECT_USERS_BY_ID =
        "SELECT id, username, password, firstname, lastname, dob, address FROM users WHERE id = ?";
    private static final String SELECT_ALL_USERS = "SELECT * FROM users";
    private static final String UPDATE_USERS_SQL =
        "UPDATE users SET username = ?, password = ?, firstname = ?, lastname = ?, dob = ?, address = ? WHERE id = ?";
    private static final String DELETE_USERS_SQL =
        "DELETE FROM users WHERE id = ?";

    protected Connection getConnection() throws SQLException {
        Connection connection = null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            connection = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
            System.out.println("Database connected: " + connection);
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }
        return connection;
    }

    public void insertUser(User user) throws SQLException {
        System.out.println("Inserting user: " + user.getUserName());
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(INSERT_USERS_SQL)) {
            preparedStatement.setString(1, user.getUserName());
            preparedStatement.setString(2, user.getPassword());
            preparedStatement.setString(3, user.getFirstName());
            preparedStatement.setString(4, user.getLastName());
            preparedStatement.setString(5, user.getDob());
            preparedStatement.setString(6, user.getAddress());
            preparedStatement.executeUpdate();
            System.out.println("User inserted successfully");
        }
    }

    public boolean updateUser(User user) throws SQLException {
        boolean rowUpdated;
        try (Connection connection = getConnection();
             PreparedStatement statement = connection.prepareStatement(UPDATE_USERS_SQL)) {
            statement.setString(1, user.getUserName());
            statement.setString(2, user.getPassword());
            statement.setString(3, user.getFirstName());
            statement.setString(4, user.getLastName());
            statement.setString(5, user.getDob());
            statement.setString(6, user.getAddress());
            statement.setInt(7, user.getId());

            rowUpdated = statement.executeUpdate() > 0;
        }
        return rowUpdated;
    }

    public User selectUser(int id) throws SQLException {
        User user = null;
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_USERS_BY_ID)) {
            preparedStatement.setInt(1, id);
            ResultSet rs = preparedStatement.executeQuery();

            if (rs.next()) {
                String userName = rs.getString("username");
                String password = rs.getString("password");
                String firstName = rs.getString("firstname");
                String lastName = rs.getString("lastname");
                String dob = rs.getString("dob");
                String address = rs.getString("address");
                user = new User(id, userName, password, firstName, lastName, dob, address);
            }
        }
        return user;
    }

    public List<User> selectAllUsers() {
        List<User> users = new ArrayList<>();
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_USERS)) {
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("id");
                String userName = rs.getString("username");
                String password = rs.getString("password");
                String firstName = rs.getString("firstname");
                String lastName = rs.getString("lastname");
                String dob = rs.getString("dob");
                String address = rs.getString("address");
                users.add(new User(id, userName, password, firstName, lastName, dob, address));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return users;
    }

    public boolean deleteUser(int id) throws SQLException {
        boolean rowDeleted;
        try (Connection connection = getConnection();
             PreparedStatement statement = connection.prepareStatement(DELETE_USERS_SQL)) {
            statement.setInt(1, id);
            rowDeleted = statement.executeUpdate() > 0;
        }
        return rowDeleted;
    }
}
